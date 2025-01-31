{ config, lib, options, pkgs, sane-lib, ... }:

let
  sane-user-cfg = config.sane.user;
  cfg = config.sane.users;
  path-lib = sane-lib.path;
  serviceType = with lib; types.submodule ({ config, ... }: {
    options = {
      description = mkOption {
        type = types.str;
      };
      documentation = mkOption {
        type = types.listOf types.str;
        default = [];
        description = ''
          references and links for where to find documentation about this service.
        '';
      };
      depends = mkOption {
        type = types.listOf types.str;
        default = [];
      };
      dependencyOf = mkOption {
        type = types.listOf types.str;
        default = [];
      };
      partOf = mkOption {
        type = types.listOf types.str;
        default = [];
        description = ''
          "bundles" to which this service belongs.
          e.g. `partOf = [ "default" ];` describes services which should be started "by default".
        '';
      };

      command = mkOption {
        type = types.nullOr (types.coercedTo types.package toString types.str);
        default = null;
        description = ''
          long-running command which represents this service.
          when the command returns, the service is considered "failed", and restarted unless explicitly `down`d.
        '';
      };
      cleanupCommand = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          command which is run after the service has exited.
          restart of the service (if applicable) is blocked on this command.
        '';
      };
      startCommand = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          command which is run to start the service.
          this command is expected to exit once the service is up, contrary to the normal `command` argument.
          mutually exclusive to `command`.
        '';
      };
      readiness.waitCommand = mkOption {
        type = types.nullOr (types.coercedTo types.package toString types.str);
        default = null;
        description = ''
          command or path to executable which exits zero only when the service is ready.
          this may be invoked repeatedly (with delay),
          though it's not an error for it to block either (it may, though, be killed and restarted if it blocks too long)
        '';
      };
      readiness.waitDbus = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          name of the dbus name this service is expected to register.
          only once the name is registered will the service be considered "ready".
        '';
      };
      readiness.waitExists = mkOption {
        type = types.coercedTo types.str toList (types.listOf types.str);
        default = [];
        description = ''
          path to a directory or file whose existence signals the service's readiness.
          this is expanded as a shell expression, and may contain variables like `$HOME`, etc.
        '';
      };
    };
    config = {
      readiness.waitCommand = lib.mkMerge [
        (lib.mkIf (config.readiness.waitDbus != null)
          ''${pkgs.systemdMinimal}/bin/busctl --user status "${config.readiness.waitDbus}" > /dev/null''
        )
        (lib.mkIf (config.readiness.waitExists != [])
          # e.g.: test -e /foo -a -e /bar
          ("test -e " + (lib.concatStringsSep " -a -e " config.readiness.waitExists))
        )
      ];
    };
  });
  userOptions = {
    options = with lib; {
      fs = mkOption {
        # map to listOf attrs so that we can allow multiple assigners to the same path
        # w/o worrying about merging at this layer, and defer merging to modules/fs instead.
        type = types.attrsOf (types.coercedTo types.attrs (a: [ a ]) (types.listOf types.attrs));
        default = {};
        description = ''
          entries to pass onto `sane.fs` after prepending the user's home-dir to the path
          and marking them as wanted.
          e.g. `sane.users.colin.fs."/.config/aerc" = X`
          => `sane.fs."/home/colin/.config/aerc" = { wantedBy = [ "multi-user.target"]; } // X;

          conventions are similar as to toplevel `sane.fs`. so `sane.users.foo.fs."/"` represents the home directory,
          whereas every other entry is expected to *not* have a trailing slash.

          option merging happens inside `sane.fs`, so `sane.users.colin.fs."foo" = A` and `sane.fs."/home/colin/foo" = B`
          behaves identically to `sane.fs."/home/colin/foo" = lib.mkMerge [ A B ];
          (the unusual signature for this type is how we delay option merging)
        '';
      };

      persist = mkOption {
        type = options.sane.persist.sys.type;
        default = {};
        description = ''
          entries to pass onto `sane.persist.sys` after prepending the user's home-dir to the path.
        '';
      };

      environment = mkOption {
        type = types.attrsOf types.str;
        default = {};
        description = ''
          environment variables to place in user's shell profile.
          these end up in ~/.profile
        '';
      };

      services = mkOption {
        type = types.attrsOf serviceType;
        default = {};
        description = ''
          services to define for this user.
        '';
      };
    };
  };
  userModule = let
    nixConfig = config;
  in with lib; types.submodule ({ name, config, ... }: {
    options = userOptions.options // {
      default = mkOption {
        type = types.bool;
        default = false;
        description = ''
          only one default user may exist.
          this option determines what the `sane.user` shorthand evaluates to.
        '';
      };

      home = mkOption {
        type = types.str;
        # XXX: we'd prefer to set this to `config.users.users.home`, but that causes infinite recursion...
        # TODO: maybe assert that this matches the actual home?
        default = "/home/${name}";
      };
    };

    config = lib.mkMerge [
      # if we're the default user, inherit whatever settings were routed to the default user
      (lib.mkIf config.default {
        inherit (sane-user-cfg) fs persist environment;
        services = lib.mapAttrs (_: lib.mkMerge) sane-user-cfg.services;
      })
      {
        fs."/".dir.acl = {
          user = lib.mkDefault name;
          group = lib.mkDefault nixConfig.users.users."${name}".group;
          # homeMode defaults to 700; notice: no leading 0
          mode = "0" + nixConfig.users.users."${name}".homeMode;
        };
        # ~/.config/environment.d/*.conf is added to systemd user units.
        # - format: lines of: `key=value`
        # ~/.profile is added by *some* login shells.
        # - format: lines of: `export key="value"`
        # see: `man environment.d`
        fs.".config/environment.d/10-sane-nixos-users.conf".symlink.text =
          let
            env = lib.mapAttrsToList
              (key: value: ''${key}=${value}'')
              config.environment
            ;
          in
            lib.concatStringsSep "\n" env + "\n";
        fs.".profile".symlink.text = ''
          # source env vars and the like, as systemd would. `man environment.d`
          for env in ~/.config/environment.d/*.conf; do
            # surround with `set -o allexport` since environment.d doesn't explicitly `export` their vars
            set -a
            source "$env"
            set +a
          done
        '';

        services."default" = {
          description = "service (bundle) which is started by default upon login";
        };
        services."graphical-session" = {
          description = "service (bundle) which is started upon successful graphical login";
          # partOf = [ "default" ];  #< leave it to the DEs to set this
        };
        services."sound" = {
          description = "service (bundle) which represents functional sound input/output when active";
          partOf = [ "default" ];
        };
      }
    ];
  });
  processUser = user: defn:
    let
      prefixWithHome = lib.mapAttrs' (path: value: {
        name = path-lib.concat [ defn.home path ];
        inherit value;
      });
      makeWanted = lib.mapAttrs (_path: values: lib.mkMerge (values ++ [{
        # default if not otherwise provided
        wantedBeforeBy = lib.mkDefault [ "multi-user.target" ];
      }]));
    in
    {
      sane.fs = makeWanted (prefixWithHome defn.fs);
      sane.defaultUser = lib.mkIf defn.default user;

      # `byPath` is the actual output here, computed from the other keys.
      sane.persist.sys.byPath = prefixWithHome defn.persist.byPath;
    };
in
{
  imports = [
    ./s6-rc.nix
  ];

  options = with lib; {
    sane.users = mkOption {
      type = types.attrsOf userModule;
      default = {};
      description = ''
        options to apply to the given user.
        the user is expected to be created externally.
        configs applied at this level are simply transformed and then merged
        into the toplevel `sane` options. it's merely a shorthand.
      '';
    };

    sane.user = mkOption {
      type = types.nullOr (types.submodule userOptions);
      default = null;
      description = ''
        options to pass down to the default user
      '';
    };

    sane.defaultUser = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        the name of the default user.
        other attributes of the default user may be retrieved via
        `config.sane.users."''${config.sane.defaultUser}".<attr>`.
      '';
    };
  };
  config =
    let
      configs = lib.mapAttrsToList processUser cfg;
      num-default-users = lib.count (u: u.default) (lib.attrValues cfg);
      take = f: {
        sane.fs = f.sane.fs;
        sane.persist.sys.byPath = f.sane.persist.sys.byPath;
        sane.defaultUser = f.sane.defaultUser;
      };
    in lib.mkMerge [
      (take (sane-lib.mkTypedMerge take configs))
      {
        assertions = [
          {
            assertion = sane-user-cfg == null || num-default-users != 0;
            message = "cannot set `sane.user` without first setting `sane.users.<user>.default = true` for some user";
          }
          {
            assertion = num-default-users <= 1;
            message = "cannot set more than one default user";
          }
        ];
      }
    ];
}

{ lib, pkgs, ... }:

let
  # TODO: use formats.gitIni or lib.generators.toGitINI
  # - see: <repo:nixos/nixpkgs:pkgs/pkgs-lib/formats.nix>
  mkCfg = lib.generators.toINI { };
in
{
  sane.programs.git = {
    packageUnwrapped = (pkgs.git.override {
      # build without gitweb support, as that installs to share/git,
      # which causes trouble trying to make the sandboxer
      perlSupport = false;
    }).overrideAttrs (upstream: {
      postInstall = upstream.postInstall + ''
        # git-jump is a symlink from bin/git-jump -> share/contrib/git-jump,
        # which causes trouble trying to make the sandboxer
        rm "$out/bin/git-jump"
      '';
    });
    sandbox.method = "bwrap";
    sandbox.net = "clearnet";
    sandbox.whitelistPwd = true;
    sandbox.autodetectCliPaths = true;  # necessary for git-upload-pack
    sandbox.extraHomePaths = [
      # even with `whitelistPwd`, git has to crawl *up* the path -- which isn't necessarily in the sandbox -- to locate parent .git files
      "dev"
      "knowledge"
      "nixos"
      "ref"
      ".ssh/id_ed25519"  # for ssh-auth'd remotes
    ];
    fs.".config/git/config".symlink.text = mkCfg {
      # top-level options documented:
      # - <https://git-scm.com/docs/git-config#_variables>

      user.name = "Colin";
      user.email = "colin@uninsane.org";

      alias.amend   = "commit --amend --no-edit";
      alias.br      = "branch";
      alias.co      = "checkout";
      alias.cp      = "cherry-pick";
      alias.d       = "difftool";
      alias.dif     = "diff";  # common typo
      alias.difsum  = "diff --compact-summary";  #< show only the list of files which changed, not contents
      alias.rb      = "rebase";
      alias.st      = "status";
      alias.stat    = "status";

      diff.noprefix = true;  #< don't show a/ or b/ prefixes in diffs
      # difftastic docs:
      # - <https://difftastic.wilfred.me.uk/git.html>
      diff.tool = "difftastic";
      difftool.prompt = false;
      "difftool \"difftastic\"".cmd = ''${pkgs.difftastic}/bin/difft "$LOCAL" "$REMOTE"'';
      # now run `git difftool` to use difftastic git

      # render dates as YYYY-MM-DD HH:MM:SS +TZ
      log.date = "iso";

      sendemail.annotate = "yes";
      sendemail.confirm = "always";

      stash.showPatch = true;
    };
  };
}

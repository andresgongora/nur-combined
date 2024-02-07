{ config
, substituteAll
, swayCfg
, writeShellApplication
}:
let
  prog = config.sane.programs;
  # "bookmarking"/snippets inspired by Luke Smith:
  # - <https://www.youtube.com/watch?v=d_11QaTlf1I>
  snip_cmd_pkg = writeShellApplication {
    name = "type-snippet";
    runtimeInputs = [
      prog.fuzzel.package
      prog.gnused.package
      prog.wtype.package
    ];
    text = ''
      snippet=$(cat ${../snippets.txt} ~/.config/sane-sway/snippets.txt | \
        fuzzel -d -i -w 60 | \
        sed 's/ #.*$//')
      wtype "$snippet"
    '';
  };
  snip_cmd = "${snip_cmd_pkg}/bin/type-snippet";
  # TODO: splatmoji release > 1.2.0 should allow `-s none` to disable skin tones
in substituteAll {
  src = ./sway-config;
  inherit snip_cmd;
  inherit (swayCfg)
    background
    extra_lines
    screenshot_cmd
    font
    mod
    workspace_layout
  ;
  xwayland = if swayCfg.xwayland then "enable" else "disable";
}

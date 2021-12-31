{ config, lib, pkgs, ... }:

let
  diffHighlight = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight";
in

{
  home.activation =
    let
      exec = cmd: lib.hm.dag.entryAfter [ "writeBoundary" ] cmd;
      link = src: dest: exec ''
        $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ${builtins.dirOf dest}
        $DRY_RUN_CMD ln -fs $VERBOSE_ARG ${src} ${dest}
      '';
      mkdirp = dir: exec ''
        $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ${dir}
      '';
    in
    {
      zshrc = link ./zshrc "~/.zshrc"
      vimrc = link ./vimrc "~/.vimrc"
      karabinerJSON = link ./karabiner.json "${config.xdg.configHome}/karabiner/karabiner.json";
      deinToml = link ./dein.toml "~/.dein.toml";
      deinLazyToml = link ./dein_lazy.toml "~/.dein_lazy.toml";
    };
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_US.UTF-8";
  home.packages = [
    pkgs.niv
    pkgs.yarn
    pkgs.jq
    pkgs.tig
  ];
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.stateVersion = "22.05";
  home.username = builtins.getEnv "USER";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
  };
}

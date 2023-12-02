{ config, pkgs, ... }:

let
  nvimConfig = builtins.fetchGit {
    url = "https://github.com/Alex-Gilbert/nvim-config.git";
    ref = "main";
    rev = "51eb36bf64326fd00de316947195d3bcff6e0e5c";
  };
in
{
  home.username = "alexg";
  home.homeDirectory = "/home/alexg";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".config/nvim".source = nvimConfig;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alexg/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "alexg";
      userEmail = "alexp.gilbert@pm.me";

      aliases = {
        c = "commit";
        cam = "commit -a -m";
      };
    };
  };

}

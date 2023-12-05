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

    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
    ".config/nvim".source = nvimConfig;
  };

  home.sessionVariables = {
     EDITOR = "nvim";
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

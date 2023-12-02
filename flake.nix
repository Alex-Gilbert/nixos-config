{
  description = "AlexG's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations = {
      ag-nix = lib.nixosSystem {
	inherit system;
	modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      alexg = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    modules = [ 
          ./home.nix
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enble = true;}
        ];
      };
    };

  };
}


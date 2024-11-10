{
  description = "Xero's nixos + home-manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pollymc.url = "github:fn2006/PollyMC";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
    pollymc,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    devShells = forAllSystems (pkgs: import ./shell.nix {inherit pkgs;});
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      xeroNixOS = lib.nixosSystem {
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {config.allowUnfree = true;};
          inherit inputs outputs;
        };
        modules = [
          ./nixos/xeroNixOS.nix
        ];
      };
    };

    homeConfigurations.xero = lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [./home-manager/xero.nix];
      extraSpecialArgs = {
        pkgs-stable = import nixpkgs-stable {config.allowUnfree = true;};
        inherit inputs outputs;
      };
    };
  };
}

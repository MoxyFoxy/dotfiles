{
  description = "Home Manager configuration for Eve";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    catnerd.url = "github:ElliottSullingeFarrall/catnerd";
  };

  outputs = { nixpkgs, home-manager, plasma-manager, catnerd, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.eve = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs pkgs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          #home-manager.nixosModules.home-manager {
          #  home-manager = {
          #    sharedModules = [ catnerd.homeManagerModules.catnerd ];
          #  };
          #}

          plasma-manager.homeManagerModules.plasma-manager
          catnerd.homeManagerModules.catnerd

          ./modules
          ./theme

          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

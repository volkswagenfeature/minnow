{
  description = "a nixified way to manage OMF packages";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

  }

  outputs = { self, nixpkgs }@inputs:
  with nixpkgs.lib;
  with builtins;
  let

  in
  {
    flake-utils.lib.eachDefaultSystem
    (
      system:
        let
          pkgs = import nixpkgs {inherit system;};
          options = {
            programs.minnow = {
              enable = mkEnableOption "Enable minnow";
              extraPlugs = mkOption {
                default = {};
                description = "set of external packages not in packages-main as omfPlugin objects";
              };
              plugins = mkOption {
                default = [];
                description = "list of plugins to be installed";
              };
            };
          };
          omfPlugin = {location, isTheme ? False, isPlugin ? False}:
          {
            if isTheme
            then
            {
              # TODO: If is plugin, add to env variables

            }
            else {}

            if isPlugin
            then
            {
              # TODO: If is theme, source scripts. 
            }
            else {}

          };
          loadOmfRepo = location:
          {
            # TODO: Generate list of plugins from passed repo

          };
          omfPkgs = loadOmfRepo "github:oh-my-fish/packages-main" // options.extraPlugs;


          # I'm trying to make the minnow setup extend the fish package.
          minnow = (pkgs.fish.override{...}@options)



        in
        {
          #packages.default = 

        }
    )


  };
}

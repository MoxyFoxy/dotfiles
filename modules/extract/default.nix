{ lib, config, pkgs, withUnzip ? true, unzip, glibcLocalesUtf8, mkDerivation, ... }:

with lib;
let
  extract = { source, stdenv }:
    stdenv.mkDerivation {
      name = "extract";
      version = "1.0";
      src = source;
      inherit source;
      #builder = ./builder.sh;

      phases = [ "buildPhase" ];

      buildPhase = ''
      mkdir -p $out
      cd $out
      unpackFile $src
      '';
    };

  extractModule = { mkDerivation, ... }: {
    options = {
      source = lib.mkOption {
        description = "Source Archive";
        type = lib.types.path;
      };
      destination = lib.mkOption {
        description = "Destination Folder";
        type = lib.types.str;
      };
    };
  };
in
{
  options.util = {
    extract = lib.mkOption {
      type = lib.types.attrsOf ( lib.types.submodule extractModule );
    };
  };

  config = {
    home.file = lib.mapAttrs' ( name: config: lib.nameValuePair "${config.destination}/${name}" {
      source = pkgs.callPackage extract { inherit ( config ) source; };
    }) config.util.extract;
  };
}

{ lib, withUnzip ? true, unzip, glibcLocalesUtf8, mkDerivation, ... }:

with lib;
let
  extract = { source, destination, mkDerivation }:
    mkDerivation {
      inherit source destination;
      name = "extract";
      version = "1.0";
      builder = ./builder.sh;
    };

  extractModule = { mkDerivation, ... }: {
    options = {
      source = lib.mkOption {
        description = "Source Archive";
        type = lib.types.str;
      };
      destination = lib.mkOption {
        description = "Destination Folder";
        type = lib.types.str;
      };
    };

    config = {
      derivation = extract { source = source; destination = destination; mkDerivation = mkDerivation; };
    };
  };
in
{
  options = {
    extract = lib.mkOption {
      type = lib.types.attrsOf ( lib.types.submodule extractModule );
    };
  };

  #config = {
  #  _ = lib.mapAttrs ( name: value: extract value.source value.destination mkDerivation ) { source = config.source; destination = config.destination; };
  #};
}

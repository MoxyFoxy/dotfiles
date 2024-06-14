{ lib, withUnzip ? true, unzip, glibcLocalesUtf8 }:

{
  source ? ""
, destination ? ""
, ... }:

assert (source != "") -> abort "Source cannot be empty.";
assert (destination != "") -> abort "Destination cannot be empty.";

with import <nixpkgs> { };
stdenv.mkDerivation {
  inherit source destination;

  name = "extract";
  version = "1.0";
  builder = "./builder.sh";
}

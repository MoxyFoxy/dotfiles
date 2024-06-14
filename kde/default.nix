{ pkgs, extract, ... }:

{
  extract = {
    source = "./archives/theme.tar.gz";
    destination = "~/.local/share/plasma";
  };

  #home.file.".local/share/plasma" = {
  #  source = "./archives/theme.tar.gz"
  #  recursive = true;
  #};

  programs.plasma = {
    workspace = {
      clickItemTo = "open";
    };
  };
}

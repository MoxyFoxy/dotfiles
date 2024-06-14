{ pkgs, ... }:

{
  home.file.".local/share/plasma" = {
    source = "./archives/theme.tar.gz"
    recursive = true;
  };

  programs.plasma = {
    workspace = {
      clickItemTo = "open";
    };
  }
}

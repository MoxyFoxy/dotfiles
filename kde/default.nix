{ pkgs, ... }:

let
  theme = pkgs.fetchgit {
    url = "https://gitlab.com/jomada/moe-theme";
    rev = "39215b6305af3ecec67d8c6dd2c2721f60c23594";
    hash = "sha256-zMahxlpEcX7t2EWs0jyMAzEpuYoQ5mj02jmK6wFbrW4=";
  };
in
{
  home.file.".local/share/plasma/moe".source = "${theme}/Moe";

  programs.plasma = {
    workspace = {
      clickItemTo = "open";
    };
  };
}

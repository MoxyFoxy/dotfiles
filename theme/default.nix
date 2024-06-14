{ inputs, ... }:

{
  catnerd = {
    enable = true;

    flavour = "latte";
    accent = "pink";

    fonts = {
      main = {
        family = "Ubuntu";
        size = 10;
      };

      mono = {
        family = "FiraCode";
        size = 14;
      };
    };
  };
}

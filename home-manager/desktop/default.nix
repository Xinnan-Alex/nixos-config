{ pkgs, ... }:
let
    gruvbox-dark-gtk = import ./gruvbox-dark-gtk.nix { inherit pkgs; };
in
{
  imports = [
    ./hyprland
    ./kitty
  ];

  home.packages = with pkgs; [
    microsoft-edge
  ];

  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

}

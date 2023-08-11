{ pkgs, inputs, ... }:

{

  imports = [
     ../waybar.nix
  ];

  home.packages = with pkgs; [ gnome.nautilus ];

  programs.wofi.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./config.nix {};
  };
}

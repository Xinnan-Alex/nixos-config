# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    inputs.hyprland.homeManagerModules.default
    ./desktop
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };

  # TODO: Set your username
  home = {
    username = "alex";
    homeDirectory = "/home/alex";
    stateVersion = "23.05";
    packages = with pkgs; [
      oh-my-zsh
      gh
      colorls
      vscode
      brightnessctl
      ninja
      meson
      gcc
      pkg-config
      cmake
      gnumake
      python3
      python310Packages.pip
      rustc
      cargo
      hyprpaper
      dunst
      libnotify
      networkmanagerapplet
      grim
      telegram-desktop
      spotify
      htop
      pavucontrol
      lxde.lxsession
      discord
      betterdiscordctl
      nixpkgs-fmt
      kitty-themes

      #fonts
      hackgen-nf-font nerdfonts corefonts
    ];
  };

  # Add stuff for your user as you see fit:
  fonts.fontconfig.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}

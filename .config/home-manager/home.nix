{ config, pkgs, ... }:

{
  # Set the username and home directory
  home.username = "paranoia";
  home.homeDirectory = "/home/paranoia";

  # Nix package
  nix.package = pkgs.nix;

  # Experimental features for Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"				
  ];

  nixpkgs.system = "x86_64-linux";	# Adjust if on a different architecture

  home.stateVersion = "24.05";		# Read manual before changing

  home.packages = [
    # pkgs.hello
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  programs.home-manager.enable = true;
}

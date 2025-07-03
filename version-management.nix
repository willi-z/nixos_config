{pkgs, lib, ... }:
{
    # Automatic weekly updating
    system.autoUpgrade.enable = true;
    system.autoUpgrade.dates = "weekly";

    # Automatic cleanup
    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 5d";
    nix.settings.auto-optimise-store = true;
}
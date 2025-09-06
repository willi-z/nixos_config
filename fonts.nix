{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
        (import ./fonts/source-sans.nix {
                inherit (pkgs) lib stdenv fetchFromGitHub;
            }
        )
    ];
  };
}

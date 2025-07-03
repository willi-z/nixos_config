# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  services.borgbackup.jobs.personal = {
    paths      = [ "/home/williz" ];
    repo       = "file:///mnt/backup/personal-borg-repo";
    encryption = { mode = "none"; };
    compression = "auto,zstd";
    startAt    = "daily";
    exclude    = [ "/home/williz/.cache" ];
    environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
  };
}

# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  services.borgbackup.jobs.personal = {
    paths      = [ 
      "/home/williz/Documents" 
      "/home/williz/Pictures" 
    ];
    repo       = "/mnt/backup";
    encryption = { mode = "none"; };
    compression = "auto,zstd";
    startAt    = "daily";
    exclude    = [ 
      # Largest cache dirs
      ".cache"
      "*/cache2" # firefox
      "*/Cache"
      ".config/Slack/logs"
      ".config/Code/CachedData"
      ".container-diff"
      ".npm/_cacache"
      # Work related dirs
      "*/node_modules"
      "*/bower_components"
      "*/_build"
      "*/.tox"
      "*/venv"
      "*/.venv"
    ];
    environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
  };
}

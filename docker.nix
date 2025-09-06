{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless.enable = true;
  # users.users.yourname.extraGroups = [ "docker" ];
}

{ config, pkgs, ... }:
{
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    # hardware.pulseaudio.enable = true; # To allow Bluetooth audio devices to be used with PulseAudio
}

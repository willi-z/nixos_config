{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.graphics.extraPackages = with pkgs; [ 
   rocmPackages.clr.icd
   amdvlk    
  ];
}

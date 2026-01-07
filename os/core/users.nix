{ config, pkgs, ... }:

{
  # Defining a user, don't forget to set a password with "passwd"
  users.users.kenny = {
    isNormalUser = true;
    description = "kenny";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}

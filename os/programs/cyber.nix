{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    exegol
    # # # - - - CRACKING - - - # # #
    hash-identifier
    hashcat
    john
    johnny
    (pkgs.wordlists.override { lists = with pkgs; [ rockyou seclists ]; })
  ];
}

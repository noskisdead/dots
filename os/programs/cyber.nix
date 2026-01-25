{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # # # - - - Active Directory - - - # # #
    evil-winrm
    snmpcheck
    # # # - - - Exploits - - - # # #
    exploitdb
    metasploit
    sploitscan
    # # # - - - Cracking - - - # # #
    hash-identifier
    hashcat
    hashcat-utils
    john
    (pkgs.wordlists.override {lists = with pkgs; [rockyou seclists];})
    # # # - - - Reverse Engineering and Steganography - - - # # #
    binwalk
    ghidra-bin
    steghide
    stegseek
    # # # - - - Cli tools - - - # # #
    curl
    cyberchef
    netcat-gnu
    openssh
    openvpn
    socat
    tmux
    # # # - - - Enumeration - - - # # #
    ffuf
    gobuster
    nmap
    # # # - - - Web - - - # # #
    burpsuite
    cf-hero
    http-server
    nikto
    nosqli
    sqlmap
    whatweb
    wpscan
    xsubfind3r
    # # # - - - Wireless - - - # # #
    aircrack-ng
    bully
    hcxdumptool
    hcxtools
    pixiewps
    reaverwps
    wifite2
  ];
}

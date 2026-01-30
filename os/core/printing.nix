{pkgs}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint # Older printers like Canon
      brlaser # Brother Printers
      hplip # HP Printers
    ];
  };
}

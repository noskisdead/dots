{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      # brlaser # Brother Printers
      # gutenprint # Older printers like Canon
      hplip # HP Printers
      # splix # Samsung Printers
    ];
  };
}

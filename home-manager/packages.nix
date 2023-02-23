{ pkgs, ...}: {
  home.packages = with pkgs; [
      # Gaming
      steam
      lutris
      # Internet
      firefox
      discord
      tdesktop
      qbittorrent
      # Programs
      neofetch
      htop
      kate
      pavucontrol
      polkit
      locale
      unrar
  ];
}


{ pkgs, ...}: {
  home.packages = with pkgs; [
      # Gaming
      lutris
      steam
      # Internet
      firefox
      discord
      tdesktop
      qbittorrent
      # Programs
      ark
      neofetch
      htop
      kate
      pavucontrol
      polkit
      locale
      unrar
      p7zip
  ];
}


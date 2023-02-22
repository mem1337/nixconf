{ pkgs, ...}: {
  home.packages = with pkgs; [
      neofetch
      firefox
      htop
      kate
      pavucontrol
      lutris
      steam
      discord
      micro
      polkit
      tdesktop
      transmission-gtk
      locale
      unrar
      gnomeExtensions.pop-shell
  ];
}


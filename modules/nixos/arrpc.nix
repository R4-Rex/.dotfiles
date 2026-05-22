{ pkgs, ... }:
{
  enviroment.systemPackages = with pkgs; [
    arrpc
  ];
  systemd.packages = with pkgs; [ arrpc ];
}

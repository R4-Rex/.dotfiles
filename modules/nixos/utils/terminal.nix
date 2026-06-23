{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wget
    jq
    fd
    xxd
    ripgrep
    lolcat
    fzf
    just
    tldr
  ];
}

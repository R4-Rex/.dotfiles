{config, pkgs, ...}:
{
    programs.git = {
      
      gnupg = {
      signing = {
        key = builtins.readFiles config.sops.secrets.fingerprint.path;
        signByDefault = true;
      };
      };
    };
}

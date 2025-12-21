{config, pkgs, vars, ...}:
{
    programs.git = {
      
      signing = {
        key = vars.gpg.fingerprint;
        signByDefault = true;
      };
    };
}

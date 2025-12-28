{config, pkgs, vars, ...}:
{
    programs.git = {
      
      signing = {
        format = "openpgp";
        key = vars.gpg.fingerprint;
        signByDefault = true;
      };
    };
}

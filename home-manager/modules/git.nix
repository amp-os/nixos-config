{config, pkgs, systemSettings, ...}:
{
    programs.git = {
    enable = true;
    userName = systemSettings.git.userName;
    userEmail = systemSettings.git.userEmail;
  };
}

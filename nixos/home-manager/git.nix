{ pkgs }:

{
  enable = true;

  delta = { enable = true; };
  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };
    push = {
      default = "tracking";
      autoSetupRemote = true;
    };
  };
  ignores = [
    ".cache/"
    ".DS_Store"
    ".direnv/"
    ".idea/"
    "*.swp"
    "built-in-stubs.jar"
    "dumb.rdb"
    ".elixir_ls/"
    ".vscode/"
    "npm-debug.log"
  ];
  lfs = { enable = true; };
  package = pkgs.gitAndTools.gitFull;
  userEmail = "sebastiaan@sevaho.io";
  userName = "sevaho";
}

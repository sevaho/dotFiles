{ pkgs, config, ... }: {
  programs.git = {
    enable = true;

    delta = { enable = true; };
    extraConfig = {
        core = {
            editor = "nvim";
            whitespace = "trailing-space,space-before-tab";
        };
        column = {
            ui = "auto";
        };
        init = {
            defaultBranch = "main";
        };
        diff = {
            algorithm = "histogram";
            colorMoved = "plain";
            mnemonicPrefix = true;
            renames = true;
        };
        branch = {
            sort = "-committerdate";
        };
        tag = {
            sort = "version:refname";
        };
        push = {
            default = "simple";
            autoSetupRemote = true;
            followTags = true;
        };
        fetch = {
            prune = true;
            pruneTags = true;
            all = true;
        };
        help = {
            autocorrect = "prompt";
        };
        commit = {
            verbose = true;
        };
        merge = {
            conflictstyle = "zdiff3";
        };
    };
    ignores = [
        ".env"
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
  };
}

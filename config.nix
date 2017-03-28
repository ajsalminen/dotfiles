# ~/.nixpkgs/config.nix

{
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    all = with pkgs; buildEnv {  # pkgs is your overriden set of packages itself
      name = "all";
      paths = [
        emacs
	git
        go
        watchman
        # apparix
        # nq
        # jq
        ansible
        vagrant
        # isync
        python27Packages.boto
        #php
        peco
        # …
      ];
    };
  };
}
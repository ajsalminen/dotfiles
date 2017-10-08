# ~/.nixpkgs/config.nix

{
  allowBroken = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    all = with pkgs; buildEnv {  # pkgs is your overriden set of packages itself
      name = "all";
      paths = [
        python
        emacs
	git
        go
        watchman
        # apparix
        # nq
        # jq
        ansible_2_1
        python27Packages.httplib2
        python27Packages.howdoi
        php70
        php70Packages.composer
        vagrant
        # isync
        python27Packages.boto
        peco
        less
        chromium
        global
        recoll
        youtube-dl
        rxvt_unicode
        ag
        sqlite # Required by helm-dash
        grc
        cheat
        mosh
        exa
        ffmpeg
        pass
        xclip
        tomb
        file
        python27Packages.upass
        gnupg1
        git
        screen
        mplayer
        nodejs
      ];
    };
  };
}

# ~/.nixpkgs/config.nix

{
  allowBroken = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    all = with pkgs; buildEnv {  # pkgs is your overriden set of packages itself
      name = "all";
      paths = [
        python
        ruby
        emacs
	git
        go
        watchman
        # apparix
        # nq
        # jq
        python27Packages.httplib2
        python27Packages.howdoi
        python27Packages.pygments
        python27Packages.pyyaml
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
        screen
        mplayer
        nodejs
        fd
        sshfs-fuse
        openssl
        icdiff
        ripgrep
        nix-index
        anki
        dmidecode
      ];
    };
  };
}

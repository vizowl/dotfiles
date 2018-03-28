with import <nixpkgs> {};

{ allowBroken = true;
  allowUnfree = true;
  ignoreCollisions = true;
  doCheck = false;  

  packageOverrides = pkgs: rec {
 
    haskell = pkgs.haskell // {
      packages = pkgs.haskell.packages // {
        ghc822 = pkgs.haskell.packages.ghc822.override {
          overrides = self: pkgs: {
            hoogle = self.callPackage ./hoogle-5.0.16.nix {};
            steeloverseer = self.callPackage ./steeloverseer-git.nix {};
            inline-r = self.callPackage ./inline-r-0.9.1.nix {};
            lucid-extras = self.callPackage ./lucid-extras.nix {};
            plotlyhs = self.callPackage ./plotlyhs.nix {};
            inliterate = self.callPackage ./inliterate.nix {};
          };
        };
      };
    };
   
    ihaskellEnv = haskell.packages.ghc822.ghcWithPackages
      (haskellPackages: with haskellPackages; [
        # libraries
        H
        inline-r
        ihaskell-inline-r
        pandoc-sidenote ihaskell ihaskell-blaze 
        ihaskell-charts ihaskell-diagrams 
        ihaskell-hatex ihaskell-juicypixels
        ihaskell-magic ihaskell-plot
        ihaskell-widgets ipython-kernel
      ]);
   
    haskellEnv = haskell.packages.ghc822.ghcWithPackages
      (haskellPackages: with haskellPackages; [
        # libraries
        hoogle
        brittany
        steeloverseer
        hlint
        pandoc stylish-haskell shake hindent 
        ghcid aeson-pretty 
        pandoc-sidenote
        inline-r
        H
        plotlyhs lucid-extras inliterate
        cabal-install cabal2nix
        stack stack2nix
        nix-prefetch-git
        pkgs.git
      ]);

    rEnv = pkgs.rWrapper.override {
        packages = with pkgs.rPackages; [
            devtools
            tidyverse
            rmarkdown
            prettydoc
            RPostgreSQL
            yaml
            optparse
            lintr
            svglite
            mapproj
            data_table
            libxml2.dev
            pkgs.perl
            ];
    };

    
    pyEnv = python36.buildEnv.override {
      extraLibs = with python36Packages; [ 
        requests
        jupyter_core
        jupyter_client
        jupyter_console
        pip
        ipykernel
        ipython
        matplotlib
        numpy
        pandas
        scipy
        neovim
        xlsx2csv
        pylint ];
          ignoreCollisions = true;
    };
  };
}



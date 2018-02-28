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
          };
        };
      };
    };
   
    haskellEnv = haskell.packages.ghc822.ghcWithPackages
      (haskellPackages: with haskellPackages; [
        # libraries
        hoogle
        brittany
        steeloverseer
        hlint
        pandoc stylish-haskell shake hindent 
        ghcid aeson-pretty 
        pandoc-sidenote ihaskell ihaskell-blaze 
        ihaskell-charts ihaskell-diagrams 
        ihaskell-hatex ihaskell-juicypixels
        ihaskell-magic ihaskell-plot
        ihaskell-widgets ipython-kernel
        cabal-install cabal2nix stack2nix stack
      ]);

    rEnv = pkgs.rWrapper.override {
        packages = with pkgs.rPackages; [
            devtools
            tidyverse
            rmarkdown
            RPostgreSQL
            yaml
            optparse
            lintr
            libxml2.dev
            pkgs.perl
            ];
    };

    python36Packages = pkgs.python36Packages.override (oldAttrs: { overrides = self: super: {
        send2trash = super.send2trash.overrideAttrs ( z : rec { doCheck=false; doInstallCheck = false; } );
        pandas = super.pandas.overrideAttrs( z : rec{ doCheck=false; doInstallCheck = false;  }  );
        notebook = super.notebook.overrideAttrs( z : rec{ doCheck=false; doInstallCheck = false;  }  );
    } ;  }  ) ;

    pyEnv = python36.buildEnv.override {
        extraLibs = with python36Packages; [ requests jupyter_core ipython matplotlib numpy pandas scipy neovim ];
          ignoreCollisions = true;
    };
  };
}



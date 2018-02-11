with import <nixpkgs> {};
with pkgs.python36Packages;

{ allowBroken = true;
  allowUnfree = true;
  ignoreCollisions = true;
  doCheck = false;  

  packageOverrides = pkgs: rec {
    
    haskellEnv = pkgs.haskell.packages.ghc822.ghcWithPackages
      (haskellPackages: with haskellPackages; [
        # libraries
        pandoc stylish-haskell shake hindent 
        hoogle ghcid aeson-pretty 
        pandoc-sidenote ihaskell ihaskell-blaze 
        ihaskell-charts ihaskell-diagrams 
        ihaskell-hatex ihaskell-juicypixels
        ihaskell-magic ihaskell-plot
        ihaskell-widgets ipython-kernel
      ]);

    rEnv = pkgs.rWrapper.override {
        packages = with pkgs.rPackages; [
            devtools
            tidyverse
            rmarkdown
            RPostgreSQL
            yaml
            optparse
            ];
    };

    python36Packages = pkgs.python36Packages.override (oldAttrs: { overrides = self: super: {
        send2trash = super.send2trash.overrideAttrs ( z : rec { doCheck=false; doInstallCheck = false; } );
        pandas = super.pandas.overrideAttrs( z : rec{ doCheck=false; doInstallCheck = false;  }  );
        notebook = super.notebook.overrideAttrs( z : rec{ doCheck=false; doInstallCheck = false;  }  );
    } ;  }  ) ;

    pyEnv = python36.buildEnv.override {
        extraLibs = with python36Packages; [ requests jupyter_core ipython matplotlib numpy pandas scipy ];
          ignoreCollisions = true;
    };
  };
}



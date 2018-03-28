{ mkDerivation, base, blaze-html, cheapskate, containers, fetchgit
, haskell-src-exts, lucid, lucid-extras, plotlyhs, stdenv
, svg-builder, text, time
}:
mkDerivation {
  pname = "inliterate";
  version = "0.1.0";
  src = fetchgit {
    url = "https://github.com/diffusionkinetics/open.git";
    sha256 = "06sr6byly2licc8vd6dpipwj8l2inq17sx24wrrmc2sqgq3zsxhy";
    rev = "0972496184c23ca302b47d26251892edc96b5686";
  };
  postUnpack = "sourceRoot+=/inliterate; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base blaze-html cheapskate containers haskell-src-exts lucid
    lucid-extras plotlyhs svg-builder text time
  ];
  executableHaskellDepends = [ base text ];
  testHaskellDepends = [ base text time ];
  homepage = "https://github.com/diffusionkinetics/open/inliterate";
  description = "Interactive literate programming";
  license = stdenv.lib.licenses.mit;
}

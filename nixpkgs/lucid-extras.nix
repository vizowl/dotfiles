{ mkDerivation, aeson, base, blaze-builder, bytestring, directory
, fetchgit, lucid, stdenv, text
}:
mkDerivation {
  pname = "lucid-extras";
  version = "0.1.0.0";
  doCheck = false;
  doHaddock = false;
  src = fetchgit {
    url = "https://github.com/diffusionkinetics/open.git";
    sha256 = "06sr6byly2licc8vd6dpipwj8l2inq17sx24wrrmc2sqgq3zsxhy";
    rev = "0972496184c23ca302b47d26251892edc96b5686";
  };
  postUnpack = "sourceRoot+=/lucid-extras; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base blaze-builder bytestring lucid text
  ];
  testHaskellDepends = [ base directory lucid ];
  homepage = "https://github.com/diffusionkinetics/open/lucid-extras";
  description = "Generate more HTML with Lucid";
  license = stdenv.lib.licenses.mit;
}

{ mkDerivation, aeson, base, blaze-html, blaze-markup, bytestring
, fetchgit, lucid, microlens, microlens-th, stdenv, text, time
}:
mkDerivation {
  pname = "plotlyhs";
  version = "0.2";
  src = fetchgit {
    url = "https://github.com/diffusionkinetics/open.git";
    sha256 = "06sr6byly2licc8vd6dpipwj8l2inq17sx24wrrmc2sqgq3zsxhy";
    rev = "0972496184c23ca302b47d26251892edc96b5686";
  };
  postUnpack = "sourceRoot+=/plotlyhs; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base blaze-html blaze-markup bytestring lucid microlens
    microlens-th text time
  ];
  homepage = "https://github.com/diffusionkinetics/open/plotlyhs";
  description = "Haskell bindings to Plotly.js";
  license = stdenv.lib.licenses.mit;
}

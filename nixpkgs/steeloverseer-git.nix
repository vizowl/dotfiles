{ mkDerivation, aeson, ansi-terminal, async, base, bytestring
, containers, directory, exceptions, fetchgit, filepath, fsnotify
, hfsevents, hspec, managed, mtl, optparse-applicative, process
, regex-tdfa, semigroups, stdenv, stm, streaming, text, unix, yaml
}:
mkDerivation {
  pname = "steeloverseer";
  version = "2.0.2";
  src = fetchgit {
    url = "https://github.com/schell/steeloverseer.git";
    sha256 = "1k4684rddx5aqxdgxcwp105i6vqlgcm13kzh1zcrh5y544m64n4x";
    rev = "eada6fe806d9dee91cf1d0b3a5f66005a252c182";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal async base bytestring containers exceptions
    fsnotify managed mtl process regex-tdfa semigroups stm streaming
    text unix yaml
  ];
  executableHaskellDepends = [
    async base bytestring directory exceptions filepath fsnotify
    hfsevents managed mtl optparse-applicative regex-tdfa semigroups
    stm streaming text yaml
  ];
  testHaskellDepends = [
    async base bytestring exceptions fsnotify hspec managed mtl
    regex-tdfa semigroups stm streaming text yaml
  ];
  homepage = "https://github.com/schell/steeloverseer#readme";
  description = "A file watcher and development tool";
  license = stdenv.lib.licenses.bsd3;
}

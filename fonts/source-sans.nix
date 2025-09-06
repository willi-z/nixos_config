{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "source-sans-3";
  version = "latest";

  src = fetchFromGitHub {
    owner = "adobe-fonts";
    repo = "source-sans";
    rev = "release";
    sha256 = "Q1qhOwdzpMJQ7sqcTWrg8xgL/9RvbnFTVcdpQKLcZ/A="; #lib.fakeSha256;
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp -v OTF/*.otf $out/share/fonts/opentype/
  '';

  meta = {
    description = "Source Sans 3 font family by Adobe";
    homepage = "https://github.com/adobe-fonts/source-sans";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}

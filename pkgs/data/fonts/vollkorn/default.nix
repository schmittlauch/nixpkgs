{ lib, stdenv, fetchzip }:
let
  pname = "vollkorn";
  majorVersion = "4";
  minorVersion = "105";
  fullVersion = "${majorVersion}.${minorVersion}";
in
fetchzip {
  name = "${pname}-${fullVersion}";
  url = "http://vollkorn-typeface.com/download/vollkorn-${majorVersion}-${minorVersion}.zip";
  sha256 = "0srff2nqs7353mqcpmvaq156lamfh621py4h1771n0l9ix2c8mss";
  stripRoot = false;

  postFetch = ''
    mkdir -pv $out/share/{doc/${pname}-${fullVersion},fonts/{opentype,truetype,WOFF,WOFF2}}
    unzip $downloadedFile
    cp -v {Fontlog,OFL-FAQ,OFL}.txt $out/share/doc/${pname}-${fullVersion}/
    cp -v PS-OTF/*.otf $out/share/fonts/opentype
    cp -v TTF/*.ttf $out/share/fonts/truetype
    cp -v WOFF/*.woff $out/share/fonts/WOFF
    cp -v WOFF2/*.woff2 $out/share/fonts/WOFF2
  '';

  meta = with lib; {
    homepage = "http://vollkorn-typeface.com/";
    description = "The free and healthy typeface for bread and butter use";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = [ maintainers.schmittlauch ];
  };
}

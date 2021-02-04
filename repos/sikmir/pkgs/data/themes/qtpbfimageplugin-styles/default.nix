{ lib, stdenv, sources }:

stdenv.mkDerivation {
  pname = "qtpbfimageplugin-styles";
  version = lib.substring 0 10 sources.qtpbfimageplugin-styles.date;

  src = sources.qtpbfimageplugin-styles;

  installPhase = ''
    install -dm755 $out/share/gpxsee/style
    cp -r Mapbox OpenMapTiles Tilezen $out/share/gpxsee/style
  '';

  meta = with lib; {
    inherit (sources.qtpbfimageplugin-styles) description homepage;
    license = licenses.free;
    maintainers = [ maintainers.sikmir ];
    platforms = platforms.all;
    skip.ci = true;
  };
}

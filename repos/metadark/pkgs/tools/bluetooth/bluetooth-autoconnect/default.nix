{ lib
, buildPythonApplication
, fetchFromGitHub
, dbus-python
, pygobject3
, python-prctl
, python
}:

buildPythonApplication rec {
  pname = "bluetooth-autoconnect";
  version = "1.2";
  format = "other";

  src = fetchFromGitHub {
    owner = "jrouleau";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-9ejPKcROCwGEx2V3Uw3O8qLupNKGSt+jgsDQ3mfm2KM=";
  };

  propagatedBuildInputs = [ dbus-python pygobject3 python-prctl ];

  installPhase = ''
    mkdir -p "$out/bin"
    cp bluetooth-autoconnect "$out/bin"
  '';

  preFixup = ''
    substituteInPlace $out/bin/bluetooth-autoconnect \
      --replace '#!/usr/bin/env -S python3 -u' '#!${python}/bin/python'
  '';

  meta = with lib; {
    description = "A linux command line tool to automatically connect to all paired and trusted bluetooth devices";
    homepage = "https://github.com/jrouleau/bluetooth-autoconnect";
    license = licenses.mit;
    maintainers = with maintainers; [ metadark ];
  };
}

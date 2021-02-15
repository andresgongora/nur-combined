{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools_scm
, pytestCheckHook
, cmake
}:

buildPythonPackage rec {
  pname = "pytest-datadir";
  version = "1.3.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "gabrielcnr";
    repo = pname;
    rev = version;
    hash = "sha256-zv7f416GI+2E5daN33kEvFIQr/N1NpAL59Vii7W5j08=";
  };

  nativeBuildInputs = [ setuptools_scm ];

  preBuild = ''
    export SETUPTOOLS_SCM_PRETEND_VERSION="${version}"
  '';

  checkInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "Pytest plugin for manipulating test data directories and files";
    homepage = "https://github.com/gabrielcnr/pytest-datadir";
    license = licenses.mit;
    maintainers = with maintainers; [ metadark ];
  };
}

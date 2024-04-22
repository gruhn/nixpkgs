{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, python-dateutil
, poetry-core
, requests
}:

buildPythonPackage rec {
  pname = "tidalapi";
  version = "0.7.6";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-X6U34T1sM4P+JFpOfcI7CmULcGZ4SCXwP2fFHKi1cWE=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    requests
    python-dateutil
  ];

  doCheck = false; # tests require internet access

  pythonImportsCheck = [
    "tidalapi"
  ];

  meta = with lib; {
    changelog = "https://github.com/tamland/python-tidal/releases/tag/v${version}";
    description = "Unofficial Python API for TIDAL music streaming service";
    homepage = "https://github.com/tamland/python-tidal";
    license = licenses.gpl3;
    maintainers = [ ];
  };
}

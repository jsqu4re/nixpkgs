{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  pythonOlder,
  setuptools,
}:

buildPythonPackage rec {
  pname = "gekko";
  version = "1.2.1";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a3Iy61B3JddLeEilaa5Z0smQepjkfyNr4mOCEx+1LlM=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  # Module has no tests
  doCHeck = false;

  pythonImportsCheck = [ "gekko" ];

  meta = with lib; {
    description = "Module for machine learning and optimization";
    homepage = "https://github.com/BYU-PRISM/GEKKO";
    changelog = "https://github.com/BYU-PRISM/GEKKO/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ BatteredBunny ];
  };
}

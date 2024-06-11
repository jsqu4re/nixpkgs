{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchNpmDeps,
  npmHooks,
  setuptools,
  setuptools-scm,
  poetry-core,
  nodejs,
  sphinx,
  markupsafe,
  pydantic,
  pydantic-extra-types,
  typing-extensions,
  appdirs,
  requests
}:

buildPythonPackage rec {
  pname = "sphinx-immaterial";
  version = "0.11.11";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "jbms";
    repo = "sphinx-immaterial";
    rev = "v${version}";
    sha256 = "sha256-Wcc3Bkp9i3L9gxNVZO/+8rvAGzH6I+XRO8kzbVYbT4k=";
  };

  propagatedBuildInputs = [
    sphinx
    markupsafe
    pydantic
    pydantic-extra-types
    typing-extensions
    appdirs
    requests
  ];

  env.npmDeps = fetchNpmDeps {
    name = "sphinx-immaterial-npm-deps";
    src = "${src}";
    hash = "sha256-NUKCAsn3Y9/gDkez5NgnCMKoQm45JSvR/oAepChDAJg=";
  };

  preBuild = ''
    npm run build
  '';

  nativeBuildInputs = [
    setuptools
    poetry-core
    setuptools-scm
    nodejs
    npmHooks.npmConfigHook
  ];

  meta = with lib; {
    description = "This theme is a fork of the sphinx-material theme, which proved the concept of a Sphinx theme based on an earlier version of the mkdocs-material theme, but has now significantly diverged from the upstream mkdocs-material repository.";
    homepage = "https://jbms.github.io/sphinx-immaterial/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}

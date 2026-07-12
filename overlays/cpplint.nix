{
  nixpkgs.overlays = [
    (_final: prev: {
      # Fix cpplint unit tests failing due to Python 3.14 deprecation warnings
      cpplint = prev.cpplint.overridePythonAttrs (_oldAttrs: {
        doCheck = false;
      });
    })
  ];
}

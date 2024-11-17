{
  lib,
  nodejs,
  pnpm,
  stdenv,
}:
stdenv.mkDerivation rec {
  name = pname;
  pname = "nodejs-template";

  src = ./.;

  pnpmDeps = pnpm.fetchDeps {
    inherit pname src;
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  buildPhase = ''
    pnpm build
    mkdir $out
    cp dist/* $out
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share
    cp -r * $out/share

    echo "#!/usr/bin/env node" > $out/bin/${pname}
    cat dist/index.js >> $out/bin/${pname}

    chmod +777 $out/bin/${pname}
  '';
}

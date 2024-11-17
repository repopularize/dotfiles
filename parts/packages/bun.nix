{
  lib,
  pkgs,
  ...
}:
pkgs.stdenvNoCC.mkDerivation rec {
  version = "1.1.26";
  pname = "bun";

  src =
    passthru.sources.${pkgs.stdenvNoCC.hostPlatform.system}
      or (throw "Unsupported system: ${pkgs.stdenvNoCC.hostPlatform.system}");

  strictDeps = true;
  nativeBuildInputs = [
    pkgs.unzip
    pkgs.installShellFiles
  ] ++ lib.optionals pkgs.stdenvNoCC.isLinux [ pkgs.autoPatchelfHook ];
  buildInputs = [ pkgs.openssl ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm 755 ./bun $out/bin/bun
    ln -s $out/bin/bun $out/bin/bunx

    runHook postInstall
  '';

  # postPhases = [ "postPatchelf" ];
  # postPatchelf = ''
  #   completions_dir=$(mktemp -d)

  #   SHELL="bash" $out/bin/bun completions $completions_dir
  #   SHELL="zsh" $out/bin/bun completions $completions_dir
  #   SHELL="fish" $out/bin/bun completions $completions_dir

  #   installShellCompletion --name bun \
  #     --bash $completions_dir/bun.completion.bash \
  #     --zsh $completions_dir/_bun \
  #     --fish $completions_dir/bun.fish
  # '';
  # commented out because for some reason it keeps fucking SEGFAULTING AND I DONT EVEN USE ANY OF THOSE SHELLS SO I DONT NEED IT

  passthru = {
    sources = {
      "aarch64-darwin" = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.1.26/bun-darwin-aarch64.zip";
        hash = "sha256-WATRJhepP2uwJCcuD3YOqhpgaHXIeMtJcjVUaSCZadg=";
      };
      "aarch64-linux" = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.1.26/bun-linux-aarch64.zip";
        hash = "sha256-Vxn2GepUR5gW+qPbaTh6JBCG35O+SoYn2s3+EXA+RiI=";
      };
      "x86_64-darwin" = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.1.26/bun-darwin-x64-baseline.zip";
        hash = "sha256-MecN8xkIurwqW/N7qRoIana76Mr0dV4sOcZfO/XCtHg=";
      };
      "x86_64-linux" = pkgs.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.1.26/bun-linux-x64-baseline.zip";
        hash = "sha256-NFRx0L9qsPjooV8qHrAlnl0aadymDAvER2j22o1Mq2w=";
      };
    };
    updateScript = pkgs.writeShellScript "update-bun" ''
      set -o errexit
      export PATH="${
        lib.makeBinPath [
          pkgs.curl
          pkgs.jq
          pkgs.common-updater-scripts
        ]
      }"
      NEW_VERSION=$(curl --silent https://api.github.com/repos/oven-sh/bun/releases/latest | jq '.tag_name | ltrimstr("bun-v")' --raw-output)
      if [[ "${version}" = "$NEW_VERSION" ]]; then
          echo "The new version same as the old version."
          exit 0
      fi
      for platform in ${lib.escapeShellArgs meta.platforms}; do
        update-source-version "bun" "$NEW_VERSION" --ignore-same-version --source-key="sources.$platform"
      done
    '';
  };
  meta = with lib; {
    homepage = "https://bun.sh";
    changelog = "https://bun.sh/blog/bun-v${version}";
    description = "Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    longDescription = ''
      All in one fast & easy-to-use tool. Instead of 1,000 node_modules for development, you only need bun.
    '';
    license = with licenses; [
      mit # bun core
      lgpl21Only # javascriptcore and webkit
    ];
    mainProgram = "bun";
    maintainers = with maintainers; [
      DAlperin
      jk
      thilobillerbeck
      cdmistman
      coffeeispower
      diogomdp
    ];
    platforms = builtins.attrNames passthru.sources;
    # Broken for Musl at 2024-01-13, tracking issue:
    # https://github.com/NixOS/nixpkgs/issues/280716
    broken = pkgs.stdenvNoCC.hostPlatform.isMusl;
  };
}

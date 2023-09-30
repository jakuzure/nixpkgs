{ lib, stdenv, undmg, fetchurl }:
let
  common = import ./common.nix { inherit fetchurl; };
  inherit (stdenv.hostPlatform) system;
in
stdenv.mkDerivation rec {
  inherit (common) pname version;
  src = common.sources.${system} or (throw "Source for ${pname} is not available for ${system}");

  appName = "Roam Research";

  sourceRoot = "${appName}.app";

  buildInputs = [ undmg ];
  installPhase = ''
    mkdir -p "$out/Applications/${appName}.app"
    cp -R . "$out/Applications/${appName}.app"
  '';

  meta = with lib; {
    description = "A note-taking tool for networked thought.";
    homepage = "https://roamresearch.com/";
    maintainers = with lib.maintainers; [ dbalan ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}

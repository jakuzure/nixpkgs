{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "net-news-wire";
  appName = "NetNewsWire";
  version = "6.1.4";

  src = fetchzip {
    url = "https://github.com/Ranchero-Software/${appName}/releases/download/mac-${version}/${appName}${version}.zip";
    hash = "sha256-9RuvMklwFBi7KbR0P2HU1Mpe5t78W7CwtoxAkU5E2og=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications
    cp -R NetNewsWire.app $out/Applications/
    runHook postInstall
  '';

  meta = with lib; {
    description = "RSS reader for macOS and iOS";
    longDescription = ''
      It's like podcasts — but for reading.
      NetNewsWire shows you articles from your favorite blogs and news sites and keeps track of what you've read.
    '';
    homepage = "https://github.com/Ranchero-Software/NetNewsWire";
    changelog =
      "https://github.com/Ranchero-Software/NetNewsWire/releases/tag/mac-${version}";
    license = licenses.mit;
    platforms = platforms.darwin;
    maintainers = with maintainers; [ jakuzure ];
  };
}

{ fetchurl }:
let
  pname = "roam-research";
  version = "0.0.18";
in
{
  inherit pname version;
  sources = {
    x86_64-darwin = fetchurl {
      sha256 = "sha256-jyFNH3qrgrsftExL/b2t8bY3W3fYVz+Gp11AuaIMxbg=";
      url = "https://roam-electron-deploy.s3.us-east-2.amazonaws.com/Roam+Research-${version}.dmg";
    };
    aarch64-darwin = fetchurl {
      sha256 = "sha256-AnyvFCbyUi6tcgxYQAj+zPLl4/kVh9ZeupetRhzH0PU=";
      url = "https://roam-electron-deploy.s3.us-east-2.amazonaws.com/Roam+Research-${version}-arm64.dmg";
    };
    x86_64-linux = fetchurl {
      sha256 = "sha256-veDWBFZbODsdaO1UdfuC4w6oGCkeVBe+fqKn5XVHKDQ=";
      url = "https://roam-electron-deploy.s3.us-east-2.amazonaws.com/${pname}_${version}_amd64.deb";
    };
  };
}

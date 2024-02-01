{ lib
, buildGoModule
, fetchFromGitHub
, nix-update-script
}:

buildGoModule rec {
  pname = "glasskube";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "glasskube";
    repo = "glasskube";
    rev = "refs/tags/v${version}";
    hash = "sha256-BVCY6qOXu+fZV8bCy1OqedK3Q3zNKgZPFsbu7A95onM=";
  };

  vendorHash = "sha256-KWZzuWLTfg99qlUQ8Z5z0I0uDwFdAseVMYPViPt2jao=";

  CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" "-X github.com/glasskube/glasskube/internal/config.Version=${version}" "-X github.com/glasskube/glasskube/internal/config.Commit=${src.rev}" ];

  subPackages = [ "cmd/${pname}" "cmd/package-operator" ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "The missing Package Manager for Kubernetes featuring a GUI and a CLI";
    homepage = "https://github.com/glasskube/glasskube";
    changelog = "https://github.com/glasskube/glasskube/releases/tag/v${version}";
    maintainers = with maintainers; [ jakuzure ];
    license = licenses.asl20;
    mainProgram = "glasskube";
  };
}

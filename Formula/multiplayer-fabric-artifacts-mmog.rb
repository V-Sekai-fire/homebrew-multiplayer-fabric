class MultiplayerFabricArtifactsMmog < Formula
  desc "ArtifactsMMO automated game agent with HTN planning"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-artifacts-mmog"
  version "0.1.0"
  license "MIT"

  url "https://github.com/V-Sekai-fire/multiplayer-fabric-artifacts-mmog/releases/download/v#{version}/artifacts_mmog"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  depends_on "erlang"

  def install
    bin.install "artifacts_mmog"
  end

  test do
    assert_match "goals", shell_output("#{bin}/artifacts_mmog goals 2>&1")
  end
end

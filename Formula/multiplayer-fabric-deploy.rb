class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.3"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.3/multiplayer_fabric_deploy-v0.4.3-darwin-arm64.tar.gz"
      sha256 "e6119e89661dabcb323fc4a45bc82478adabc5c658eb607e15ffba903d207662"
    end
  end

  def install
    libexec.install Dir["*"]

    (bin/"multiplayer_fabric_deploy").write <<~SH
      #!/bin/sh
      exec #{libexec}/bin/multiplayer_fabric_deploy eval "MultiplayerFabricDeploy.main([])"
    SH
  end

  test do
    assert_predicate libexec/"bin/multiplayer_fabric_deploy", :exist?
  end
end

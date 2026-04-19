class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.0"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.0/multiplayer_fabric_deploy-v0.4.0-darwin-arm64.tar.gz"
      sha256 "8954561ee2aaee0349a410427d1a924eb8bf1651badf588597ffa4b73f0c4caf"
    end
  end

  def install
    libexec.install "multiplayer_fabric_deploy"

    (bin/"multiplayer_fabric_deploy").write <<~SH
      #!/bin/sh
      exec #{libexec}/multiplayer_fabric_deploy/bin/multiplayer_fabric_deploy eval "MultiplayerFabricDeploy.main([])"
    SH
  end

  test do
    assert_predicate libexec/"multiplayer_fabric_deploy/bin/multiplayer_fabric_deploy", :exist?
  end
end

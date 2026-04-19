class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.3.1/multiplayer_fabric_deploy-v0.3.1-darwin-arm64.tar.gz"
      sha256 "63b31d6f5e6426ccccfb0b8f6c9ffb555e03c21954f3b38fd4a12443f5007c12"
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

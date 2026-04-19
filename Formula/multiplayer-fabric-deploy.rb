class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.3.0/multiplayer_fabric_deploy-v0.3.0-darwin-arm64.tar.gz"
      sha256 "9c044ea765861b98043b07a01b51ac89d35f04b215e5b04e8c1afb41a80effb3"
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

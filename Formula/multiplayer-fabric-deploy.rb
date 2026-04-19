class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.1"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.1/multiplayer_fabric_deploy-v0.4.1-darwin-arm64.tar.gz"
      sha256 "1d78f5d18033f5af826874b929dd82e7547868c3907c55a3f825b6ce1345a163"
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

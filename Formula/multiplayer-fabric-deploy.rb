class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.7"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.7/multiplayer_fabric_deploy-v0.4.7-darwin-arm64.tar.gz"
      sha256 "5fe36ecf9d444208be233f27e4bf447a3aa30f3cc16524bedbe68b917b25ee4a"
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

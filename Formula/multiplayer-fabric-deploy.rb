class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.2"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.2/multiplayer_fabric_deploy-v0.4.2-darwin-arm64.tar.gz"
      sha256 "61292b577d91e8a7fc7eee8617a99e7e280c0225cd4e6513af13e1f168597906"
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

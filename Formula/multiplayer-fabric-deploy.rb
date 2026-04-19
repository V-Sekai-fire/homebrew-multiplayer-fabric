class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.6"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.6/multiplayer_fabric_deploy-v0.4.6-darwin-arm64.tar.gz"
      sha256 "00990edc4cf2c24a34d0ff2ebdcf8e01eddd3f4a100dc9c777bf7f3376eb5170"
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

class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.10"
  license "MIT"

  depends_on "libgit2"
  depends_on "sccache"
  depends_on "scons"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.10/multiplayer_fabric_deploy-v0.4.10-darwin-arm64.tar.gz"
      sha256 "c85a926d2465d1dc6fadeaedf87e1de7bb95c01f439328c049ab3b42573a909e"
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

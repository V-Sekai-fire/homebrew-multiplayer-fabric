class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  version "0.4.5"
  license "MIT"

  depends_on "libgit2"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/releases/download/v0.4.5/multiplayer_fabric_deploy-v0.4.5-darwin-arm64.tar.gz"
      sha256 "632bbd82e00ef1e2ed215cd9276619a203b7549101cffbd2840c7634929d7c16"
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

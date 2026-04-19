class MultiplayerFabricDesync < Formula
  desc "Content-addressed binary distribution for multiplayer fabric"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-desync"
  version "0.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-desync/releases/download/v0.0.0/multiplayer-fabric-desync_Darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-desync/releases/download/v0.0.0/multiplayer-fabric-desync_Darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "desync"
  end

  test do
    system "#{bin}/desync", "--help"
  end
end

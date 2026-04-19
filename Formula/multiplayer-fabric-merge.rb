class MultiplayerFabricMerge < Formula
  desc "Git branch assembly tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-merge"
  version "0.0.0"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-merge/releases/download/v0.0.0/multiplayer-fabric-merge_Darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-merge/releases/download/v0.0.0/multiplayer-fabric-merge_Darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-merge/releases/download/v0.0.0/multiplayer-fabric-merge_Linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-merge/releases/download/v0.0.0/multiplayer-fabric-merge_Linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "multiplayer-fabric-merge"
  end

  test do
    system "#{bin}/multiplayer-fabric-merge", "--help"
  end
end

class MultiplayerFabricZoneBackend < Formula
  desc "Phoenix/Elixir backend for multiplayer-fabric zone management and asset storage"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-zone-backend"
  version "0.1.0"
  license "MIT"

  depends_on "elixir"
  depends_on "cockroachdb" => :optional

  on_macos do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-zone-backend/releases/download/v0.1.0/multiplayer_fabric_zone_backend-v0.1.0-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-zone-backend/releases/download/v0.1.0/multiplayer_fabric_zone_backend-v0.1.0-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-zone-backend/releases/download/v0.1.0/multiplayer_fabric_zone_backend-v0.1.0-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/V-Sekai-fire/multiplayer-fabric-zone-backend/releases/download/v0.1.0/multiplayer_fabric_zone_backend-v0.1.0-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    libexec.install Dir["*"]

    (bin/"multiplayer_fabric_zone_backend").write <<~SH
      #!/bin/sh
      exec #{libexec}/bin/uro "$@"
    SH
  end

  def post_install
    (var/"multiplayer-fabric-zone-backend").mkpath
  end

  service do
    run [opt_bin/"multiplayer_fabric_zone_backend", "start"]
    keep_alive true
    log_path var/"log/multiplayer-fabric-zone-backend.log"
    error_log_path var/"log/multiplayer-fabric-zone-backend.log"
  end

  test do
    assert_predicate libexec/"bin/uro", :exist?
  end
end

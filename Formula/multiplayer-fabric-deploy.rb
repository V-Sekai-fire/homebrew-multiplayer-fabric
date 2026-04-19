class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dbdb8b579e4e4f70868c740c3988efe25913363e674b14c614042c30baea10ee"
  version "0.1.0"
  license "MIT"

  depends_on "elixir"

  def install
    system "mix", "local.hex", "--force"
    system "mix", "local.rebar", "--force"
    ENV["MIX_ENV"] = "prod"
    system "mix", "deps.get", "--only", "prod"
    system "mix", "escript.build"
    bin.install "multiplayer_fabric_deploy"
  end

  test do
    assert_match "Available tasks", shell_output("#{bin}/multiplayer_fabric_deploy 2>&1 || true")
  end
end

class MultiplayerFabricDeploy < Formula
  desc "TUI deploy tool for multiplayer-fabric-godot builds"
  homepage "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy"
  url "https://github.com/V-Sekai-fire/multiplayer-fabric-deploy/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0e867e33512d45cbc5b2a5b43e0b9c39fa44920f9bf2d85fa57635459bf7efd9"
  version "0.2.0"
  license "MIT"

  depends_on "elixir"

  def install
    libexec.install Dir["*"]

    system "#{Formula["elixir"].bin}/mix", "local.hex", "--force"
    system "#{Formula["elixir"].bin}/mix", "local.rebar", "--force"

    cd libexec do
      ENV["MIX_ENV"] = "prod"
      system "#{Formula["elixir"].bin}/mix", "deps.get", "--only", "prod"
    end

    (bin/"multiplayer_fabric_deploy").write <<~SH
      #!/bin/sh
      cd #{libexec} && MIX_ENV=prod exec #{Formula["elixir"].bin}/mix run \
        -e "MultiplayerFabricDeploy.main([])" "$@"
    SH
  end

  test do
    assert_predicate bin/"multiplayer_fabric_deploy", :exist?
  end
end

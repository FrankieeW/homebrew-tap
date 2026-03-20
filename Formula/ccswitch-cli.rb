class CcswitchCli < Formula
  desc "CLI for managing CC Switch providers"
  homepage "https://github.com/FrankieeW/ccswitch-cli"
  url "https://github.com/FrankieeW/ccswitch-cli.git", tag: "v0.1.0", revision: "826ad0e"
  license "MIT"
  head "https://github.com/FrankieeW/ccswitch-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--manifest-path=Cargo.toml"
    bin.install "target/release/ccswitch-cli" => "ccswitch-cli"
  end

  test do
    assert_match "ccswitch-cli", shell_output("#{bin}/ccswitch-cli --version")
  end
end
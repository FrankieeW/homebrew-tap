class LmfdbCli < Formula
  desc "CLI tool for querying LMFDB (L-Functions and Modular Forms Database)"
  homepage "https://github.com/FrankieeW/lmfdb-cli"
  url "https://github.com/FrankieeW/lmfdb-cli.git"
  version "1.2.0"
  license "MIT"
  head "https://github.com/FrankieeW/lmfdb-cli.git"
  
  def install
    # Build from source - cd to repo root first
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-o", "lmfdb", "."
    bin.install "lmfdb"
  end
  
  test do
    assert_match "LMFDB CLI", shell_output("#{bin}/lmfdb version")
  end
end

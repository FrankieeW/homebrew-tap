class LmfdbCli < Formula
  desc "CLI tool for querying LMFDB (L-Functions and Modular Forms Database)"
  homepage "https://github.com/FrankieeW/lmfdb-cli"
  url "https://github.com/FrankieeW/lmfdb-cli.git", tag: "v1.2.2", revision: "50d6448abcbebd1edc364d870e541ebd00b7131f"
  license "MIT"
  head "https://github.com/FrankieeW/lmfdb-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    # Build Go binary
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-o", "lmfdb", "./cmd/lmfdb"
    bin.install "lmfdb"
  end

  test do
    assert_match "LMFDB CLI", shell_output("#{bin}/lmfdb version")
  end
end

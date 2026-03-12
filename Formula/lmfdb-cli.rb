class LmfdbCli < Formula
  desc "CLI tool for querying LMFDB (L-Functions and Modular Forms Database)"
  homepage "https://github.com/FrankieeW/lmfdb-cli"
  url "https://github.com/FrankieeW/lmfdb-cli.git", tag: "v1.3.0", revision: "90d5084370d91a8f20310721ea81883dc3d178f5"
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

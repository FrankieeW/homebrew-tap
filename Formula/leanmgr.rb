class Leanmgr < Formula
  desc "Manage disposable .lake cache state across many Lean 4 projects"
  homepage "https://github.com/FrankieeW/leanmgr"
  # NOTE: set `revision:` to the tagged commit SHA when v0.1.0 is pushed.
  url "https://github.com/FrankieeW/leanmgr.git", tag: "v0.1.0"
  license "MIT"
  head "https://github.com/FrankieeW/leanmgr.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "leanmgr", shell_output("#{bin}/leanmgr --version")
  end
end

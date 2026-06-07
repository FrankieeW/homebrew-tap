class Leanmgr < Formula
  desc "Manage disposable .lake cache state across many Lean 4 projects"
  homepage "https://github.com/FrankieeW/leanmgr"
  url "https://github.com/FrankieeW/leanmgr.git",
      tag:      "v0.2.0",
      revision: "48ac8af44925a5f7d1a00ed4c7de4199fa0c2dc9"
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

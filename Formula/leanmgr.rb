class Leanmgr < Formula
  desc "Manage disposable .lake cache state across many Lean 4 projects"
  homepage "https://github.com/FrankieeW/leanmgr"
  url "https://github.com/FrankieeW/leanmgr.git",
      tag:      "v0.1.0",
      revision: "a037c2c4871076dc53e369be4be11e796bbaa4c7"
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

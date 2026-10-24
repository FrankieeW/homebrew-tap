class Headway < Formula
  desc "Keep GitHub-built apps and CLI tools current, commit by commit or by release"
  homepage "https://github.com/FrankieeW/headway"
  url "https://github.com/FrankieeW/headway.git",
      tag:      "v0.1.0",
      revision: "faae1f7ab84a33befc110cbec02a265ae63b6c14"
  license "MIT"
  head "https://github.com/FrankieeW/headway.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/headway-cli")
    generate_completions_from_executable(bin/"headway", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/headway --version")
    ENV["HEADWAY_HOME"] = testpath.to_s
    assert_match '"ok": true', shell_output("#{bin}/headway --json list")
  end
end

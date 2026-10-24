class Headway < Formula
  desc "Keep apps and CLI tools current via GitHub, npm, Homebrew or scripts"
  homepage "https://github.com/FrankieeW/headway"
  url "https://github.com/FrankieeW/headway.git",
      tag:      "v0.2.1",
      revision: "460079b1b4c96f4123f6a984a851306bf811ea5b"
  license "MIT"
  head "https://github.com/FrankieeW/headway.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    if build.stable?
      ENV["HEADWAY_BUILD_SHA"] = stable.specs[:revision]
      ENV["HEADWAY_BUILD_DIRTY"] = "false"
    end
    ENV["HEADWAY_BUILD_TARGET"] = Hardware::CPU.arm? ? "aarch64-apple-darwin" : "x86_64-apple-darwin"
    system "cargo", "install", *std_cargo_args(path: "crates/headway-cli")
    generate_completions_from_executable(bin/"headway", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/headway --version")
    ENV["HEADWAY_HOME"] = testpath.to_s
    assert_match '"ok": true', shell_output("#{bin}/headway --json list")
    metadata = JSON.parse(shell_output("#{bin}/headway --json version"))
    assert_equal version.to_s, metadata.fetch("data").fetch("version")
    assert_equal stable.specs[:revision], metadata.fetch("data").fetch("commit") if build.stable?
  end
end

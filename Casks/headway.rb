cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "0159071575b29f8522d50865c740ae8bc493f30f25ea5913f10fdd4f0f4deb51",
         intel: "33f06aecd3c3c9a12a13f50de8db6d202a6e6b0935d2602592f69050d49b02fc"

  url "https://github.com/FrankieeW/headway/releases/download/v#{version}/Headway-#{version}-#{arch}.dmg"
  name "Headway"
  desc "Keep apps and CLI tools current from multiple sources"
  homepage "https://github.com/FrankieeW/headway"

  depends_on macos: :monterey

  app "Headway.app"

  # Ad-hoc signed, not notarized: without this macOS refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Headway.app"]
  end

  zap trash: [
    "~/Library/Application Support/Headway",
    "~/Library/Application Support/wang.frankie.headway",
    "~/Library/Caches/Headway",
    "~/Library/Caches/wang.frankie.headway",
    "~/Library/LaunchAgents/Headway.plist",
    "~/Library/Logs/Headway",
    "~/Library/WebKit/wang.frankie.headway",
  ]
end

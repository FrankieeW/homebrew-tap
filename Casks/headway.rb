cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "75664f52513903a51074ef9463a2f6faba0c671b7543642ef3098ef3e255b194",
         intel: "6ee24ddeb249c79c27e310c0e70fc496608354a7969ac2bb4aa1320c6fd59a22"

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

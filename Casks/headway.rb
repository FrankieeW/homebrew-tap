cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "161799051a247916f996639d572164e0d74ea1cb5515707097b7e074e800f13a",
         intel: "ddbf2fba8015f44da5fbe4bb0cbb3a6df5e8ff8b2e1b6bdb97fabd00a25a3308"

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

cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "b6651c7b55387f2ca7bb306296e51a98c9ccaadc8ba51895d5b4899d2672cea2",
         intel: "a0035c4f7fb1c1d448c834eeb350207a0c3de565e2b41c66c7792007fedac5fa"

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

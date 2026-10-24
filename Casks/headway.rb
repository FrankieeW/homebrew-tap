cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "95007169c3d9cbcff5763d6e7528ddfa05576a19afdfd6a2e9fe7bbe4747c604",
         intel: "677d156fab323f4a98479ba65a30e2e0081a4726cdac189bdf3dcdbdc763d264"

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

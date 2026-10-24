cask "headway" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "22336319c72b6dec6bfb4b63f4e52ab53e991d7dfac962da79345d9249a0bd88",
         intel: "04c28cd3cd07e9ffc4ca3cfeb3b44888c6814dda0b240487ba4e97eeb9c655c9"

  url "https://github.com/FrankieeW/headway/releases/download/v#{version}/Headway-#{version}-#{arch}.dmg"
  name "Headway"
  desc "Menu-bar app that keeps GitHub-built apps and CLI tools current"
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

uby cask "follow" do version "0.3.4-beta.0" sha256 "0c348995f7cfa1ce332ac4d20a95c3fb3c529d6daf8ec0d12a470d956a462cb3"

    url "https://github.com/RSSNext/Follow/releases/download/v#{version}/Follow-#{version}-macos-arm64.dmg", verified: "github.com/RSSNext/Follow/" name "Follow" desc "Your RSS App Description" homepage "https://github.com/RSSNext/Follow"

    app "Follow.app" end

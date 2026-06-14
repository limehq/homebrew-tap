cask "munkel" do
  version "0.4.2"
  sha256 "10ef3edb5fbe97316ddc16fd4ad0bbd1d6298b859b3adafe4a9d2aebc32319c9"

  url "https://github.com/limehq/munkel/releases/download/v#{version}/Munkel-#{version}.zip",
      verified: "github.com/limehq/munkel/"
  name "Munkel"
  desc "Ephemeral whispers that slide out of the MacBook notch"
  homepage "https://munkel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Munkel.app"
  binary "bin/munkel"

  uninstall quit: "dev.uq.munkel"

  zap trash: [
    "~/Library/Application Support/Munkel",
    "~/Library/Preferences/dev.uq.munkel.plist",
    "~/Library/Saved Application State/dev.uq.munkel.savedState",
  ]
end

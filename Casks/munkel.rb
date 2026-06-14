cask "munkel" do
  version "0.4.1"
  sha256 "c4a8b353fe1cc40267df703b6789504a82fdbfd776583814c5aebdaf7b9c755d"

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

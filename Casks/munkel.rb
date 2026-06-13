cask "munkel" do
  version "0.4.0"
  sha256 "04df6b77a3b6549ca4f5cf34ccdab235a561a61d73f646f2687651cd361d4e4e"

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

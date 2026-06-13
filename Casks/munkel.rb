cask "munkel" do
  version "0.2.0"
  sha256 "954c1a021b08f4103585b8b92c2c4406b02695bbff3d74c2f4776f1ca0dc331d"

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

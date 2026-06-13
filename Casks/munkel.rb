cask "munkel" do
  version "0.3.0"
  sha256 "35c26e400898db8b4e30b1d502407fa7e41cfd23fe170c2485d1733712377933"

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

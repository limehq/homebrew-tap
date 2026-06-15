cask "munkel" do
  version "0.6.0"
  sha256 "8cbd4d9f59455257dba28c39f22d6fa31a5ba6de86e9fea52562bc39c624c8b5"

  url "https://github.com/limehq/munkel/releases/download/v#{version}/Munkel-#{version}.dmg",
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
  # The munkel CLI ships inside the app bundle; expose it on PATH for Homebrew
  # users. DMG users opt in from the app's "Install Command Line Tool" menu.
  binary "#{appdir}/Munkel.app/Contents/Resources/munkel"

  uninstall quit: "dev.uq.munkel"

  zap trash: [
    "~/Library/Application Support/Munkel",
    "~/Library/Preferences/dev.uq.munkel.plist",
    "~/Library/Saved Application State/dev.uq.munkel.savedState",
  ]
end

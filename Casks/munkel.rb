cask "munkel" do
  version "0.18.2"
  sha256 "1b032380bdb80f0430ffc05c19804e757077ce2c65b49ba1c177b079ba8dbb29"

  url "https://github.com/limehq/munkel/releases/download/v#{version}/Munkel-#{version}.dmg",
      verified: "github.com/limehq/munkel/"
  name "Munkel"
  desc "Ephemeral whispers that slide out of the MacBook notch"
  homepage "https://munkel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Munkel self-updates via Sparkle; tell Homebrew not to fight the in-place
  # update (or flag the app as outdated after Sparkle has already updated it).
  auto_updates true

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

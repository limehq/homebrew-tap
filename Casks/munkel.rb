cask "munkel" do
  version "0.8.2"
  sha256 "df9f4adf93a28086d6149f9c49dd46b354df3eb5b3d41907a3152a88f14f6392"

  url "https://github.com/limehq/munkel/releases/download/v#{version}/Munkel-#{version}.dmg",
      verified: "github.com/limehq/munkel/"
  name "Munkel"
  desc "Ephemeral whispers that slide out of the MacBook notch"
  homepage "https://munkel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Munkel self-updates via Sparkle; tell Homebrew so [32m==>[0m [1mDownloading bottle manifests[0m
[32m==>[0m [1mUpgrading 1 outdated package:[0m
rustup 1.29.0 -> 1.29.0_2
[32m==>[0m [1mFetching downloads for: [32mrustup[39m[0m
[32m==>[0m [1mUpgrading [32mrustup[39m[0m
  1.29.0 -> 1.29.0_2 
[34m==>[0m [1mPouring rustup--1.29.0_2.arm64_tahoe.bottle.tar.gz[0m
[34m==>[0m [1mCaveats[0m
To use rustup, ensure you have "$(brew --prefix rustup)/bin" in your $PATH:
  [4mhttps://rust-lang.github.io/rustup/installation/already-installed-rust.html[24m

This formula no longer provides `rustup-init`.

rustup is keg-only, which means it was not symlinked into /opt/homebrew,
because it conflicts with rust.

If you need to have rustup first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/rustup/bin:$PATH"' >> /Users/runner/.bash_profile
[34m==>[0m [1mSummary[0m
🍺  /opt/homebrew/Cellar/rustup/1.29.0_2: 44 files, 11.4MB
[32m==>[0m [1mCaveats[0m
Bash completion has been installed to:
  /opt/homebrew/opt/rustup/etc/bash_completion.d
[32m==>[0m [1mUpgraded 1 outdated package[0m
rustup 1.29.0 -> 1.29.0_2 doesn't
  # fight the in-place update (or flag the app as outdated after Sparkle ran).
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

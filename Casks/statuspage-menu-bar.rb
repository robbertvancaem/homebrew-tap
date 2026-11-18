cask "statuspage-menu-bar" do
  version "0.3.0"
  sha256 "fa6e7044e4f8a18efe7431d6cd34f2cf4b468b511aacc8cfd53f75314f186741"

  url "https://github.com/robbertvancaem/statuspage-menu-bar/releases/download/v#{version}/Statuspage-Menu-Bar-v#{version}.zip"
  name "Statuspage Menu Bar"
  desc "Menu bar app showing live status of Claude, Kinsta, GitHub or any Statuspage"
  homepage "https://github.com/robbertvancaem/statuspage-menu-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Statuspage Menu Bar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Statuspage Menu Bar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.robbertvancaem.statuspage-menu-bar.plist",
    "~/Library/Saved Application State/com.robbertvancaem.statuspage-menu-bar.savedState",
  ]
end

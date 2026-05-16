cask "claude-status-bar" do
  version "0.1.0"
  sha256 "12e8f5e4df6d4b451da0693b0eca284be7c5be689e72fc601d1446129c366f7d"

  url "https://github.com/robbertvancaem/claude-status-bar/releases/download/v#{version}/Claude-Status-Bar-v#{version}.zip"
  name "Claude Status Bar"
  desc "Menu bar app that shows live Claude service status from status.claude.com"
  homepage "https://github.com/robbertvancaem/claude-status-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Claude Status Bar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Status Bar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.robbertvancaem.claude-status-bar.plist",
    "~/Library/Saved Application State/com.robbertvancaem.claude-status-bar.savedState",
  ]
end

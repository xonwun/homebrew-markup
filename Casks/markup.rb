cask "markup" do
  version "0.6.0"
  sha256 "9eb65ebdd6e260cdc2f3333f94d3f8657f7151c91f4b0e9012312983e143d774"

  url "https://github.com/xonwun/MarkUp/releases/download/v#{version}/MarkUp.md-#{version}.dmg"
  name "MarkUp.md"
  desc "Calm, local Markdown editor"
  homepage "https://github.com/xonwun/MarkUp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "MarkUp.md.app"

  zap trash: [
    "~/Library/Application Support/MarkUp",
    "~/Library/Preferences/local.markup.editor.plist",
    "~/Library/Saved Application State/local.markup.editor.savedState",
  ]

  caveats <<~EOS
    MarkUp.md is not notarized by Apple yet. The first time you open it, macOS will say
    it could not verify the app: click Done, then open System Settings → Privacy & Security
    and click Open Anyway.
  EOS
end

cask "markup" do
  version "0.6.1"
  sha256 "79b2d9216595536a880e51ce8eefb7bc2c021cefe9f817bedc07e05c69845708"

  url "https://github.com/xonwun/MarkUp/releases/download/v#{version}/MarkUp.md-#{version}.dmg"
  name "MarkUp.md"
  desc "Calm, local Markdown editor"
  homepage "https://github.com/xonwun/MarkUp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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

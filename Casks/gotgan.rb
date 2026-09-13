cask "gotgan" do
  version "0.1.2"
  sha256 "53d55599840bc0c0332d444de4195651ad60cfadf8b1b872cc9e0e8322ad70aa"

  url "https://github.com/nad4-su/gotgan/releases/download/v#{version}/Gotgan-#{version}.dmg",
      verified: "github.com/nad4-su/gotgan/"
  name "GotGan"
  name "곳간"
  desc "Menu bar app showing remaining Claude and Codex usage"
  homepage "https://github.com/nad4-su/gotgan"

  # 위젯은 macOS 14 이상이 필요하지만 본체는 13 에서도 돈다.
  depends_on macos: ">= :ventura"

  app "Gotgan.app"

  uninstall quit:      "ai.promedius.gotgan",
            launchctl: "ai.promedius.gotgan"

  zap trash: [
    "~/.config/gotgan",
    "~/Library/Application Support/Gotgan",
    "~/Library/Logs/Gotgan.log",
    "~/Library/LaunchAgents/ai.promedius.gotgan.plist",
  ]

  caveats <<~EOS
    곳간은 애플 공증을 받지 않았습니다(연 $99 이 듭니다). 서명 자체는 성하지만,
    Homebrew 가 기본으로 격리 표를 붙이므로 그냥 열면 Gatekeeper 경고를 만납니다.

    경고를 아예 안 보려면 --no-quarantine 을 주어 설치하십시오:

        brew install --cask --no-quarantine gotgan

    이미 그냥 설치하셨다면 한 줄로 풀립니다:

        xattr -dr com.apple.quarantine /Applications/Gotgan.app

    ── English ──
    GotGan is not notarized by Apple (that costs $99/year). The signature itself is
    intact, but Homebrew applies the quarantine flag by default, so opening it meets
    a Gatekeeper warning. Install with --no-quarantine to skip that, or run the
    xattr line above on an app you already installed.

    곳간은 Dock 에 뜨지 않습니다. 메뉴 막대 오른쪽을 보십시오.
    GotGan has no Dock icon — look at the right end of the menu bar.
  EOS
end

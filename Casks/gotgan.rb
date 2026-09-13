cask "gotgan" do
  version "0.1.2"
  sha256 "53d55599840bc0c0332d444de4195651ad60cfadf8b1b872cc9e0e8322ad70aa"

  url "https://github.com/nad4-su/gotgan/releases/download/v#{version}/Gotgan-#{version}.dmg"
  name "GotGan"
  name "곳간"
  desc "Menu bar app showing remaining Claude and Codex usage"
  homepage "https://github.com/nad4-su/gotgan"

  # 위젯은 macOS 14 이상이 필요하지만 본체는 13 에서도 돈다.
  depends_on macos: :ventura

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
    곳간은 애플 공증을 받지 않았습니다(연 $99 이 듭니다). 서명 자체는 성하지만 Homebrew 가
    격리 표를 붙이므로, 처음 열 때 Gatekeeper 경고를 만납니다. 둘 중 하나로 푸십시오.

        xattr -dr com.apple.quarantine /Applications/Gotgan.app

    또는 경고 창에서 "완료"를 누른 뒤, 시스템 설정 → 개인정보 보호 및 보안 을 열어
    "Mac을 보호하기 위해 'Gotgan.app'을(를) 차단했습니다" 옆의 "그래도 열기"를 누르십시오.

    곳간은 Dock 에 뜨지 않습니다. 메뉴 막대 오른쪽을 보십시오.
    처음 값을 읽을 때 키체인 창이 한 번 뜹니다 — "항상 허용"을 누르시면 다시 묻지 않습니다.

    ── English ──
    GotGan is not notarized by Apple (that costs $99/year). The signature is intact, but
    Homebrew applies the quarantine flag, so the first launch meets a Gatekeeper warning.
    Clear it with the xattr line above, or click Done and then Open Anyway next to
    "Gotgan.app was blocked to protect your Mac" in System Settings > Privacy & Security.

    GotGan has no Dock icon — look at the right end of the menu bar. The first read raises
    a keychain prompt once; choose Always Allow.
  EOS
end

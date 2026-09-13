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

  # 설치를 마친 뒤 격리 표를 떼어낸다.
  #
  # 표가 붙어 있으면 macOS 가 Gatekeeper 를 거치고, 곳간은 공증을 받지 않았으므로 막힌다.
  # 예전에는 받는 사람이 --no-quarantine 으로 스스로 고를 수 있었으나 Homebrew 6 에서
  # 그 옵션이 없어졌다. 그래서 여기서 대신 떼되, caveats 에 그렇게 했다고 밝힌다.
  # 서명 자체는 Homebrew 가 그대로 검사하며, 이 단계는 그것을 건드리지 않는다.
  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Gotgan.app"]
  end

  uninstall quit:      "ai.promedius.gotgan",
            launchctl: "ai.promedius.gotgan"

  zap trash: [
    "~/.config/gotgan",
    "~/Library/Application Support/Gotgan",
    "~/Library/Logs/Gotgan.log",
    "~/Library/LaunchAgents/ai.promedius.gotgan.plist",
  ]

  caveats <<~EOS
    이 cask 는 설치를 마친 뒤 곳간에서 격리 표(com.apple.quarantine)를 떼어냅니다.
    그래서 Gatekeeper 경고 없이 바로 열립니다.

    공증을 받은 것이 아닙니다. 곳간은 애플 공증을 받지 않았고(연 $99 이 듭니다),
    표를 떼어 Gatekeeper 를 거치지 않게 한 것입니다. 서명 자체는 성하며 Homebrew 가
    받은 파일의 체크섬도 확인합니다. 그래도 마음에 걸리시면 tap 대신 브라우저로 dmg 를
    받아, 시스템 설정 → 개인정보 보호 및 보안 에서 직접 허락하십시오.

    곳간은 Dock 에 뜨지 않습니다. 메뉴 막대 오른쪽을 보십시오.
    처음 값을 읽을 때 키체인 창이 한 번 뜹니다 — "항상 허용"을 누르시면 다시 묻지 않습니다.

    ── English ──
    This cask removes the quarantine flag from GotGan after installing, so it opens
    without a Gatekeeper warning.

    That is not notarization. GotGan is not notarized by Apple (that costs $99/year);
    the flag is simply removed so Gatekeeper is never consulted. The signature itself is
    intact and Homebrew verifies the download checksum. If you would rather decide for
    yourself, skip the tap, download the dmg in a browser, and allow it from
    System Settings > Privacy & Security.

    GotGan has no Dock icon — look at the right end of the menu bar. The first read raises
    a keychain prompt once; choose Always Allow.
  EOS
end

# homebrew-gotgan

[곳간(GotGan)](https://github.com/nad4-su/gotgan) 을 Homebrew 로 설치하는 tap 입니다.
Claude 와 Codex 의 남은 사용량을 macOS 메뉴 막대에서 봅니다.

## 설치

```bash
brew tap nad4-su/gotgan
brew install --cask gotgan
```

처음 붙일 때 Homebrew 가 외부 tap 을 믿을지 한 번 묻습니다. `brew trust nad4-su/gotgan` 으로
허락하시면 됩니다.

## 처음 열 때 경고가 뜹니다

곳간은 애플 **공증**을 받지 않았습니다. 공증은 앱을 애플에 보내 악성코드 검사를 받고 확인증을
발급받는 절차인데, 연 $99 짜리 Developer Program 에 들어야 합니다. 서명 자체는 성합니다 —
애플이 "누가 만들었는지 확인해 주지 않았다"는 뜻일 뿐입니다.

Homebrew 는 내려받은 것에 `com.apple.quarantine` 표를 붙입니다. 그 표가 있으면 macOS 가
Gatekeeper 를 거치고, 공증이 없으니 경고가 뜹니다. (예전에는 `--no-quarantine` 으로 건너뛸 수
있었지만 Homebrew 6 에서 그 옵션이 없어졌습니다.)

한 줄이면 풀립니다.

```bash
xattr -dr com.apple.quarantine /Applications/Gotgan.app
```

또는 경고 창에서 **완료**를 누른 뒤 **시스템 설정 → 개인정보 보호 및 보안** 을 열면
`Mac을 보호하기 위해 'Gotgan.app'을(를) 차단했습니다` 줄이 있습니다. 옆의 **그래도 열기**.

경고를 아예 만나고 싶지 않으시면 [설치 스크립트](https://github.com/nad4-su/gotgan#설치)를
쓰십시오. curl 은 격리 표를 붙이지 않습니다.

## 쓰기

곳간은 **Dock 에 뜨지 않습니다.** 메뉴 막대 오른쪽을 보십시오.
처음 값을 읽을 때 키체인 창이 한 번 뜹니다 — **항상 허용**을 누르시면 다시 묻지 않습니다.

## 갱신과 삭제

```bash
brew upgrade --cask gotgan
brew uninstall --cask gotgan          # 앱만 지움
brew uninstall --zap --cask gotgan    # 설정·기록까지 지움
```

---

# English

A Homebrew tap for [GotGan](https://github.com/nad4-su/gotgan), a macOS menu bar app
showing how much Claude and Codex usage you have left.

```bash
brew tap nad4-su/gotgan
brew install --cask gotgan
```

## The first launch warns

GotGan is not notarized by Apple. Notarization means submitting the app to Apple for an
automated malware scan in exchange for a ticket, and it requires the $99/year Developer
Program. The signature itself is intact; Apple simply has not vouched for who built it.

`com.apple.quarantine` is a flag applied by whatever downloaded a file, Homebrew included.
With that flag present macOS consults Gatekeeper, which warns because there is no
notarization ticket. `--no-quarantine` tells Homebrew not to apply it.

Homebrew 6 removed the `--no-quarantine` flag, so clear it yourself with
`xattr -dr com.apple.quarantine /Applications/Gotgan.app`, or click **Open Anyway** in
**System Settings > Privacy & Security**. To avoid the warning entirely, use the
[install script](https://github.com/nad4-su/gotgan#install) — curl does not set the flag.

GotGan has **no Dock icon** — look at the right end of the menu bar. The first read raises
a keychain prompt once; choose **Always Allow**.

## License

MIT, same as [the app](https://github.com/nad4-su/gotgan/blob/main/LICENSE).

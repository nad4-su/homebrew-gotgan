# homebrew-gotgan

[곳간(GotGan)](https://github.com/nad4-su/gotgan) 을 Homebrew 로 설치하는 tap 입니다.
Claude 와 Codex 의 남은 사용량을 macOS 메뉴 막대에서 봅니다.

## 설치

```bash
brew tap nad4-su/gotgan
brew install --cask --no-quarantine gotgan
```

## `--no-quarantine` 이 왜 필요한가

곳간은 애플 **공증**을 받지 않았습니다. 공증은 앱을 애플에 보내 악성코드 검사를 받고 확인증을
발급받는 절차인데, 연 $99 짜리 Developer Program 에 들어야 합니다. 서명 자체는 성합니다 —
애플이 "누가 만들었는지 확인해 주지 않았다"는 뜻일 뿐입니다.

`com.apple.quarantine` 은 내려받은 프로그램이 붙이는 표입니다. Homebrew 도 기본으로 붙입니다.
그 표가 있으면 macOS 가 Gatekeeper 를 거치고, 공증이 없으므로 경고 창이 뜹니다.
`--no-quarantine` 은 Homebrew 에게 그 표를 붙이지 말라고 이르는 것입니다.

늘 그렇게 하고 싶으시면 셸 설정에 넣어 두십시오.

```bash
export HOMEBREW_CASK_OPTS="--no-quarantine"
```

### 이미 그냥 설치했다면

```bash
xattr -dr com.apple.quarantine /Applications/Gotgan.app
```

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
brew install --cask --no-quarantine gotgan
```

## Why `--no-quarantine`

GotGan is not notarized by Apple. Notarization means submitting the app to Apple for an
automated malware scan in exchange for a ticket, and it requires the $99/year Developer
Program. The signature itself is intact; Apple simply has not vouched for who built it.

`com.apple.quarantine` is a flag applied by whatever downloaded a file, Homebrew included.
With that flag present macOS consults Gatekeeper, which warns because there is no
notarization ticket. `--no-quarantine` tells Homebrew not to apply it.

To make it the default, put `export HOMEBREW_CASK_OPTS="--no-quarantine"` in your shell
config. If you already installed without it, run
`xattr -dr com.apple.quarantine /Applications/Gotgan.app`.

GotGan has **no Dock icon** — look at the right end of the menu bar. The first read raises
a keychain prompt once; choose **Always Allow**.

## License

MIT, same as [the app](https://github.com/nad4-su/gotgan/blob/main/LICENSE).

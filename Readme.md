# Browserino

> **A personally maintained fork** of [AlexStrNik/Browserino](https://github.com/AlexStrNik/Browserino), modified since November 2026. All credit for Browserino goes to its author, Aleksandr Strizhnev. Like the original, this fork is licensed under the GPL-3.0.
>
> What this fork adds:
>
> - A picker redesigned for macOS 26: a Liquid Glass panel that sizes itself to the list, with number keys 1–9 to open rows.
> - A menu bar menu (the Rex dinosaur): open the link on your clipboard, or choose your primary browser.
> - Chrome profiles: choose which profiles appear in the picker, give each a name, and open links straight into one.
>
> The Homebrew tap and releases below install the original app, not this fork. To get this fork, [build it from source](#build-this-fork-from-source).

![Browserino](images/browserino.png?v2)

Browserino is a tiny browser selector for MacOS written in SwiftUI. Just set as default browser, assign shortcuts, and now you can choose in which application you want to open the link.

Inspired by great [Browserosaurus](https://github.com/will-stone/browserosaurus), but a little bit faster and smaller thanks to native code, and fixes annoying Electron bug.

# Build this fork from source

Needs macOS 26 and Xcode.

```bash
git clone https://github.com/Matmac945/Browserino.git
cd Browserino
xcodebuild -project Browserino.xcodeproj -scheme Browserino -configuration Release -derivedDataPath build build
codesign --force --sign - build/Build/Products/Release/Browserino.app
ditto build/Build/Products/Release/Browserino.app /Applications/Browserino.app
```

Then open Browserino and set it as your default browser in System Settings.

# Installation (original app)

```bash
brew tap AlexStrNik/Browserino
brew install browserino --no-quarantine
```

Or download Browserino from the [releases page](https://github.com/AlexStrNik/Browserino/releases).

If you want to support the app, you can buy it on [Gumroad](https://alexstrnik.gumroad.com/l/browserino).

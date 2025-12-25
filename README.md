# .files
Something something dotfiles. You know, for VIM and stuff.

## Dependencies
Install [homebrew](https://brew.sh).

Add homebrew to current session:
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

List of dependencies:
```
brew install nvim
brew install rcm
brew install zellij
brew install --cask nikitabobko/tap/aerospace
brew install borders
brew install eza
brew install zoxide

brew tap homebrew/cask
brew install --cask font-iosevka-nerd-font
```

## Installing
```
RCRC=$HOME/code/dotfiles/rcrc rcup
```

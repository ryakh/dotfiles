# Requirements
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
- [rcm](https://github.com/thoughtbot/rcm)
- ZSH

# Pre-installation
- install ZSH
- change default shell to ZSH: `sudo dscl . -create /Users/$USER UserShell
  /usr/local/bin/zsh` (for Mac)

# Installing
env RCRC=$HOME/code/dotfiles/rcrc rcup

# Increase history size
export HISTSIZE=4096

# Ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust to run binaries from it
export PATH=".git/safe/../../bin:$PATH"

# Load homebrew
export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use nvim as the visual and default editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Kill spring
export DISABLE_SPRING=true

# Set zellij config to one from dotfiles as it cant autoupdate from symlink
export ZELLIJ_CONFIG_DIR=/Users/ruslan/Code/dotfiles/config/zellij/

# Mysql client location
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Postgres dev tools for mac
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export AUTO_BUNDLE=1
export AUTO_MIGRATIONS=1

# Source all files from ~/.secrets directory
if [ -d "$HOME/.secrets" ]; then
  for file in "$HOME/.secrets"/*; do
    [ -f "$file" ] && source "$file"
  done
fi

# Load Rust
. "$HOME/.cargo/env"

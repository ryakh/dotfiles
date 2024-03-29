# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# disable flow control to enable C-s in vim
stty start undef
stty stop undef

# completion
autoload -Uz compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# automatically enter directories without cd
setopt auto_cd

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^S" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^K" kill-line
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try not to correct command line spelling
unsetopt CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Load brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# FZF fuzzy searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load ASDF
. $(brew --prefix asdf)/libexec/asdf.sh

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Fuzzy finder
export FZF_DEFAULT_COMMAND='ag --nocolor --hidden --ignore node_modules --ignore tmp -g ""'

# Mysql-client location
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Postgres dev tools for mac
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

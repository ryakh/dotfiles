# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Fuzzy finder
export FZF_DEFAULT_COMMAND='ag --nocolor --hidden --ignore node_modules --ignore tmp -g ""'

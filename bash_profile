function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}

function markup_git_branch {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

export PS1="\w\$(markup_git_branch \$(git_branch)) "

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for function in ~/.shell/functions/*; do
  source $function
done

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source ~/.config/gruvbox.sh

export PATH="$HOME/.cargo/bin:$PATH"

export TERM=xterm-256color

export PATH=".git/safe/../../bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export FZF_DEFAULT_COMMAND='ag --nocolor --hidden --ignore node_modules --ignore tmp -g ""'

export PATH="./node_modules/.bin:$PATH"

export EDITOR="nvim"

BASE16_SHELL=$HOME/.submodules/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Fuzzy finder
export FZF_DEFAULT_COMMAND='ag --nocolor --hidden --ignore node_modules --ignore tmp -g ""'

# CK docker
export CONVERTKIT_CASSANDRA_DATA=/home/ruslan/Dockers/cassandra_convertkit
export CONVERTKIT_ELASTICSEARCH_DATA=/home/ruslan/Dockers/elasticsearch_convertkit
export CONVERTKIT_MYSQL_DATA=/home/ruslan/Dockers/mysql_convertkit
export CONVERTKIT_REDIS_DATA=/home/ruslan/Dockers/redis_convertkit
export CONVERTKIT_BUNDLE_PATH=/home/ruslan/Dockers/cache_convertkit/bundle
export CONVERTKIT_NODE_PATH=/home/ruslan/Dockers/cache_convertkit/node_modules

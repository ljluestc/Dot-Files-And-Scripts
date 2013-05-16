ZSH=$HOME/.oh-my-zsh

LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

alias space="du -d 1 -h | sort -n"
alias ipconfig=ifconfig

plugins=(git brew bundler cake cap gem lein mvn node osx perl redis-cli ruby rvm textmate github heroku mercurial npm pip python rake sublime vagrant cap coffee fabric git-extras pow screen svn golang bower scala rebar rails3 colorize go)

source $ZSH/oh-my-zsh.sh

export EDITOR='subl -w'
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export HIVE_HOME=/usr/local/Cellar/hive/0.10.0/libexec
export PLAN9=/usr/local/plan9
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GROOVY_HOME=/usr/local/Cellar/groovy/2.0.5/libexec
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules
export GOROOT=/usr/local/Cellar/go/1.1
export GOPATH=/usr/local/share/go
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

export POSTGRES_ROOT=/Applications/Postgres.app/Contents/MacOS/bin
export J_ROOT=/Applications/j64-701/bin
export CUDA_ROOT=/usr/local/cuda/bin
export SERVER_ROOT=/Applications/Server.app/Contents/ServerRoot/usr
export CLOJURE_ROOT=/Users/jacob/.cljr/bin
export CABAL_ROOT=/Users/jacob/.cabal/bin
export NPM_ROOT=/usr/local/share/npm/bin
export DEPOT_TOOLS_ROOT=/usr/local/depot_tools
export TEX_ROOT=/usr/tex/bin
export PYTHON_ROOT=/usr/local/share/python
export PYTHON3_ROOT=/usr/local/share/python3
export PYPY_ROOT=/usr/local/share/pypy

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$J_ROOT:$POSTGRES_ROOT:$CUDA_ROOT:$PYTHON_ROOT:$PYTHON3_ROOT:$PYPY_ROOT:$SERVER_ROOT/bin:$SERVER_ROOT/sbin:$TEX_ROOT:$CLOJURE_ROOT:$PLAN9/bin:$CABAL_ROOT:$NPM_ROOT:$DEPOT_TOOLS_ROOT:$GOPATH/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin

if [ -f `brew --prefix`/etc/autojump ]; then
      . `brew --prefix`/etc/autojump
fi

# ZSH Higher Order Functions
. $HOME/.zsh/functional/load

alias say=/usr/bin/say

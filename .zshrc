# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME=powerlevel10k/powerlevel10k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs pyenv)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time
                                    vcs background_jobs_joined time_joined)
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git autojump zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# open vscode from terminal
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# the fuck config, must brew install thefuck
eval $(thefuck --alias)

# autojump config, brew install autojump
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# install zplug, plugin manager for zsh, https://github.com/zplug/zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# zplug configruation
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    # If we can't get zplug, it'll be a very sobering shell experience. To at
    # least complete the sourcing of this file, we'll define an always-false
    # returning zplug function.
    if [[ $? != 0 ]]; then
      function zplug() {
        return 1
      }
    fi
  fi
  export ZPLUG_HOME=~/.zplug
fi
if [[ -d "${ZPLUG_HOME}" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi
zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme
zplug "plugins/vi-mode", from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

if ! zplug check; then
  zplug install
fi

zplug load

# source your own shrc file if exists
[ -f ~/.env.sh ] && source ~/.env.sh
 # your own env, in your .zshrc, source this file

# Fix python crash with vim and YCM plugin
export DYLD_FORCE_FLAT_NAMESPACE=1
export DISABLE_AUTO_TITLE='true'
export INTELLIJ_HOME=/Applications/IntelliJ\ IDEA\ 13\ CE.app/Contents/MacOS/
#PATH=$IDEA_HOME $PATH
export PYTHONIOENCODING=utf-8
export EDITOR='nvim'
export LC_ALL=zh_CN.UTF-8
# Ignore files specified by .gitignore https://github.com/junegunn/fzf.vim/issues/121
export FZF_DEFAULT_COMMAND='ag -g ""'


alias no='node '
alias q='exit'
alias quit='exit'
alias apache='sudo apachectl start'
alias sub='open -a "Sublime Text"'
alias val='valgrind '
alias cdh='cd ~/Hexo'
alias cdl='cd /Users/pegasus/Works/leancloud_demo/; source ./bin/activate'
alias cdj='cd ~/Hexo/themes/jacman'
alias cdb='cd ~/Hexo/source/_posts'
alias cdd='cd ~/Hexo/source/_drafts'
alias cds='cd /Users/pegasus/Program/Sites'
alias cdlib='cd /Users/pegasus/Program/py_test/lib/python2.7/site-packages'
alias cdlib3='cd /Users/pegasus/Program/py3.5_test/lib/python3.5/site-packages'
alias cdp2='cd /Users/pegasus/Program/py_test; source ./bin/activate;'
alias cdw='cd /Users/pegasus/Program/py_test/WeiboApp'
alias cdp='cd /Users/pegasus/Program/py3.5_test; source ./bin/activate;'
alias spy='pyenv activate py_3.5.2'
alias ce='crontab -e '
alias cl='crontab -l '
alias ed='eval $(docker-machine env default)'
alias lo='locate '
alias loc="open http://127.0.0.1"
alias lsn='ls | nl'
alias mp="mitmproxy -p8888"
alias grm='git rebase master'
alias gclone='git clone '
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gs='git status -s'
alias gmg='git commit -m'
alias gpo='git push origin '
alias gpom='git push origin master'
alias grebase2='git rebase -i HEAD~~'
alias gnew='function _new() { git checkout -b $1; git pull origin $1 }; _new'
alias hexog='hexo g'
alias hs='hexo s'
alias hn='hexo n'
alias hd='sudo hexo d'
alias his='history'
alias exi='exit'
alias ctags='/usr/local/bin/ctags'
alias mc='make clean'
alias ja='java '
alias jc='javac '
alias py='python '
alias py3s='python3.6 -m http.server'
alias ipy='ipython'
alias ci="vi "
alias vim="vi"
alias nvi="nvim "
alias nv="nvim "
alias cl='clang '
alias g++='g++ -Wall '
alias gcc='gcc -Wall '
# alias cc='cc -Wall '
alias xo='open '
alias o='open '
alias psp='ps aux | grep python'
alias rm='rmtrash '
alias rmc='rm *.pyc; rm .cache; rm __pycache__'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias runl='python manage.py runserver'
alias run='python manage.py runserver 0.0.0.0:8000'
alias runs='python manage.py shell'
alias rs='redis-server'
#alias runtest='source /Users/pegasus/Program/py3.5_test/bin/activate;fswatch -o ./*.py  | xargs -n1  ./runtest.sh'
# https://github.com/joh/when-changed，监控文件变动，我修改了下，只监控py和shell文件，用来修改后自动运行单元测试
# alias runtest='source /Users/pegasus/Program/py3.5_test/bin/activate; when-changed -v -r -1 -s ../ ./runtest.sh'
alias monitor="when-changed -r -v -1 . "    # pip install when-changed
# alias go_monitor_run="when-changed -r -v -1 . go run"
alias py_monitor_run="when-changed -r -v -1 . python " # pip install when-changed
alias runtest="when-changed -v -r -1 -s ./ ./bin/test"
alias testcommand="when-changed -v -r -1 -s ./ ./wnntest.sh"
alias bt="./bin/test"
alias bi="./bin/ipython"
alias bp="./bin/pylint"
alias sqlstart='mysql.server start'
alias refresh_chrome=" osascript -e 'tell application \"Google Chrome\" to tell the active tab of its first window to reload' "
alias flush_watch_refresh_chrome=" when-changed -v -r -1 -s ./ osascript -e 'tell application \"Google Chrome\" to tell the active tab of its first window to reload' "
alias -s h=vi
alias -s c=vi
alias -s cpp=vi
alias -s java=vi
alias -s txt=vi
alias tf='tail -f '
alias prettyjson='python -m json.tool'
alias y='youdao '
alias tl='tmux ls'
alias tat='tmux at -t'
alias ta='tmux at -t'
alias tn='tmux rename -t'
alias tnew='tmux new -s '
alias tpl='tmuxp load '

# youbute
alias download_youbute_mp3='youtube-dl --extract-audio --audio-format mp3 --no-playlist'
alias download_youbute='youtube-dl -f bestvideo+bestaudio '
alias download_youbute_mp3_proxy='youtube-dl --proxy 'socks5://127.0.0.1:1080' --extract-audio --audio-format mp3 '
alias download_youbute_proxy='youtube-dl --proxy 'socks5://127.0.0.1:1080' -f bestvideo+bestaudio '

# for php
# export PATH="$(brew --prefix php70)/bin:$PATH"
#export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
# alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
# alias php-fpm.restart='php-fpm.stop && php-fpm.start'


export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#nvm use 0.12.0
alias nvmm='nvm use stable'

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export GOPATH=$HOME/go    # don't forget to change your path correctly!
# export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
alias updatedb='sudo /usr/libexec/locate.updatedb'

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# init 会每次启动的时候载入虚拟环境
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# http proxy
function unset_httpproxy() {
    unset https_proxy; unset http_proxy
}

function ss_httpproxy() {
  export http_proxy=http://127.0.0.1:1087
  export https_proxy=http://127.0.0.1:1087
}

function ss_gitproxy() {
    git config --global https.proxy http://127.0.0.1:1087
    git config --global https.proxy https://127.0.0.1:1087
}

function unset_gitproxy() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

function pytest_monitor_run() {
  when-changed -r -v -1 "$1" pytest -s "$1"
}

# alias go_monitor_run="when-changed -r -v -1 . go run" # pip install when-changed
function go_monitor_run() {
  when-changed -r -v -1 "$1" go run "$1"
}

# https://github.com/huan/swagger-edit
function swagger-edit() {
  docker run -ti --rm --volume="$(pwd)":/swagger -p 8080:8080 zixia/swagger-edit "$@"
}

bindkey "jj" clear-scree
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# NOTE: use cc to clear screen. I use tmux ctrl+hjkl switch panel, but ctrl+l conflict with clear-screen
# bindkey "cc" clear-screen

# fzf config, must brew install fzf
# NOTE: put this line in the end of your zshrc, or it may not work, https://github.com/junegunn/fzf/issues/1304
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

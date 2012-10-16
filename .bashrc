set -o vi

export EDITOR=$HOME/bin/vim
export VISUAL=$HOME/bin/vim

# No longer desired with tmux
# export GIT_EDITOR='mvim -f -c "au VimLeave * !open -a iTerm"'

# Required for tmux only I think
export GIT_PAGER='less -R'
export GIT_EDITOR='mvim -f'

export LSCOLORS='cxfxcxdxbxegedabagacad'

export NODE_ENV=development

export LESS="-i -j.25"

export SS_DIR="/Users/paulcarey/dev/o2/tfds/smartsteps"
alias cdo2='cd ${SS_DIR}'

alias gd='git diff --color-words'
alias gst='git status'
alias datestamp="date '+%Y-%m-%d'"

alias h='heroku'
alias mv='mv -i'

alias cdzc='cd ~/dev/zonecode'
alias cdace='cd ~/dev/libs/ace'
alias ltpweb='cd /Users/paulcarey/dev/projects/clojure/ltp-web'
alias clj='cd /Users/paulcarey/dev/projects/clojure/scratch'

alias ls='ls -G'
alias tree='tree -C'
alias grep='grep --color=auto'
alias qvim='vim -u ~/.qvimrc'

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

# Find file
alias ff='ack -a -f | ack '

function man {
  qvim -c ":Man $1" -c ":only"
}

# Disabling so I don't acidentally overwrite my new emacs config
# alias emacsstd='ln -fhs ~/.emacs.d.std/ ~/.emacs.d'
# alias emacsot='ln -fhs ~/.emacs.d.overtone-livecoding/ ~/.emacs.d'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

function aliassort {
  alias | awk -F = '{print $2 "=" $1}' | sort | column -s = -t
}

#
# Disable Spaces swoosh
# defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES && killall Dock
#
# Enable Spaces swoosh
# defaults delete com.apple.dock workspaces-swoosh-animation-off && killall Dock
# 

MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
GREEN="\[\e[32m\]"
OFF="\[\033[m\]"

PS1="${CYAN}\W${OFF} \$ "
# PS1="${CYAN}\\A : \\W${OFF} \\$ "
# if [ -n "$PS1" ]; then PS1='\[\033[0;35m\]\A : \W \[\033[0m\]\$ '; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

uuid () {
  ruby -r uuidtools -e 'puts UUIDTools::UUID.random_create.to_s.split("-")[0]'
}

set_java7_env () {

  # Consider /usr/libexec/java_home instead of hardcoding this path
  export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_06.jdk/Contents/Home/bin:$PATH
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_06.jdk/Contents/Home
}

# string concatentation in awk
# git ls-files | sort | awk -F '/' '{s=""; for(i=1; i < NF; i++) s=(s "/" $i); print s}'

## Navigation

# Section below copied from https://gist.github.com/117528.
# Offers little over
# $ shopt -s cdable_vars
# $ df=`pwd`
# $ cd df
# other than persistence

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

alias show='cat ~/.dirs'
save () {
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

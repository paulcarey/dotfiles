set -o vi

path=/usr/local/bin:
path+=/usr/local/sbin:
path+=/Users/paulcarey/dev/scripts:
path+=/Users/paulcarey/dev/scala-2.9.0.1/bin:
export PATH=$path:$PATH
# export PATH=/usr/local/bin:/Users/paulcarey/dev/scripts:$PATH

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# No longer desired with tmux
# export GIT_EDITOR='mvim -f -c "au VimLeave * !open -a iTerm"'

# Required for tmux only I think
export GIT_PAGER='less -R'
export GIT_EDITOR='mvim -f'

export LSCOLORS='cxfxcxdxbxegedabagacad'

export NODE_ENV=development

export LESS="-i -j.25"

alias gd='git diff --color-words'
alias gst='git status'
alias datestamp="date '+%Y-%m-%d'"

alias cdzc='cd ~/dev/zonecode'

alias ls='ls -G'
alias tree='tree -C'

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

PS1="${CYAN}\A : \W${OFF} \$ "
# if [ -n "$PS1" ]; then PS1='\[\033[0;35m\]\A : \W \[\033[0m\]\$ '; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

uuid () {
  ruby -r uuidtools -e 'puts UUIDTools::UUID.random_create.to_s.split("-")[0]'
}

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
  save (){
      command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
    }
    source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
    shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

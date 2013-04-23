alias qvim='vim -u ~/.qvimrc'
alias ls='ls -G'
alias tree='tree -C'
alias grep='grep --color=auto'
alias mv='mv -i'

alias ff='ack -a -f | ack '
alias fff='ack --noenv -a -f | ack '

alias gd='git diff --color-words'
alias gst='git status'

alias datestamp="date '+%Y-%m-%d'"
alias be='bundle exec'
alias ber='bundle exec rails'
alias bek='bundle exec rake'

alias cdgli='cd /Users/paulcarey/dev/glean.in/hashmore_evolved'
alias glit='bundle exec rake fast=true test'

alias ff='ack -a -f | ack -i '
alias fff='ack --noenv -a -f | ack -i '

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
# alias emacsstd='ln -fhs ~/.emacs.d.std/ ~/.emacs.d'
# alias emacsot='ln -fhs ~/.emacs.d.overtone-livecoding/ ~/.emacs.d'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

alias cpalias='cdgli && scp config/system/dotfiles/.bash_aliases glean-beta:~'


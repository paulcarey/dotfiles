function cdtr
  cd ~/dev/projects/totalrecallr
end

function gst
  git status
end

function gd
  git diff
end

# Find file
function ff
  ack -f | ack -i $argv
end

# Find file, ignorning env
function fff
  ack --noenv -f | ack -i $argv
end

function mv
  command mv -i $argv
end

function man
  vim -u ~/.qvimrc -c ":map q :q<CR>" -c ":Man $argv" -c ":only | :set ts=8"
end

function tree
  command tree -C $argv
end

function ber
  bundle exec rails $argv
end

function bek
  bundle exec rake $argv
end

function cfe
  coffee -bps $argv
end

status --is-interactive; and . (rbenv init -|psub)

set PATH (rbenv root)/shims /usr/local/bin ~/bin /usr/bin /bin /usr/sbin /sbin

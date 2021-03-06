function cdtr
  cd ~/dev/projects/totalrecallr
end

function vimt
  vim -c 'NERDTree'
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

# status --is-interactive; and . (rbenv init -|psub)

# set PATH (rbenv root)/shims /usr/local/bin ~/bin /usr/bin /bin /usr/sbin /sbin
set PATH /usr/bin /bin /usr/sbin /sbin
set PATH /usr/local/bin ~/bin $PATH
# set PATH (rbenv root)/shims $PATH
set PATH /Applications/Postgres93.app/Contents/MacOS/bin $PATH
set PATH ~/dev/runtimes/scala/scala-2.10.3/bin $PATH

set -x EDITOR /usr/local/bin/vim

function fish_title
  if test $FISH_TITLE
    echo $FISH_TITLE
  else
    pwd
  end
end

function sft
  set -g -x FISH_TITLE $argv
end

function transcript
  ruby -e 'File.readlines(ARGV[0]).each_with_index { |l, i| puts l if i % 4 == 2 }' $argv
end

function transcripts
  for fn in (ls *.srt)
    echo $fn
    set target_fn (ruby -e 'puts ARGV[0].split(/\./).reverse.drop(1).reverse.join(".") + ".txt"' $fn)
    transcript $fn > $target_fn
  end
end

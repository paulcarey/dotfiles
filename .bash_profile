path=$HOME/bin
path+=:/Users/paulcarey/dev/scripts
path+=:/Users/paulcarey/dev/runtimes/scala/scala-2.9.0.1/bin
path+=:/usr/local/bin
path+=:/usr/local/sbin

export PATH=${path}:${PATH}

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

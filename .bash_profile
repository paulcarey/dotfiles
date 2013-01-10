path=$HOME/bin
path=$HOME/bin
path+=:/Users/paulcarey/dev/scripts
path+=:/Users/paulcarey/dev/runtimes/scala/scala-2.9.0.1/bin
path+=:/usr/local/bin
path+=:/usr/local/sbin
path+=:/Applications/Xcode.app/Contents/Developer/usr/bin

export PATH=${path}:${PATH}
path+=:/Users/paulcarey/dev/scripts
path+=:/Users/paulcarey/dev/runtimes/scala/scala-2.9.0.1/bin
path+=:/usr/local/bin
path+=:/usr/local/sbin
path+=:/Applications/Xcode.app/Contents/Developer/usr/bin

export PATH=${path}:${PATH}

export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

aliassort() {
  alias | awk -F = '{print $2 "=" $1}' | sort | column -s = -t
}

man() {
  qvim -c ":map q :q<CR>" -c ":Man $1 $2 $3" -c ":only" -c ":set ts=8" 
}

init-proj-env () {
  PROJ_DIR=$1
  cd $PROJ_DIR && source ${PROJ_DIR}/.dotfiles/paulcarey/.bashrc && init
  # Without calling unset, the prompt displays PROJ_DIR rather than the actual dir
  unset PROJ_DIR
}

cfe () {
  coffee -bps
}

uuid () {
  ruby -r uuidtools -e 'puts UUIDTools::UUID.random_create.to_s.split("-")[0]'
}

set_java7_env () {
  # Consider /usr/libexec/java_home instead of hardcoding this path
  export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_06.jdk/Contents/Home/bin:$PATH
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_06.jdk/Contents/Home
}

gli () {
  init-proj-env "/Users/paulcarey/dev/glean.in/hashmore_evolved"
}

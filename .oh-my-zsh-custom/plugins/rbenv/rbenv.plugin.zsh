FOUND_RBENV=0
rbenvdirs=("$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv")

for rbenvdir in "${rbenvdirs[@]}" ; do
  if [ -d $rbenvdir/bin -a $FOUND_RBENV -eq 0 ] ; then
    FOUND_RBENV=1
    export RBENV_ROOT=$rbenvdir
    export PATH=${rbenvdir}/bin:$PATH
    eval "$(rbenv init - zsh)"

    alias rubies="rbenv versions"
    alias gemsets="rbenv gemset list"
  fi
done
unset rbenvdir

if [ $FOUND_RBENV -eq 0 ] ; then
  alias rubies='ruby -v'
fi

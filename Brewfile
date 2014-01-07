## Make sure we’re using the latest Homebrew
update

## Upgrade any already-installed formulae
upgrade

## Update shitty OSX verions
#tap homebrew/dupes
install homebrew/dupes/awk
install homebrew/dupes/grep
install homebrew/dupes/less
install coreutils
install findutils --default-names
install rsync

## Common tools
install aespipe
install dos2unix
install imagemagick
install tree
install wget --enable-iri
install ngrep
install pigz
install zopfli
install rename

## Zsh
install zsh --disable-etcdir

## Ack
install ack
# TODO: ensure zsh loads this
# /usr/local/share/zsh/site-functions/_ack

## Htop
install htop
# required to enable all features of htop
# sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2/bin/htop
# sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2/bin/htop

## SCM
install mercurial
install gist
install git
install git-extras

## Vim
install vim --with-ruby --with-python --override-system-vi
install ctags-exuberant

# Remove outdated versions from the cellar
cleanup

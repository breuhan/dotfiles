#!/usr/bin/env bash

## Update git submodules
echo ">> Updating all git submodules"
git submodule update --init --recursive

## Link all dotfiles from the current directory
echo ">> Creating all symlinks"

toDir=$(pwd)
fromDir=$HOME

for dir in $(ls -a1); do
    # Skip "." and ".."
    if [ "${dir}" == "." ] || [ "${dir}" == ".." ]; then
        continue
    fi

    # Skip some git files that are specific to this repository
    if [ "${dir}" == ".git" ] \
    || [ "${dir}" == ".gitmodules" ] \
    || [ "${dir}" == ".gitignore" ] \
    || [ "${dir}" == ".gitattributes" ]; then
        continue
    fi

    # Skip all "normal" (non hidden) files
    if [ "${dir:0:1}" != "." ]; then
        continue
    fi

    linkFrom="${fromDir}/${dir}"
    linkTo="${toDir}/${dir}"

    rm -rf "${linkFrom}"
    ln -s "${linkTo}" "${linkFrom}"
done

## Ruby
#echo ">> Ruby"
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# rbenv plugins (can't add submodule within a subdmodule, sadly no *inception*)
#git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
#(cd $HOME/.rbenv/plugins/ruby-build && git pull)
#rbenv rehash

#rbenv install 2.0.0-p0
#rbenv global 2.0.0-p0
#rbenv shell 2.0.0-p0
#rbenv rehash

#gem install bundler
#rbenv rehash

#bundle
#rbenv rehash

## Python
#echo ">> Python"
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"

#pyenv install 2.7.3
#pyenv install 3.3.0
#pyenv install pypy-1.9
#pyenv global 2.7.3
#pyenv shell 2.7.3
#pyenv rehash

# pyenv plugins (can't add submodule within a subdmodule, sadly no *inception*)
#git clone git://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
#(cd $HOME/.pyenv/plugins/pyenv-virtualenv && git pull)
#pyenv rehash

## NodeJS
#echo ">> Node"
#source $HOME/.nvm/nvm.sh
#nvm install v0.8.16
#nvm alias default v0.8.16

## homebrew
if [ "$(uname)" == "Darwin" ]; then
    echo ">> Homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    ./.brew
else
    echo ">> skipping Homebrew"
fi

## OSX settings
if [ "$(uname)" == "Darwin" ]; then
    echo ">> OSX settings"
    ./.osx
else
    echo ">> skipping OSX settings"
fi

## Install vim plugins
echo ">> Vim plugins"
vim -e -c BundleInstall -c quitall > /dev/null

## ZSH
echo ">> ZSH as default shell"
chsh -s /bin/zsh

## Done! :D
echo ">> Done"

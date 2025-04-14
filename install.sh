#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
PROJECTS_DIR="$HOME/Developer"

# Exit immediately if a command exits with a non-zero status.
set -e

PLATFORM=$(uname)
ARCH=$(uname -m)
TUCKR_EXEC=$DOTFILES_DIR/bin/${ARCH}_${PLATFORM}/tuckr

if ! type "tuckr" > /dev/null; then
  echo Running precompiled tuckr: $TUCKR_EXEC
  TUCKR_EXEC=$DOTFILES_DIR/bin/${ARCH}_${PLATFORM,,}/tuckr
else
  echo "Tuckr not found, trying to install it"
  cargo install --git https://github.com/RaphGL/Tuckr.git
  TUCKR_EXEC=$HOME/.cargo/bin/tuckr
fi

$TUCKR_EXEC add \*
$TUCKR_EXEC status
echo Successfully installed dotfiles

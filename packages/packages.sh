#!/usr/bin/env bash
sudo -v

# Define variables for each package manager and include the corresponding package lists
. ../scripts/functions.sh
brew_packages="Brewfile"  
rust_packages="rust_packages.txt"

# Define a function for installing packages with Homebrew
install_brew_packages() {
  if ! command -v $(which brew) &>/dev/null; then
    substep_info "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if ! command -v $(which brew) &>/dev/null; then
      error "Failed to install Homebrew. Exiting."
      exit 1
    fi
    substep_success "Homebrew installed."
  fi
  info "Installing Homebrew packages..."
  brew update
  brew upgrade
  brew bundle --file="$brew_packages"
  success "Finished installing Homebrew packages."
}

# Define a function for installing packages with Rust
install_rust_packages() {
  if ! command -v $(which rustc) &>/dev/null; then
    substep_info "Rust not found. Installing..."
    brew install rust rustup-init
    rustup-init
    if ! command -v $(which rustc) &>/dev/null; then
      error "Failed to install Rust. Exiting."
      exit 1
    fi
    substep_success "Rust installed."
  fi
  info "Installing Rust packages..."
  rustup update
  cargo install $(cat "$rust_packages")
  success "Finished installing Rust packages."
}

# Call each installation function
install_brew_packages
install_rust_packages

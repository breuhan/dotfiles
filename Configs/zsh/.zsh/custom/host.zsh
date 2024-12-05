if [[ $HOST == "uk0123m" ]]; then
  export PATH=$PATH:$HOME/.cargo/bin
  export PATH="$PATH:/opt/homebrew/opt/libpq/bin/"
  export CARGO_TARGET_DIR=$HOME/.cargo/target
elif [[ $HOST == "saturn-lin" ]]; then
  export CARGO_TARGET_DIR=/media/sata_ssds/cargo/target
  plugins+=('archlinux')
fi

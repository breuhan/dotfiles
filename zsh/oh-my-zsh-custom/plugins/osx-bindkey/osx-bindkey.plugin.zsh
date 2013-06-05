# Fix alt-left and alt-right in Terminal.app
bindkey "\e[1;9D" backward-word
bindkey "\e[1;9C" forward-word

# Fix alt-left and alt-right in tmux
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word

# Fix alt-left and alt-right in iTerm2
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

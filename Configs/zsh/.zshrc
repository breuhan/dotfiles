


for f in ${ZDOTDIR:-~}/.zsh/custom/*.zsh(N); do source $f; done

autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f $ '
RPROMPT='[%F{yellow}%?%f]'

#plugins = ( zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
export PATH=$PATH:$HOME/.cargo/bin

if [ starship ]; then
  #eval "$(starship init zsh)"
fi

eval "$(direnv hook zsh)"
export PATH="$PATH:/opt/homebrew/opt/libpq/bin/"

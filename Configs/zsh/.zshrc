eval "$(direnv hook zsh)"


for f in ${ZDOTDIR:-~}/.zsh/custom/*.zsh(N); do source $f; done

autoload -Uz compinit promptinit
compinit
promptinit

#eval "$(starship init zsh)"
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f $ '
RPROMPT='[%F{yellow}%?%f]'

#plugins = ( zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
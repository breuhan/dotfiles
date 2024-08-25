
autoload -Uz compinit promptinit
compinit
promptinit

#eval "$(starship init zsh)"
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f $ '
RPROMPT='[%F{yellow}%?%f]'


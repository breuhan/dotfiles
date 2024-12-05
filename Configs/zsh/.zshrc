export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=/usr/share/zsh/

set -o vi

autoload -Uz compinit promptinit
compinit
promptinit


if type "starship" > /dev/null; then
    eval "$(starship init zsh)"
else
    echo "Starship not found"
    PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f $ '
    RPROMPT='[%F{yellow}%?%f]'
    ZSH_THEME="agnoster"
fi



echo "Loading custom zsh files"
for f in ${ZDOTDIR:-~}/.zsh/custom/*.zsh(N); do source $f; done

if [[ -f $ZSH/oh-my-zsh.sh ]]; then
  echo "Loading Oh my zsh"
  source $ZSH/oh-my-zsh.sh
fi

eval "$(direnv hook zsh)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=/usr/share/zsh/

set -o vi

echo "Loading custom zsh files"
for f in ${ZDOTDIR:-~}/.zsh/custom/*.zsh(N); do source $f; done

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# Oh my zsh settings
zstyle ':omz:update' mode auto
plugins=(git git-auto-fetch rsync zsh-autosuggestions zsh-syntax-highlighting)
if [[ $HOSTNAME == "saturn-lin" ]]; then
    plugins+=('archlinux')
fi
source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="true"

if [[ $HOSTNAME == "uk0123m" ]]; then
  export PATH=$PATH:$HOME/.cargo/bin
  export PATH="$PATH:/opt/homebrew/opt/libpq/bin/"
fi

eval "$(direnv hook zsh)"

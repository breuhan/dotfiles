# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME_PREFIX_ROOT=1
ZSH_THEME_USE_RPROMPT=1
ZSH_THEME="miloshadzic" 

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Enable colors in ls
DISABLE_LS_COLORS="false"

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(npm brew bundler git-flow osx vagrant fabric gem pip redis-cli rbenv python nyan gnu-utils extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

if [ -f ~/Workspace/adcloud/aws/environment ]; then
    source ~/Workspace/adcloud/aws/environment
fi

function scm_update {
    for dir in $(find . -type d -maxdepth 1 -not -wholename '.'); do 
        echo "\e[0;32m>>>> Checking $dir \e[0m"
        (
            cd $dir \
            && ([ -d .git ] \
                || echo "\e[0;31mNot a valid git repository \e[0m" \
                && [ -d .git ] ) \
            && echo "\e[0;34mRunning git pull \e[0m" \
            && git pull --all --recurse-submodules=yes \
            && ([ -f .gitmodules ] \
                && echo "\e[0;34mRunning git submodule update \e[0m" \
                && git submodule update --recursive )
        )
        echo ""
    done
    cd "$PWD"
}

function terminate_vm {
    VBoxManage list vms \
        | grep $(basename $(pwd)) \
        | cut -d' ' -f1 \
        | xargs -I '{}' VBoxManage controlvm '{}' poweroff 2> /dev/null
}

# TODO: Move this into own zsh-plugin
function cd() {
    builtin cd "$@";
    echo "$PWD" >! ~/.zsh_cwd;
}
export cd

alias cwd='cd "$(cat ~/.zsh_cwd)"'
cwd

alias l='ls -lh'
alias la='ls -lhA'
alias json_pp='python -mjson.tool'

# Disable autocorrect complete
unsetopt correct_all

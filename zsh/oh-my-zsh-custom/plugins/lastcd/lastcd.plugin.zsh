LASTCD_FILE="$HOME/.zsh_lastcd"

function cd() {
    builtin cd "$@"
    echo "$PWD" >! "$LASTCD_FILE"
}
export cd

if [ -f "$LASTCD_FILE" ]; then
    builtin cd "$(cat $LASTCD_FILE)"
fi

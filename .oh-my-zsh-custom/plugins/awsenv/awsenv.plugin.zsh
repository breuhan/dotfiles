FOUND_AWSENV=0
for awsenvdir in "$HOME/.awsenv" "/usr/local/awsenv" "/opt/awsenv"; do
    if [ $FOUND_AWSENV -eq 0 -a -d "$awsenvdir/bin" ]; then
        FOUND_AWSENV=1

        export AWSENV_ROOT="$awsenvdir"
        export PATH="${AWSENV_ROOT}/bin:$PATH"
        eval "$(awsenv init -)"

        function awsenv_prompt_info() {
            echo "$(awsenv version | cut -d" " -f2)"
        }
    fi
done
unset awsenvdir

# TODO: Fix strange locales on OSX
export LC_ALL=en_US.UTF-8 

# Update path to find all tools installed via homebrew
for dir in $(find /usr/local/Cellar -name 'bin'); do
    export PATH="$dir:$PATH"
done

# Enable rbenv, if available
rbenv_dir="$(dirname ~/)/$(basename ~/)/Workspace/vendor/rbenv"
if [ -d $rbenv_dir ]; then
    export PATH="$rbenv_dir/bin:$PATH"
    eval "$(rbenv init -)"
fi
unset rbenv_dir

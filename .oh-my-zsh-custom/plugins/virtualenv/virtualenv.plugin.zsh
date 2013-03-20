export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=true
export PIP_RESPECT_VIRTUALENV=true

if [ -f "$(command -v virtualenvwrapper.sh 2> /dev/null)" ]; then
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source "$(command -v virtualenvwrapper.sh)"
fi

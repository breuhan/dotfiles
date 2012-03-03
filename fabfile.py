# -*- coding: utf-8 -*- 

from __future__ import with_statement

from revolver import contextmanager as ctx
from revolver import directory as dir
from revolver import file
from revolver import group
from revolver import package
from revolver import server
from revolver import service
from revolver import user
from revolver.core import run, sudo
from revolver.decorator import task
from revolver.tool import git_chiefs
from revolver.tool import git_extras
from revolver.tool import git_flow
from revolver.tool import ruby
from revolver.tool import sudoers

@task
def vm():
    """
    Use the Vargrant VM in this directory 
    """
    from revolver.vagrant import select
    select()

@task(default=True)
def setup():
    """
    Bootstrap the selected host(s)
    """
    _packages()
    _timezone()
    _groups()
    _users()
    # TODO Reactivate (and fix) _secure_ssh()

def _packages():
    package.update()
    package.upgrade()

    package.ensure(["exuberant-ctags", "vim-nox"])
    package.ensure(["curl", "nmap", "rsync", "tcpdump", "traceroute", "wget"])
    package.ensure(["ack-grep", "apt-show-versions", "iotop", "tree"])
    package.ensure(["atop", "htop", "iftop", "iotop", "itop", "latencytop", "powertop"])
    package.ensure(["tmux", "zsh"])

    package.ensure(["git-core", "tig"])
    git_chiefs.ensure()
    git_extras.ensure()
    git_flow.ensure()

    _python()

def _timezone():
    server.timezone("UTC")
    package.ensure("ntp")

def _groups():
    group.ensure("admin")
    sudoers.ensure([
        "# Members of the admin group may gain root privileges",
        "# They can run any command as root with no password",
        "%admin ALL=(ALL) NOPASSWD: ALL"
    ])

def _users():
    user.ensure("michael", shell="/bin/zsh")
    group.user_ensure("admin", "michael")

    with ctx.fake_login("michael"), ctx.rbenv():
        ruby.ensure("1.9.3-p125")
        _dotfiles()

def _python():
    # TODO Same API as ruby? Google this topic for current best practice! 
    #      - Install requested python version system wide
    #      - Auto-create virtualenv with the right interpreter
    #      - Auto-workon into the right venv
    package.ensure("python-setuptools")
    sudo("easy_install pip")
    sudo("pip install virtualenv")
    sudo("pip install virtualenvwrapper")

def _dotfiles():
    if not dir.exists(".dotfiles"):
        run("git clone git://github.com/michaelcontento/dotfiles.git .dotfiles")

    with ctx.cd(".dotfiles"):
        run("git pull")
        run("./install")
        file.copy(".ssh/id_rsa.pub", ".ssh/authorized_keys", mode=600)

def _secure_ssh():
    with ctx.sudo():
        cfg = "/etc/ssh/sshd_config"
        file.sed(cfg, ".*PermitRootLogin .*", "PermitRootLogin No")
        file.sed(cfg, ".*PasswordAuthentication .*", "PasswordAuthentication No")

    service.restart("ssh")

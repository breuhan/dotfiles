# -*- coding: utf-8 -*- 

from __future__ import with_statement

from revolver import contextmanager as ctx
from revolver import directory as dir
from revolver import file
from revolver import group
from revolver import package
from revolver import server
from revolver import user
from revolver import service
from revolver.core import env, run, sudo
from revolver.tool import sudoers

env.hosts = ['vagrant@33.33.33.123']

def _packages_python():
    package.ensure("python-setuptools")
    with ctx.sudo():
        run("easy_install pip")
        run("pip install virtualenv")
        run("pip install virtualenvwrapper")

def _packages_editor():
    package.ensure("exuberant-ctags")
    package.ensure("vim-nox")

def _packages_network():
    package.ensure("curl")
    package.ensure("nmap")
    package.ensure("rsync")
    package.ensure("tcpdump")
    package.ensure("traceroute")
    package.ensure("wget")

def _packages_core():
    package.ensure("ack-grep")
    package.ensure("apt-show-versions")
    package.ensure("htop")
    package.ensure("tree")

def _packages_scm():
    package.ensure("git-core")
    package.ensure("tig")
    sudo("curl -s https://raw.github.com/michaelcontento/git-chiefs/master/install | bash")
    sudo("curl -s https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh | bash")
    sudo("curl -s https://raw.github.com/visionmedia/git-extras/master/bin/git-extras | INSTALL=y sh")

def _packages_shell():
    package.ensure("tmux")
    package.ensure("zsh")

def _packages():
    package.update()
    _packages_core()
    _packages_editor()
    _packages_network()
    _packages_scm()
    _packages_shell()

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

    home = user.home_directory("michael")
    fake_home = "export HOME=%s" % home
    path = "export PATH=\"$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH\""
    with ctx.sudo("michael"), ctx.cd(home), ctx.prefix(fake_home), ctx.prefix(path):
        _ruby("1.9.3-p125")
        _dotfiles()

def _dotfiles():
    if not dir.exists(".dotfiles"):
        run("git clone git://github.com/michaelcontento/dotfiles.git .dotfiles")

    with ctx.cd(".dotfiles"):
        run("git pull")
        run("./install")
        file.copy(".ssh/id_rsa.pub", ".ssh/authorized_keys", mode=600)

def _ruby(version):
    if not dir.exists(".rbenv"):
        run("git clone git://github.com/sstephenson/rbenv.git .rbenv")

    with ctx.cd(".rbenv"):
        run("git pull")

        dir.ensure("plugins")
        with ctx.cd("plugins"):
            if not dir.exists("ruby-build"):
                run("git clone git://github.com/sstephenson/ruby-build.git")

            with ctx.cd("ruby-build"):
                run("git pull")

        if not dir.exists("versions/%s" % version):
            run("rbenv install %s" % version)

        run("rbenv global %s" % version)
        run("rbenv rehash")
        run("gem install bundler")

def _secure_ssh():
    with ctx.sudo():
        cfg = "/etc/ssh/sshd_config"
        file.sed(cfg, ".*PermitRootLogin .*", "PermitRootLogin No")
        file.sed(cfg, ".*PasswordAuthentication .*", "PasswordAuthentication No")

    service.restart("ssh")

def setup():
    _packages()
    _timezone()
    _groups()
    _users()
    # _secure_ssh()

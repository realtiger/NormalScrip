#!/usr/bin/env python
import os
# install bash-complete
os.system("yum install bash-complete -y")
# install gcc&vim
os.system("yum install gcc* vim* -y")
# home directory
home_path = ["/root"]
# intall & config tmux
for path in home_path:
    if not os.path.isfile('%s/.tmux.conf' % path):
        os.system('yum install tmux -y')
        with open('%s/.tmux.conf' % path, 'wt') as f:
             f.write('''unbind C-b
set -g prefix C-x
bind r source-file ~/.tmux.conf \; display "Config reloaded.."
# Use vim keybindings in copy mode
setw -g mode-keys vi
# start selecting text typing 'v' key (once you are in copy mode)
bind-key -t vi-copy v begin-selection
# copy selected text to the system's clipboard
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
''')
python_version = "3.6.1"
os.chdir(home_path[0])
if not os.path.isfile('/usr/local/python3/bin/python3'):
    # install wget
    os.system("yum install wget -y")
    # download python.tar.xz
    if not os.path.isfile('%s/Python-%s.tar.xz' % (home_path[0], python_version)):
        os.system('wget https://www.python.org/ftp/python/%s/Python-%s.tar.xz' % (python_version, python_version))
    # install dependency
    os.system("yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel gcc")
    # install python
    os.system('tar Jxf Python-%s.tar.xz' % python_version)
    os.chdir('Python-%s' % python_version)
    os.system('./configure --prefix=/usr/local/python3')
    os.system('make && make install')
    os.system('ln -s /usr/local/python3/bin/python3 /usr/bin/python3')
    os.system('ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3')
if not os.path.exists("%s/.virtualenvs" % home_path[0]):
    # install virtualenv
    os.system('pip3 install virtualenv')
    os.system('pip3 install virtualenvwrapper')
    os.system('mkdir ~/.virtualenvs')
    os.system('ln -s /usr/local/python3/bin/virtualenv /usr/bin/virtualenv')
    # config source file
    with open('/etc/bashrc', 'a') as f:
        if not "source /usr/local/python3/bin/virtualenvwrapper3.sh" in f.read():
            f.write('''
export EDITOR=/usr/bin/vim
if [ ! -d "$HOME/.virtualenvs" ] ; then
  mkdir $HOME/.virtualenvs
fi
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspaces
source /usr/local/python3/bin/virtualenvwrapper3.sh''')
    with open('/usr/local/python3/bin/virtualenvwrapper.sh', 'r') as fr:
        with open('/usr/local/python3/bin/virtualenvwrapper3.sh', 'w') as fw:
            for line in fr.readlines():
                if 'VIRTUALENVWRAPPER_PYTHON' in line:
                    line=line.replace('python)', 'python3)')
                fw.write(line)
    os.system('source /etc/bashrc')

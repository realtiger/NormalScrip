#!/usr/bin/env python
import os
os.system("yum install bash-completion -y")
os.system("yum install gcc* vim* -y")
home_path = ["/root"]
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
    os.system("yum install wget -y")
    if not os.path.isfile('%s/Python-%s.tar.xz' % (home_path[0], python_version)):
        os.system('wget https://www.python.org/ftp/python/%s/Python-%s.tar.xz' % (python_version, python_version))
    os.system("yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel gcc")
    os.system('tar Jxf Python-3.6.1.tar.xz')
    os.chdir('Python-3.6.1')
    os.system('./configure --prefix=/usr/local/python3')
    os.system('make && make install')
    os.system('ln -s /usr/local/python3/bin/python3 /usr/bin/python3')
    os.system('ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3')
if not os.path.exists("%s/.virtualenvs" % home_path[0]):
    os.system('pip3 install virtualenv')
    os.system('pip3 install virtualenvwrapper')
    os.system('mkdir ~/.virtualenvs')
    os.system('ln -s /usr/local/python3/bin/virtualenv /usr/bin/virtualenv')

    with open('/etc/bashrc', 'a') as f:
        f.write('''
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspaces
source /usr/local/python3/bin/virtualenvwrapper.sh''')
    print 'vim /usr/local/python3/bin/virtualenvwrapper.sh'
    print 'VIRTUALENVWRAPPER_PYTHON="$(command \which python3)"'
    print 'source /etc/bashrc'

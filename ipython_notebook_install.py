'''
File Name: ipython_notebook_install.py
Author: Changde
mail: changde@ganchangde.com
Created Time: 2017年10月30日 星期一 16时02分45秒
'''
#!/usr/bin/env python
import os
import time
import shutil
import subprocess
from argparse import ArgumentParser

parser = ArgumentParser(description="ipython notebook install script")
parser.add_argument("command", help="commands", default="conf", metavar="conf", choices=["run", "stop", "conf",]) 

parser.add_argument('--version', action='version', version='0.1')
parser.add_argument("-ip", dest="ip", default="127.0.0.1", metavar="127.0.0.1", help="set ipython notebook listen ip")
parser.add_argument("-d", dest="dir", default=None, metavar="None", help="set ipython notebook workspace")
parser.add_argument("-b", dest="open_browser", default=False, metavar="False", help="set open browser or not when ipython notebook start running")
parser.add_argument("-p", dest="port", default=8888, metavar="8888", help="set ipython notebook listen port")

args = parser.parse_args()

if not os.path.exists("/usr/bin/ipython"):
    subprocess.Popen("pip3 install ipython", shell=True)
    subprocess.Popen("ln -s /usr/local/python3/bin/ipython /usr/bin/ipython", shell=True)
    print("ipython install successful!")
if not os.path.exists( "/usr/bin/jupyter"):
    subprocess.Popen("pip3 install urllib3", shell=True)
    subprocess.Popen("pip3 install jupyter", shell=True)
    subprocess.Popen("ln -s /usr/local/python3/bin/jupyter /usr/bin/jupyter", shell=True)
    print("jupyter install successful!")

home_path = os.environ['HOME']
init = False
if not os.path.exists(f"{home_path}/.jupyter/jupyter_notebook_config.py"):
    subprocess.Popen("jupyter notebook --generate-config", shell=True)
    init = True
    while True:
        if os.path.exists(f"{home_path}/.jupyter/jupyter_notebook_config.py"):
            print("jupyter conf has init")
            break;
        else:
            print("jupyter conf was not exist yet!")
            time.sleep(1)
        
if args.command == "conf" or init:
    shutil.copy(f"{home_path}/.jupyter/jupyter_notebook_config.py", f"{home_path}/.jupyter/jupyter_notebook_config.py.{time.strftime('%Y%m%d', time.localtime())}")
    shutil.copy(f"{home_path}/.jupyter/jupyter_notebook_config.py", f"{home_path}/.jupyter/jupyter_notebook_config.py.bak")
    key_words = {
	"ip_key": "c.NotebookApp.ip = ",
        "notebook_dir": "c.NotebookApp.notebook_dir = ",
        "open_browser": "c.NotebookApp.open_browser = ",
        "port_key": "c.NotebookApp.port = ",
        "password_key": "c.NotebookApp.password = ",
    }
    with open(f"{home_path}/.jupyter/jupyter_notebook_config.py.bak", "r") as fr:
        with open(f"{home_path}/.jupyter/jupyter_notebook_config.py", "w") as fw:
            for line in fr.readlines():
                if key_words['ip_key'] in line:
                    line = f"{key_words['ip_key']}'{args.ip}'"
                elif key_words['notebook_dir'] in line and args.dir:
                    if not os.path.exists(args.dir):
                        os.makedirs(args.dir)
                    line = f"{key_words['notebook_dir']}'{args.dir}'"
                elif key_words['open_browser'] in line:
                    line = f"{key_words['open_browser']}{args.open_browser}"
                elif key_words['port_key'] in line:
                    line = f"{key_words['port_key']}{args.port}"
                elif key_words['password_key'] in line:
                    line = f"{key_words['password_key']}'sha1:b0b593db7380:e872ce884db817b2664b9a9f74bd78ec6c353f55'"
                fw.write(line)
            print("notebook conf file is completed!")

if args.command == "run":
    if os.path.exists(f"{home_path}/.jupyter/notebook.pid"):
        print("PID file exists, please checkout.")
    elif len(subprocess.Popen("ps ax|grep %s|grep -v grep|awk -F ' ' 'jupyter'", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.readlines()):
        print("It is another instance, please checkout.")
    else:
        child = subprocess.Popen("nohup jupyter notebook&", shell=True)
        with open(f"{home_path}/.jupyter/notebook.pid", "w") as f:
            f.write(f"{child.pid + 1}")
        print("server:notebook was started")
elif args.command == "stop":
    if os.path.exists(f"{home_path}/.jupyter/notebook.pid"):
        with open(f"{home_path}/.jupyter/notebook.pid") as f:
            pid = f.readlines()
    else:
        pid = subprocess.Popen("ps ax|grep %s|grep -v grep|awk -F ' ' 'jupyter'", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.readlines()
    for p in pid:
        if not isinstance(p, str):
            p = p.decode()
        print(f"Kill pid:{p} now....")
        child = subprocess.Popen(f"kill -9 {p}", shell=True)
    if os.path.exists(f'{home_path}/.jupyter/notebook.pid'):
        os.remove(f'{home_path}/.jupyter/notebook.pid')
    print("Notebook service is stoped.....")
else:
    #print("你居然能看见我，少侠好运气，今后请继续努力吧！")
    print("配置完成，请输入命令run启动服务。")

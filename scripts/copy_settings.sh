server=$1
echo "copy .bashrc to: " $server
scp ~/dev/scripts/bashrc $server:~adahan/.bashrc
echo "copy ipython settings to:" $server
scp ~/.ipython/profile_default/startup/research.py $server:~adahan/.ipython/profile_default/startup/

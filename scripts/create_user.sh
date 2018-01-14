#! /bin/bash
shopt -s expand_aliases
source ~/.zshrc
SITE=$1
echo + create user adahan in $SITE, adding to sudoers +
ssh -tt lc@$SITE 'sudo adduser adahan ; sudo adduser adahan sudo'
echo + vcreating ssh uthorized_keys +
ssh -tt adahan@$SITE 'mkdir -p .ssh ; touch ./.ssh/authorized_keys'
echo + adding personal ssh-keys to site +
scp ~/.ssh/id_rsa.pub adahan@$SITE:.ssh/authorized_keys
echo + copy peronal settings +
ssh -tt adahan@$SITE 'ipython'
settings2 $SITE
ssh -tt adahan@$SITE 'ln -s /home/lc/system/current /home/adahan/current'

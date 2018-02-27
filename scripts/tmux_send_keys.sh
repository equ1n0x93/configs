#!/bin/bash

start=$1
end=$2
fl=$3

function send_run_command {
    cmd=$1
    tmux send-keys "$cmd" Enter
}

active=$(tmux list-windows | grep '(active)' | egrep 'portal|ipython')

if ! [ "$active" == "" ]; then
    tmux send-keys "%cpaste" Enter
fi

for i in $(seq $start $end);
do send_run_command "$(sed -n "${i}p" ${fl})";
done;

if ! [ "$active" == "" ]; then
    tmux send-keys "-"
    tmux send-keys "-"
    tmux send-keys Enter
fi

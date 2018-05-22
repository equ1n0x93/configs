REMOTE_HOST=$1
REMOTE_PATH=$2

fswatch -o -r . | xargs -n 1 -I {} -azvc ./ adahan@$1:$2 --exclude "*.pyc"
#echo $CMD
#set -x
#$CMD


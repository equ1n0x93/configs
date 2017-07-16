PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]\[\033[01;31m\]$(git branch 2>/dev/null|grep -e ^* | tr "*" ":" | tr -d " ")\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]> '
if [ -f  /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  .  /usr/local/etc/bash_completion.d/git-completion.bash
fi


# Others
export PATH="/Users/adahan/dev/repositories/lightcyber/:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ll='ls -lGaf'
alias env_lc='source ~/dev/virtual_env/lightcyber/bin/activate'
alias hist='cat ~/.zsh_history'

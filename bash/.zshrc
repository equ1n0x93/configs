# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/adahan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Exports
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SLACK_TOKEN='xoxp-2917321329-183595760565-183443474737-2f38e1188fdbcb780dffb2232a73df79'
export AUTOFOCUS_API_KEY='79f5fa8a-eee0-4328-96d6-e6dee1576857'
export REPOS_PATH=$HOME/dev/repositories
export LC_PATH=$REPOS_PATH/lightcyber
export SCRIPTS_PATH=$HOME/dev/scripts
export COOHA_PATH=$REPOS_PATH/cooha
export PYTHONPATH=$COOHA_PATH:$LC_PATH/research/analyst/:$PYTHONPATH
PATH="$PATH:$SCRIPTS_PATH"

# Aliases
alias l='ls -lafGh'
alias ll='ls -lafGh'
alias hist='cat ~/.zsh_history'
alias zsh_prof='vi ~/.zshrc'
alias slack='slackcat -s -c'
alias slacku='python ~/dev/scripts/slack_users_search.py'
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'
alias mkey='ssh-keygen'
alias settings2='bash ~/dev/scripts/copy_settings.sh'
alias tunnel_to='sudo ssh -X -L443:localhost:443 -L80:localhost:80 -o ExitOnForwardFailure=yes'
alias cd_box='cd ~/Box'
alias cd_research='cd ~/Box/Research'
alias gita='git_aliases.sh'
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Virtual env
export VIRTUAL_ENV_HOME=$HOME/dev/virtual_env
alias env='deactivate'
alias vecreate='bash ${SCRIPTS_PATH}/venv_create.sh'
alias env_lc='source ${VIRTUAL_ENV_HOME}/lightcyber/bin/activate'
alias env_res='source ${VIRTUAL_ENV_HOME}/tests/bin/activate'

# Repositories and directories
alias repo='cd ${REPOS_PATH}'
alias repo_lc='cd ${REPOS_PATH}/lightcyber'
alias repo_malia='cd ${REPOS_PATH}/malia'
alias repo_conf='cd ${REPOS_PATH}/configs'
alias repo_sg='cd ${REPOS_PATH}/stargate'
alias repo_journals='cd ${REPOS_PATH}/journals'
alias repo_res='cd ${REPOS_PATH}/research_repos'
alias scripts='cd ${SCRIPTS_PATH}'
alias gdrive='cd ~/Google\ Drive'

# Powerline
powerline-daemon -q
. $REPOS_PATH/powerline/powerline/bindings/zsh/powerline.zsh

# tmux
tmux new-session


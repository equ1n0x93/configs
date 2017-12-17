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
export REPOS_PATH=/Users/adahan/dev/repositories
export LC_PATH=$REPOS_PATH/lightcyber
export COOHA_PATH=$REPOS_PATH/cooha
export PYTHONPATH=$COOHA_PATH:$LC_PATH/research/analyst/:$PYTHONPATH

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

# Alias - Virtual envs
alias env='deactivate'
alias env_lc='source ~/dev/virtual_env/lightcyber/bin/activate'
alias env_res='source ~/dev/Virtual_env/tests/bin/activate'

# Alias - Repositories and directories
alias repo='cd ~/dev/repositories'
alias repo_lc='cd ~/dev/repositories/lightcyber'
alias repo_malia='cd ~/dev/repositories/malia'
alias repo_conf='cd ~/dev/repositories/configs'
alias repo_journals='cd ~/dev/repositories/journals'
alias repo_res='cd ~/dev/repositories/research_repos'

alias scripts='cd ~/dev/scripts'

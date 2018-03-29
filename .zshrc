TERM=xterm

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/younes/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize emoji vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

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
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp='cp -i'
alias df='df -h'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias free='free -m'
alias grep='grep --colour=auto'
alias ls='ls --color=auto'
alias more='less'
alias np='nano -w PKGBUILD'
alias process='ps aux|grep %[C]PU ; ps aux | sort -nrk3,3 | head -n10'
alias gstat='git status'
alias gstash='git stash'
alias gco='git checkout'

# Removing 'user@computer' section in prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# binding keys
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

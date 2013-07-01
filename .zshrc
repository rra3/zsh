# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# keys and such that I don't want to keep in github
source ~/.zvars
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
export TERM='screen-256color'
# for the crazy tmux powerline that i've spent way too much time on. hits
# weather.yahoo.com and uses the last bit of digits to pull the weather
export TMUX_POWERLINE_SEG_WEATHER_LOCATION="12770529"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx rails3 brew vagrant urltools rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/usr/local/opt/coreutils/libexec/gnubin${PATH}
# MACOS install of postgres causing breakage
export PGHOST=localhost

# one of my favorite zsh features, history searching
bindkey '\C-b' history-beginning-search-backward
bindkey '\C-f' history-beginning-search-forward

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  



# run vim on a long command line!
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line
export EDITOR="vim"
bindkey -v

bindkey '\C-b' history-beginning-search-backward
bindkey '\C-f' history-beginning-search-forward
alias nodestat='ssh admin@nodejs.careerleap.com "svcs -lp node-sendgrid-hipchat-event-service"'
# another way of doing it
function njs {
  local nodestat=${$(curl http://nodejs.careerleap.com/heartbeat 2> /dev/null):-1)}
  if [ $nodestat=0 ]; then echo node is UP; else echo node is DOWN; fi
}
export HIPCHAT_TOKEN=dc745f89ee49fff5db479eafb1a0f2

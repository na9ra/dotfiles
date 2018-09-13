autoload -Uz colors
colors

autoload -Uz tetris
zle -N tetris
autoload  -Uz compinit
compinit

bindkey -e

setopt auto_cd
setopt correct

export VISUAL="vim"
export LANG=ja_JP.UTF-8
export PATH="$HOME/bin:$PATH"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem
#export GEM_HOME=$(ruby -e 'print Gem.user_dir')


# alias
alias ls='ls -lhtr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -all --color=auto'
alias ll='ls -l --color=auto'
#alias tmux='tmux -2'

chpwd() { ls -ltr --color=auto }

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exisits!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# prompt
autoload -Uz vcs_info
autoload -Uz colors
colors

setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

PROMPT='%{$fg[red]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '
RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

keychain --nogui --quiet ~/.ssh/id_rsa
source ~/.keychain/$HOST-sh


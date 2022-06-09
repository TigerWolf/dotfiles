# Theme START
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

export TERM="xterm-256color"
#TODO: Check for this command on non rvm systems
PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
rvm_version_display(){
  local color='%F{black}'
  if ! [ -x "$(command -v ~/.rvm/bin/rvm-prompt)" ]; then
    exit 1
  fi
  ruby_version=$(~/.rvm/bin/rvm-prompt i v)
  if [ -n "$ruby_version" ]; then
    echo "%{$color%}♦️${ruby_version//ruby-} "
  fi
}

POWERLEVEL9K_CUSTOM_RVM="rvm_version_display"
POWERLEVEL9K_CUSTOM_RVM_BACKGROUND="red"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir custom_rvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time command_execution_time)

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="green"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

if [ "$SESSION_TYPE" = "remote/ssh" ]; then 
  #echo "ssh!"
  POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="003"
fi

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
# Theme END

# Colors
export CLICOLOR=true
#alias ls='ls --color=auto'

case `uname` in
  Darwin)
    # commands for OS X go here
		alias ls='gls --color=auto'
  ;;
  Linux)
    # commands for Linux go here
    ls --color=auto &> /dev/null && alias ls='ls --color=auto' ||
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

#Antigen START
#source /usr/local/share/antigen/antigen.zsh
source ~/dotfiles/antigen.zsh

antigen theme romkatv/powerlevel10k


antigen bundle zsh-users/zsh-completions
#antigen bundle git
#antigen bundle colorize
#antigen bundle github
#antigen bundle brew
#antigen bundle osx
#antigen bundle rails
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
# configure your keybindings here... just 2 lines of code!
antigen apply
#Antigen END

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Make delete key work
bindkey "^[[3~" delete-char

# iTerm2 window title
set-window-title() {
  window_title="\e]0;${${PWD/#"$HOME"/~}/projects/p}\a"
  echo -ne "$window_title"
}

#PR_TITLEBAR=''
#set-window-title
add-zsh-hook precmd set-window-title

# iTerm2 integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##############################################################################
## History Configuration
###############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

if [ -d "$HOME/.jenv" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/bin"

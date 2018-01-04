# Theme START
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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
[ -n "$PS1" ] && sh ~/.nightshell/office-dark


#Antigen START
#source /usr/local/share/antigen/antigen.zsh
source ~/dotfiles/antigen.zsh
# Manage Oh-My-Zsh plugins with Antigen
#source $(brew --prefix)/share/antigen.zsh

antigen theme bhilburn/powerlevel9k powerlevel9k

#antigen use prezto

#antigen bundle sorin-ionescu/prezto modules/helper  # required for Git module
#antigen bundle sorin-ionescu/prezto modules/editor
#antigen bundle sorin-ionescu/prezto modules/git
#antigen bundle sorin-ionescu/prezto modules/prompt

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
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
# RVM
FILE=/Users/kieran/.rvm/scripts/rvm && test -f $FILE && source $FILE
#source /Users/kieran/.rvm/scripts/rvm

# Make delete key work
bindkey "^[[3~" delete-char

# iTerm2 integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##############################################################################
## History Configuration
###############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Theme START
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
rvm_version_display(){
  local color='%F{black}'
  ruby_version=$(~/.rvm/bin/rvm-prompt i v)
  if [ -n "$ruby_version" ]; then
    echo "%{$color%}♦️ ${ruby_version//ruby-} "
  fi
}

POWERLEVEL9K_CUSTOM_RVM="rvm_version_display"
POWERLEVEL9K_CUSTOM_RVM_BACKGROUND="red"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir custom_rvm vcs) # swift_version
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time command_execution_time)
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="green"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
# Theme END

# Colors
[ -n "$PS1" ] && sh ~/.nightshell/office-dark


#Antigen START
source /usr/local/share/antigen/antigen.zsh

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply
#Antigen END

# RVM
source /Users/kieran/.rvm/scripts/rvm

# Make delete key work
bindkey "^[[3~" delete-char

# iTerm2 integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

[ -n "$PS1" ] && sh ~/.nightshell/office-dark

source /usr/local/share/antigen/antigen.zsh

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Make delete key work
bindkey "^[[3~" delete-char

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

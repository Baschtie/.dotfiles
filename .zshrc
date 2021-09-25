# autoload -U colors && colors
# PS1="%(?.%F{green}•.%F{red}•) %F{blue}%n%F{white} %F{yellow}%~ %F{244}%# %F{015}"
PS1="%(?.%F{green}•.%F{red}•) %F{yellow}%~ %F{244}%# %F{015}"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="%F{244}\$vcs_info_msg_0_ %K{000}%*"
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# autoload -Uz compinit && compinit -i
# source <(kubectl completion zsh)
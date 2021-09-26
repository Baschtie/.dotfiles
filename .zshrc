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

# source ~/.zsh/plugins/kube-ps1.sh
# KUBE_PS1_PREFIX=""
# KUBE_PS1_SEPARATOR=""
# KUBE_PS1_SUFFIX=" "
# KUBE_PS1_CTX_COLOR=cyan
# KUBE_PS1_NS_COLOR=blue
# PROMPT='$(kube_ps1)'$PROMPT

# autoload -Uz compinit && compinit -i
# source <(kubectl completion zsh)
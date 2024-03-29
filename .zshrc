autoload -Uz compinit
compinit
# autoload -U colors && colors
# PS1="%(?.%F{green}•.%F{red}•) %F{blue}%n%F{white} %F{yellow}%~ %F{244}%# %F{015}"
# set -o PROMPT_SUBST
# TODO improve perf: https://superuser.com/questions/1619614/bash-ps1-vs-prompt-command-to-set-prompt-and-title
PS1="%F{244}"$'\U2388'"\$(kubens -c) %(?.%F{green}•.%F{red}•) %F{yellow}%~ %F{244}%# %K{reset_colors}%F{reset_colors}"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RIGHT_SIDE="%F{244}\$vcs_info_msg_0_ %*%K{reset_colors}"
RPROMPT="$RIGHT_SIDE"
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# source ~/.zsh/plugins/kube-ps1.sh
# KUBE_PS1_PREFIX=""
# KUBE_PS1_SEPARATOR=""
# KUBE_PS1_SUFFIX=" "
# KUBE_PS1_CTX_COLOR=cyan
# KUBE_PS1_NS_COLOR=blue
# PROMPT='$(kube_ps1)'$PROMPT

source <(kubectl completion zsh)
alias k=kubectl
alias kns=kubens
alias kctx=kubectx
compdef __start_kubectl k

#Gradle
export PATH=/usr/local/bin/gradle-7.3/bin:$PATH
export PATH="$PATH:$HOME/.local/bin"

#ssh
export SSH_AUTH_SOCK=/Users/basti/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

#measure command time (history -D)
setopt inc_append_history_time

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if (($timer_show > 0)); then
        export RPROMPT="$RIGHT_SIDE%F{244} [${timer_show}s]%{$reset_color%}"
    else
        export RPROMPT="$RIGHT_SIDE"
    fi
    unset timer
  fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/basti/.docker/init-zsh.sh || true # Added by Docker Desktop

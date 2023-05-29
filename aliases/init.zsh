case ${OSTYPE} in
    linux*)
        (( ${+commands[apt]} )) && alias apt="sudo apt"
        (( ${+commands[yum]} )) && alias yum="sudo yum"
        (( ${+commands[dnf]} )) && alias dnf="sudo dnf"
        (( ${+commands[pacman]} )) && alias pacman="sudo pacman"
        (( ${+commands[systemctl]} )) && alias systemctl="sudo systemctl"
        (( ${+commands[ip]} )) && alias ip="ip --color=auto"
        ;;
    darwin*)
        alias browse="open -a /Applications/Firefox.app"
        ;;
esac

if (( ${+commands[ggrep]} )); then
    alias grep="ggrep --color=auto"
    alias egrep="gegrep --color=auto"
    alias fgrep="gfgrep --color=auto"
elif (( ${+commands[grep]} )); then
    alias grep="grep --color=auto"
fi

(( ${+commands[gxargs]} )) && alias xargs="gxargs"
(( ${+commands[gfind]} )) && alias find="gfind"

if (( ${+commands[exa]} )); then
    alias ls="exa"
    alias la="exa --long --all --git --group"
    alias lt="exa --long --git --group -snew"
    alias ll="exa --long --git --group"
else
    alias ls="ls --color=auto"
    alias la="ls -la"
    alias lt="ls -lt"
    alias ll="ls -l"
    alias l.="ls -ld .?*"
fi

(( ${+commands[bat]} )) && alias cat="bat"

# cd to subdirs
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

(( ${+commands[kubectl]} )) && () {
    alias k="kubectl"
    alias ka="kubectl apply"
    alias kd="kubectl delete"
    alias kl="kubectl logs"
    alias kg="kubectl get"
    (( ${+commands[helm]} )) && () {
        alias h="helm"
        alias hi="helm install"
        alias hd="helm delete"
        alias hl="helm ls"
        alias hg="helm get"
    }
    (( ${+commands[kubens]} )) && alias kns="kubens"
    (( ${+commands[kubectx]} )) && alias kctx="kubectx"
}

if (( ${+commands[docker]} )); then
    alias d="docker"
    alias db="docker build"
    alias di="docker images"
    alias dn="docker network"
elif (( ${+commands[nerdctl]} )); then
    alias n="nerdctl"
    alias ni="nerdctl images"
    alias nb="nerdctl build"
    alias nn="nerdctl network"
fi

(( ${+commands[ansible]} )) && () {
    alias a="ansible"
    alias ap="ansible-playbook"
}

(( ${+commands[terraform]} )) && () {
    alias tf="terraform"
    alias tfa="terraform apply"
    alias tfd="terraform destroy"
    (( ${+commands[terragrunt]} )) && () {
        alias tg="terragrunt"
        alias tga="terragrunt apply"
        alias tgd="terragrunt destroy"
    }
}

alias sudo="nocorrect sudo"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"
alias mkdir="nocorrect mkdir"
alias man="nocorrect man"

alias vim=$EDITOR
alias v=$EDITOR

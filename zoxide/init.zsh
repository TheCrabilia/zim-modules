(( ${+commands[zoxide]} )) && () {
    eval "$(${commands[zoxide]} init --cmd cd --hook pwd zsh)"
} ${0:h}

(( ${+commands[zoxide]} )) && () {
    local cmd=${commands[zoxide]}

    local initfile=$1/zoxide.zsh
    if [[ ! -e $initfile || $initfile -ot $cmd ]]; then
        $cmd init --cmd cd zsh >| $initfile
        print -u2 -PR "* Detected new version 'zoxide'. Regenerated init script."
    fi
    source $initfile
} ${0:h}

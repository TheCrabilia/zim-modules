(( ${+commands[styra]} )) && () {
    local cmd=${commands[styra]}

    local compfile=$1/functions/_styra
    if [[ ! -e $compfile || $compfile -ot $cmd ]]; then
        $cmd completion zsh >| $compfile
        print -u2 -PR "* Detected a new version 'styra'. Regenerated completions."
    fi
} ${0:h}

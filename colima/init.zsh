(( ${+commands[colima]} )) && () {
    local cmd=${commands[colima]}

    local compfile=$1/functions/_colima
    if [[ ! -e $compfile || $compfile -ot $cmd ]]; then
        $cmd completion zsh >| $compfile
        print -u2 -PR "* Detected a new version 'colima'. Regenerated completions."
    fi
} ${0:h}

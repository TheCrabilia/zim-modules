(( ${+commands[mdbook]} )) && () {
    local cmd=${commands[mdbook]}

    local compfile=$1/functions/_mdbook
    if [[ ! -e $compfile || $compfile -ot $cmd ]]; then
        $cmd completion zsh >| $compfile
        print -u2 -PR "* Detected a new version 'mdbook'. Regenerated completions."
    fi
} ${0:h}

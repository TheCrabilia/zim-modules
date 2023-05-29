(( ${+commands[op]} )) && () {
    local cmd=${commands[op]}

    local compfile=$1/functions/_op
    if [[ ! -e $compfile || $compfile -ot $cmd ]]; then
        $cmd completion zsh >| $compfile
        print -u2 -PR "* Detected a new version 'op'. Regenerated completions."
    fi

    local init_file=$XDG_CONFIG_HOME/op/plugins.sh
    if [[ -e $init_file ]]; then
        source $init_file
    fi
} ${0:h}

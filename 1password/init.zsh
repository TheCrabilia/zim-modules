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

    if [[ $OSTYPE =~ "darwin*" && ! -d $XDG_DATA_HOME/1password ]]; then
        mkdir -p $HOME/.1password && \
        ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock $HOME/.1password/agent.sock
    fi
    export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
} ${0:h}

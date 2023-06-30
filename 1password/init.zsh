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

    local agent_dir=$HOME/.1password
    if [[ $OSTYPE =~ "darwin*" && ! -d $agent_dir ]]; then
        mkdir -p $agent_dir && \
        ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock $agent_dir/agent.sock
    fi
    export SSH_AUTH_SOCK=$agent_dir/agent.sock
} ${0:h}

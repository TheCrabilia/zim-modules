local corp_proxy exec_timer auto_ls

zstyle -s ':crb:hooks' corp-proxy corp_proxy || corp_proxy=no
zstyle -s ':crb:hooks' exec-times exec_timer || exec_timer=yes
zstyle -s ':crb:hooks' auto-ls auto_ls || auto_ls=yes

autoload -Uz add-zsh-hook

if [[ $corp_proxy == "yes" ]]; then
    _swproxy () {
        is_corpnet() {
            local airport="/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport"
            [[ $($airport -I | awk -F ": " '/ SSID/ {print $2}') == "corpnet01" ]] && return 0 || return 1
        }
        is_vpn () {
            return $(ifconfig | grep -E "^utun" -A 2 | grep -E "inet .*? -->" &>/dev/null)$?
        }
        if [[ $(is_corpnet)$? -eq 0 || $(is_vpn)$? -eq 0 ]]; then
            export HTTP_PROXY="http://aproxy.corproot.net:8080"
            export HTTPS_PROXY="http://aproxy.corproot.net:8080"
            export NO_PROXY="localhost,127.0.0.1/32,.swisscom.com,.swisscom.ch,.corproot.net,.sharedtcs.net,*.docker.internal,*.docker.com,*.docker.io,*.github.com,*.k8s.io,*.github.io,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24,192.168.5.0/24"
            export http_proxy=$HTTP_PROXY
            export https_proxy=$HTTPS_PROXY
            export no_proxy=$NO_PROXY
        else
            unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy
        fi
    }
    add-zsh-hook preexec _swproxy
fi

if [[ $exec_timer == "yes" ]]; then
    _set_start_time () {
        _start_time=$(date +%s)
    }
    _time_it () {
        if [[ $_start_time ]]; then
            local now=$(date +%s)
            local elapsed=$(( $now - $_start_time ))
            if [[ $elapsed -gt 59 ]]; then
                local min=$(( $elapsed / 60 ))
                local sec=$(( $elapsed % 60 ))
                _exec_time="${min}m${sec}s"
            elif [[ $elapsed -gt 1 ]]; then
                _exec_time="${elapsed}s"
            else
                unset _exec_time
            fi
            unset _start_time
        fi
    }
    et () {
        (( ${+_exec_time} )) && echo "Execution time: ${_exec_time}"
    }
    add-zsh-hook preexec _set_start_time
    add-zsh-hook precmd _time_it
fi

if [[ $auto_ls == "yes" ]]; then
    _autols () {
        emulate -L zsh
        (( ${+commands[exa]} )) && exa || ls
    }
    add-zsh-hook chpwd _autols
fi

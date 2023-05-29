for func in ${0:h:A}/functions/^(*.zwc)(N); do
    if [[ ! -e ${func}.zwc || ${func}.zwc -ot ${func} ]]; then
        zcompile -Uz ${func}
    fi
done

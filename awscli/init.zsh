(( ${+commands[aws]} )) && (( ${+commands[aws_completer]} )) && () {
    autoload bashcompinit && bashcompinit

    complete -C "${commands[aws_completer]}" aws
}

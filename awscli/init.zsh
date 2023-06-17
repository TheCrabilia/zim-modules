(( ${+commands[aws]} )) && (( ${+commands[aws_completer]} )) && () {
    complete -C "${commands[aws_completer]}" aws
}

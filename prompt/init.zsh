# Allow variable substitution inside prompts
setopt prompt_subst

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' %b '

# Colors
GRAY=244
GREEN=28
MAGENTA=126
RED=124
YELLOW=214

# Prompt variables
PROMPT=$'%F{$GREEN}%1~%f %F{$YELLOW}${vcs_info_msg_0_}%f%F{$GRAY}>%f '
RPROMPT=$'%F{$RED}%(?..%?)%f'

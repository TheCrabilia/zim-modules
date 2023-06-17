local histfile histsize savehist

zstyle -s ':crb:environment:history' histfile histfile || histfile=$HOME/.zhistory
zstyle -s ':crb:environment:history' histsize histsize || histsize=20000
zstyle -s ':crb:environment:history' savehist savehist || savehist=10000

export HISTFILE=$histfile
export HISTSIZE=$histsize
export SAVEHIST=$savehist

setopt hist_verify
setopt append_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_save_no_dups

setopt auto_cd		            # cd if "command" is a directory
setopt cd_silent                # don't print the working direcotry after a cd

setopt auto_list		        # automatically list choises on an ambiguouse completion
setopt extended_glob	        # treat the # ~ ^ as part of patterns for filename generation
setopt notify		            # report the status of background jobs immediately
setopt no_correct_all	        # do not correct commands and arguments
setopt no_beep		            # disable beep

setopt auto_pushd	            # make cd push the old dir onto the dir stack
setopt pushd_minus	            # exchanges the meanings of + and - when used with a number to specify a dir in the stack
setopt pushd_ignore_dups	    # don't push multiple copies of the same dir onto the dir stack
setopt pushd_silent             # don't print the directory stack after pushd or popd
setopt pushd_to_home            # have pushd without arguments act like "pushd ${HOME}"

setopt interactive_comments     # allow comments starting with # in the interactive shell
setopt no_clobber               # disallow > to overwrite existing files, use >| or >! instead

setopt no_bg_nice               # prevent background jobs being given a lower priority
setopt long_list_jobs	        # print job notifications in the long format by default
setopt no_hup		            # do not send HUP (Hang UP) signal to running jobs on exit

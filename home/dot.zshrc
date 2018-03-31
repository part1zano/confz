# zsh interactive settings
# very base settings
#export PS1='%(!.%m%B:.%B%n@%m:)%3(~,%-1d..%2d,%2~)%(!.# .> )%b'
autoload -U colors
colors
export PS1='[\t] $? \[\e[00m\][\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]]\$ ' # for bash/sh compatibility
export PROMPT="%{$reset_color%}[%*] %? [%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[cyan]%}%~%{$reset_color%}]%# "

autoload -U zmv

export WATCH=all		# login watch as tcsh's set watch = (0 any any)
export LOGCHECK=1		# period in seconds for $watch check
export HISTSIZE=999999		# size of internal (not file) history
export SAVEHIST=$HISTSIZE	# how many lines to write to history file
export HISTFILE=~/.zhist	# history file name
export REPORTTIME=30		# as "time" if command runs more than this secs

#export RPROMPT='%?/%l [%*]'	# right prompt
setopt -h			# no duplicate last event in history
setopt hist_no_store		# remove "history" commands from history
setopt HIST_SAVE_NO_DUPS	# when writing history file
setopt INC_APPEND_HISTORY	# add to hist file immediately
setopt SHARE_HISTORY		# all parallel sessions share history
setopt EXTENDED_HISTORY		# save timestamps in history file
setopt HIST_IGNORE_SPACE	# do not save cmds beginning from space
#setopt -O			# correct spelling of all arguments in a line
setopt nohup			# don't send SIGHUP to bg jobs on exit
setopt AUTO_CONTINUE		# auto send SIGCONT to disown'ed jobs
setopt LIST_PACKED		# compact big completion: diffrnt column width
bindkey -e			# emacs key bindings
setopt interactivecomments

export PATH=$PATH:/usr/local/gcc-arm-embedded-4_8-2014q2-20140609/bin
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
export PAGER="less"
alias .="source"
alias grep='grep --color=auto'
alias ls="ls -FG"

#case $TERM in
#xterm*)
#preexec () {
#print -Pn "\e]0;%m%#: "
#print -n "$2\a"
#}
#precmd () {
#print -Pn "\e]0;%m%#: <%~>\a"
#}
#;;
#esac

# *** key bindings section *** #
# next lines bind ctrl+{left,right}
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word
# next lines bind history search similar to tcsh
bindkey "$(echotc up)" history-beginning-search-backward
bindkey "$(echotc kd)" history-beginning-search-forward
bindkey "$(echotc ku)" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward	# some xterms have no "do" cap
bindkey "^[[A" history-beginning-search-backward # 'screen' don't list this cap
# next lines bind home & end keys
bindkey "$(echotc kh)" beginning-of-line
bindkey "$(echotc @7)" end-of-line
bindkey "^[[1~" beginning-of-line # termcap and real xterm emulators
bindkey "^[[4~" end-of-line       # are often very different
bindkey "^[[H" beginning-of-line # termcap and real xterm emulators
bindkey "^[[F" end-of-line       # are often very different
# next line binds delete key
bindkey "$(echotc kD)" delete-char
# next line binds insert key
bindkey "$(echotc kI)" overwrite-mode
# *** key bindings end *** #

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
#zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
# for completions like cd d/e -> docs/editors and other
autoload -U compinit
compinit

# Completion Styles (copypaste from ZSH examples till end of file)

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
# 												'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
# formacodeing and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-pacodeerns '*?.o' '*?.c~' \
 												'*?.old' '*?.pro'
# the same for old style completion
fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-pacodeerns '_*'

__remote_commands=(scp rsync ssh)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema '[[ $__remote_commands[(i)$words[1]] -le ${#__remote_commands} ]] && reply=("*") || reply=(http https ftp)'

# ssh-agent-related :: not needed!
# if [ -z "$SSH_AUTH_SOCK" ] ; then
# 	ssh-agent > ~/.ssh-agent.zsh
# 	. ~/.ssh-agent.zsh
# 	rm ~/.ssh-agent.zsh
# 	ssh-add
# else
# 	echo "won't start new ssh-agent"
# fi

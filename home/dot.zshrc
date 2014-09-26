# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/che/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1="$? [`whoami`@\h \w]\#"
export PROMPT="%? [%n@%m %~]%# "

bindkey -e                      # emacs key bindings
bindkey "$(echotc up)" history-beginning-search-backward
bindkey "$(echotc kd)" history-beginning-search-forward
bindkey "$(echotc ku)" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward # some xterms have no "do" cap
bindkey "^[[A" history-beginning-search-backward # 'screen' don't list this cap
bindkey "$(echotc kh)" beginning-of-line
bindkey "$(echotc @7)" end-of-line
bindkey "^[[1~" beginning-of-line # termcap and real xterm emulators
bindkey "^[[4~" end-of-line       # are often very different
bindkey "^[[H" beginning-of-line # termcap and real xterm emulators
bindkey "^[[F" end-of-line       # are often very different
bindkey "$(echotc kD)" delete-char
bindkey "$(echotc kI)" overwrite-mode

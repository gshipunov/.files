# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gshipunov/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# pager
export PAGER="less --quit-if-one-screen"

# Edit the command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Prompt
if [[ -n $SSH_CONNECTION ]]; then
    HOST_LBL="%F{red}[%m]%f"
fi

PROMPT="%B%(?..%F{red}[%?]%f)$HOST_LBL%(!.%F{red}[%n]%f.)%F{cyan}%~%(!.%F{red}.%F{green})%# %f%b"

#### Aliases
# add some color
alias grep="grep --color"
alias ls="ls --color=auto"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ls shorthand
alias ll="ls -h -l"
alias l="ls -h -l -A"
alias l.="ls -d .*"

# easy edit
alias e=$EDITOR
alias v=$VISUAL

# platform-specific config
unamestr=$(uname 2> /dev/null)
case "$unamestr" in
    "Darwin")
    alias ls="ls -G" # macos ls is weird
    alias o="open"
    alias cpy="pbcopy"
    alias pst="pbpaste"
    export HOMEBREW_NO_AUTO_UPDATE=1
    ;;
    "Linux")
    alias o="xdg-open"
    alias cpy="xclip -selection clipboard"
    alias pst="xclip -selection clipboard -o"

    # use dircolors, if we have them
    if [[ -f $HOME/.dir_colors ]]; then
        eval $(dircolors -b $HOME/.dir_colors)
    fi
    ;;
esac

setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# configure key keybindings
bindkey -e                                        # emacs key bindings

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# enable syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# pager
export PAGER="less --quit-if-one-screen"

# Edit the command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#### Aliases
# add some color
alias grep="grep --color"
alias ls="ls --color=auto"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ls shorthand
alias ll="ls -h -l"
alias l="ls -h -l -A"
alias l.="ls -d .*"

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
    alias cpy="wl-copy"
    alias pst="wl-paste"
    alias xcpy="xclip -selection clipboard"
    alias xpst="xclip -selection clipboard -o"
    ;;
esac

# hook in direnv, if it installed
if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi

export PS1="%n@%m:%F{green}%~%F{reset}%# "

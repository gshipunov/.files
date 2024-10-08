# PATH manipulation
## for pipx
export PATH=$HOME/.local/bin:$PATH

# QoL aliases
export EDITOR="vi"
export VISUAL="nvim"

alias vvi=vi
alias vvim=vim
alias vi=nvim
alias vim=nvim

# platform-specific config
unamestr=$(uname 2> /dev/null)
case "$unamestr" in
"Darwin")
    export GPG_TTY=$(tty)
    export PATH=$HOME/bin:/Library/TeX/texbin:/usr/local/bin:$PATH
    export HOMEBREW_NO_GITHUB_API=1
    ;;
"Linux")
    ;;
esac

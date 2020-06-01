export EDITOR="vi"
export VISUAL="nvim"

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

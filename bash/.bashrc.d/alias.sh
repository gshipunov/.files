# ls
alias l="ls -l"
alias la="ls -la"
alias ll="ls -lah"
alias lt="ls --tree"

# tmux
if [ -x "$(command -v tmux)" ]; then
    function tn {
        if [ $# -eq 0 ]; then
            tmux new-session -s $(basename $(pwd))
        else
            tmux new-session -s $1
        fi
    }
    alias tl="tmux list-sessions"
    alias ta="tmux attach -t"
fi

# LaTeX
if [ -x "$(command -v latexmk)" ]; then
    if [ -x "$(command -v lualatex)" ]; then
        alias luamk="latexmk -pdf -interaction=nonstopmode -pdflatex=lualatex"
    fi
    alias lmk="latexmk -pdf -interaction=nonstopmode"
fi

# editor
if [ -x "$(command -v nvim)" ]; then
	alias vim="nvim"
	alias vi="nvim"
fi

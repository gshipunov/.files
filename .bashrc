# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Prompt
export PS1="\u@\h:\[\e[0;92m\]\w\[\e[0m\]$ "

# User specific aliases and functions
alias luamk="latexmk -pdf -pvc -interaction=nonstopmode -pdflatex=lualatex"

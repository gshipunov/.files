if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	export PS1="\[\e[1;36m\]\u@\[\e[1;35m\]\h\[\e[1;0m\]:\[\e[1;92m\]\w\[\e[1;0m\]$ "
else
	export PS1="\[\e[1;36m\]\u@\h\[\e[1;0m\]:\[\e[1;92m\]\w\[\e[1;0m\]$ "
fi

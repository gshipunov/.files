# LaTeX
alias luamk="latexmk -pdf -interaction=nonstopmode -pdflatex=lualatex"
alias lmk="latexmk -pdf -interaction=nonstopmode"

# editor
if [ -x "$(command -v nvim)" ]; then
	alias vim="nvim"
	alias vi="nvim"
fi

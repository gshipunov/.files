alias luamk="latexmk -pdf -pvc -interaction=nonstopmode -pdflatex=lualatex"

if [ -x "$(command -v nvim)" ]; then
	alias vim="nvim"
	alias vi="nvim"
fi

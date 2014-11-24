# source base16 colours if present
set shell_theme "$HOME/.config/base16-shell/base16-grayscale.dark.sh"
if test -s $shell_theme
	eval sh $shell_theme
else
	echo "Shell theme not found."
end

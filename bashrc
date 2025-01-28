
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
rgb (){
	echo "\033[38;2;$1;$2;$3m"
}

green="\e[01;32m"
yellow="\e[00;33m"
purple="\e[01;35m"
dgreen="\e[38;5;36m"
end="\e[00m"
SUCCESS="if [ \$? = 0 ]; then echo \"✅\"; else echo \"❌\"; fi"

PS1_text="\$($SUCCESS)${green}\u@\h${end} ${yellow}>> ${dgreen}\w${purple} \$(parse_git_branch)${yellow}\$${end} "
PS1_text=$(echo $PS1_text | sed -e 's/\(\\e[^\\]*m\)/\\[\1\\]/g')

PS1="${debian_chroot:+($debian_chroot)}$PS1_text "
unset PS1_text

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#	        exec tmux
fi



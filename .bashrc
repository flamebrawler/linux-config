parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[00;33m\]>>\[\033[00m\] \[\033[38;5;36m\w\033[0m\]\e[1;35m $(parse_git_branch)\e[0m\[\033[00;33m\]\$\[\033[00m\] '

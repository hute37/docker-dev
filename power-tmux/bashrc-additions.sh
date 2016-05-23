export PATH="$PATH:$HOME/.local/bin"
export TERM=screen-256color

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

# If the tmux session doesn't exist then start it up
if [[ "$TMUX" == "" ]]; then
	exec tmux new -A -s root
fi

# detach instead if in tmux session...
exit () {
	if [[ "$TMUX" == "" ]]; then
		builtin exit
	else
		tmux detach
	fi
}
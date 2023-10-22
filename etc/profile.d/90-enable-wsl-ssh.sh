# Check to make sure we've set up ssh-agent
if ! /usr/lib/wsl-ssh/ssh-add -L > /dev/null 2>&1 ; then
	echo "The Windows OpenSSH Agent isn't running, start it via 'wsl-enable-ssh-agent'" >&2
fi

## NB: We can't find PREFIX easily in a profile.d script so we'll need to
## try to guess what it is by running down the existing path
BINDIR=$(dirname `which wsl-enable-ssh-agent`)
PREFIX=$(realpath "$BINDIR/..")

## Put our symlinked OpenSSH in front of the real one
export PATH="$PREFIX/lib/wsl-ssh:$PATH"

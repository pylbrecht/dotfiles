SSH_ENV=$HOME/.ssh/ssh-agent.env
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > $SSH_ENV
fi

if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source $SSH_ENV >/dev/null
fi

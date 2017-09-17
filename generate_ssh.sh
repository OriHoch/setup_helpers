# Get email from argument
email=$1

# Install xclip
if [ ! -f /usr/bin/xclip ]; then
    sudo apt install xclip
fi

# Generate ssh keys
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "$email" -q -N "" -f ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

# Copy key to clipboard
xclip -sel clip < ~/.ssh/id_rsa.pub
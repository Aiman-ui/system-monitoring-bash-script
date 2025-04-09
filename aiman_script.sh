#!/bin/bash
echo " here are my os info "
OS=$(cat /etc/os-release | grep "^NAME="  )
if [[ "$OS" == *"Linux"* ]]; then
    echo "You are running Linux. Nice choice! ($OS)"
elif [[ "$OS" == *"Darwin"* ]]; then
    echo "You are on macOS. Fancy!"
else
    echo "Hmm... Unknown OS: $OS"
fi


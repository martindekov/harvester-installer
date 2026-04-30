#!/bin/bash -e

if [ -z "$TTY" ]; then
    export TTY=$(tty)
fi

export TERM=linux

# Ensure log directory exists
mkdir -p /var/log
# Run installer and log output to file and console
harvester-installer 2>&1 | tee -a /var/log/harvester-installer.log
# Do not allow bash prompt if the installer doesn't exit with status 0

# We're not starting the shell using /bin/login, so we need to set $HOME manually
export HOME=/root
bash -l

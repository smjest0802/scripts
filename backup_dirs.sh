#!/usr/bin/env bash

# Exit as soon as any line in the script fails
# Prints each command executed
#set -ex

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize Variables
local_backup_dir=""
network_backup_dir=""
file_prefix=""

# TBD Add help text.
while getopts "h?p:l:n:" opt; do
    case "$opt" in
    h|\?)
        echo "Show help here"
        exit 0
        ;;
    p)  file_prefix=$OPTARG
        ;;
    l)  local_backup_dir=$OPTARG
        ;;
    n)  network_backup_dir=$OPTARG
        ;;
    esac
done

# Shift to the first non-optional parameter
shift "$((OPTIND-1))"

to_backup=$@


# Create Tar ball filename
filename="${file_prefix}$(date +'%Y%m%d%H%M%S').gz"

# Tar up directories
echo "Objects to add to tar: ${to_backup}"
echo "Begin creating tar file: ${local_backup_dir}${filename}"
tar -cvzf ${local_backup_dir}${filename} ${to_backup}
echo "Done creating tar file."
echo

# Network location
echo "Save file to network drive '${network_backup_dir}' (wait for password prompt)"
user=sshd
host=10.0.0.3
scp ${local_backup_dir}${filename} ${user}@${host}:${network_backup_dir}
echo "Done saving file on network drive"

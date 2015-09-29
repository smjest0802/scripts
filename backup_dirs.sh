#!/usr/bin/env bash

# Exit as soon as any line in the script fails
# Prints each command executed
set -ex

backed_up_location=""
local_backed_up="/share/backups/files/"

# ToDo: Add Targeted home locations later.
#to_backup="/share/test/ /share/challenge/ /share/utility_scripts/ /home/shawn/"
to_backup="/share/test/ /share/challenge/ /share/utility_scripts/"

network_dir="/shares/Linux/ubuntu/backups"

# Create Tar ball filename
filename="backup_file_$(date +'%Y%m%d%H%M%S').gz"

# Tar up directories
tar -cvzf ${local_backed_up}${filename} ${to_backup}

scp ${local_backed_up}${filename} sshd@10.0.0.3:${network_dir}

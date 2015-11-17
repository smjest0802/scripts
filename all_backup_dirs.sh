 #!/usr/bin/env bash

# This script calls the 'real' backup script with different parameters.

local_dir="/share/backups/files/"
network_dir="/shares/Linux/ubuntu/backups/"
user="sshd"
host="10.0.0.3"

./backup_dirs.sh -u ${user} -d ${host} -p family_site_backup_ -l ${local_dir} -n ${network_dir} /share/family/
./backup_dirs.sh -u ${user} -d ${host} -p test_backup_ -l ${local_dir} -n ${network_dir} /share/test/
./backup_dirs.sh -u ${user} -d ${host} -p challenge_backup_ -l ${local_dir} -n ${network_dir} /share/challenge/
./backup_dirs.sh -u ${user} -d ${host} -p utility_backup_ -l ${local_dir} -n ${network_dir} /share/utility_scripts/
./backup_dirs.sh -u ${user} -d ${host} -p shawn_home_backup_ -l ${local_dir} -n ${network_dir} /home/shawn/.profile /home/shawn/.vim/ /home/shawn/.vimrc
./backup_dirs.sh -u ${user} -d ${host} -p html_css_backup_ -l ${local_dir} -n ${network_dir} /share/html_css/

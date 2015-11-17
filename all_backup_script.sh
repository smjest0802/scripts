 #!/usr/bin/env bash

# This script calls the 'real' backup script with different parameters.

localDir="/share/backups/files/"
networkDir="/shares/Linux/ubuntu/backups/"
user="sshd"
host="10.0.0.3"

./backup_script.sh -u ${user} -d ${host} -p family_site_backup_ -l ${localDir} -n ${networkDir} /share/family/
./backup_script.sh -u ${user} -d ${host} -p test_backup_ -l ${localDir} -n ${networkDir} /share/test/
./backup_script.sh -u ${user} -d ${host} -p challenge_backup_ -l ${localDir} -n ${networkDir} /share/challenge/
./backup_script.sh -u ${user} -d ${host} -p utility_backup_ -l ${localDir} -n ${networkDir} /share/utility_scripts/
./backup_script.sh -u ${user} -d ${host} -p shawn_home_backup_ -l ${localDir} -n ${networkDir} /home/shawn/.profile /home/shawn/.vim/ /home/shawn/.vimrc
./backup_script.sh -u ${user} -d ${host} -p html_css_backup_ -l ${localDir} -n ${networkDir} /share/html_css/

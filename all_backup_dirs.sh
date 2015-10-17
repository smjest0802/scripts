 #!/usr/bin/env bash

local_dir="/share/backups/files/"
network_dir="/shares/Linux/ubuntu/backups/"

./backup_dirs.sh -p family_site_backup_ -l ${local_dir} -n ${network_dir} /share/family/
./backup_dirs.sh -p test_backup_ -l ${local_dir} -n ${network_dir} /share/test/
./backup_dirs.sh -p challenge_backup_ -l ${local_dir} -n ${network_dir} /share/challenge/
./backup_dirs.sh -p utility_backup_ -l ${local_dir} -n ${network_dir} /share/utility_scripts/
./backup_dirs.sh -p shawn_home_backup_ -l ${local_dir} -n ${network_dir} /home/shawn/.profile /home/shawn/.vim/ /home/shawn/.vimrc /home/family/.my.cnf



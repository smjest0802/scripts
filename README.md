This repository cans some useful utility scripts that I have written. Feel free to use in part or whole as you see fit.

##Backup Scripts
The script [backup_script.sh](https://github.com/smjest0802/scripts/blob/master/backup_script.sh) will create a tar ball from a list of files or directories. The parameters `File Prefix` and `Local Directory` are required. If backing up somewhere else too then need to specify parameters, `User`, `Host` and `Network Directory` (if any of these are missing then files are not backed up to remote location). The `scp` used to send the file will prompt for a password if ssh keys are not used.
```
./${scriptName} [-h?] -f <File Prefix> -l <Local Directory> [-u <user> -d <host> -n <Network Directory>] <What to Backup>

$ ./backup_script.sh -u sshd -d 10.0.0.3 -p test_backup_ -l /share/local_backup/ -n /shares/Linux/ubuntu/backups/ /share/test/
```

The script [all_backup_script.sh](https://github.com/smjest0802/scripts/blob/master/all_backup_script.sh) makes canned calls with different parameters to [backup_script.sh](https://github.com/smjest0802/scripts/blob/master/backup_script.sh), allowing for repeated calls with no errors.

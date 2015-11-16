#!/usr/bin/env bash

# Exit as soon as any line in the script fails
# Print each command executed
#set -ex

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

scriptName=`basename "$0"`

# Initialize Variables
localBackupDir=""
networkBackupDir=""
filePrefix=""

while getopts "h?p:l:n:" opt; do
    case "$opt" in
    h|\?)
        echo -e "${scriptName}\tScript creates a tar ball of the specifed directories."
        echo -e "\t$ ./${scriptName} [-h?] -f <File Prefix> -l <Local Directory> [-n <Network Directory>]"
        echo -e "\tThe file format of the created file is '<File Prefix>YYYYMMDDhhmmss.gz'"
        echo ""
        echo -e "\t-h / -?\t\tDisplay the help text"
        echo -e "\t-l\t\tSpecify the local directory to create the tar ball in"
        echo -e "\t-n\t\tSpecify the network directory to send the tar ball to"

        exit 0
        ;;
    p)  filePrefix=$OPTARG
        ;;
    l)  localBackupDir=$OPTARG
        ;;
    n)  networkBackupDir=$OPTARG
        ;;
    esac
done

# Shift to the first non-optional parameter
shift "$((OPTIND-1))"

toBackup=$@

# Confirm required fields are populated.
if [[ -z ${filePrefix} ]] # File prefix
then
    echo Need to specify a file name prefix
    exit 1
fi

if [[ -z ${localBackupDir} ]] # Local backup directory
then
    echo Need to specify a local directory to create the tar ball in.
    exit 1
fi

# Create Tar ball filename
filename="${filePrefix}$(date +'%Y%m%d%H%M%S').gz"

# Tar up directories
echo "Objects to add to tar: ${toBackup}"
echo "Begin creating tar file: ${localBackup_dir}${filename}"
tar -cvzf ${localBackupDir}${filename} ${toBackup}
echo "Done creating tar file."
echo

# Network location
user=sshd
host=10.0.0.3
if [[ ${networkBackupDir} ]]
then
    echo "Saving file to network drive '${user}@%{host}:${networkBackupDir}' (wait for password prompt)"
    # Will get prompted for password if not using ssh keys between host and target.
    # For full automation, make sure to setup ssh keys.
    scp ${localBackupDir}${filename} ${user}@${host}:${networkBackupDir}
    echo "Done saving file on network drive"
fi

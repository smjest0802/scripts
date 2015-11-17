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
user=""
host=""

printHelp ()
{
    echo -e "${scriptName}\tScript creates a tar ball of the specifed directories."
    echo -e "\t$ ./${scriptName} [-h?] -f <File Prefix> -l <Local Directory> [-u <user> -d <host> -n <Network Directory>]  <What to Backup>"
    echo -e "\tThe file format of the created file is '<File Prefix>YYYYMMDDhhmmss.gz'"
    echo ""
    echo -e "\t-h / -?\t\tDisplay the help text"
    echo -e "\t-l\t\tLocal dir: Specify the local directory to create the tar ball in. Required to be set."
    echo -e "\t-n\t\tNetwork dir: Specify the network directory to send the tar ball to. Must be set with User and Host."
    echo -e "\t-u\t\tUser name: User name to use to connect to network location. Must be set with Network dir and Host."
    echo -e "\t-d\t\tHost: Destination address to send the files to. Must be set with Network dir and Host."

    exit 0
}

while getopts "h?p:l:n:u:d:" opt; do
    case "$opt" in
    h|\?)
        printHelp
        ;;
    p)  filePrefix=$OPTARG
        ;;
    l)  localBackupDir=$OPTARG
        ;;
    n)  networkBackupDir=$OPTARG
        ;;
    u)  user=$OPTARG
        ;;
    d)  host=$OPTARG
    esac
done

# Shift to the first non-optional parameter
shift "$((OPTIND-1))"

toBackup=$@

# Confirm required fields are populated.
if [[ -z ${filePrefix} ]] # File prefix
then
    echo ERROR: Need to specify a file name prefix
    printHelp
    exit 1
fi

if [[ -z ${localBackupDir} ]] # Local backup directory
then
    echo ERROR: Need to specify a local directory to create the tar ball in.
    printHelp
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

# SCP the created tar ball to the network drive.
# Only call if all three parameters are populated.
if [[ ${networkBackupDir} && ${user} && ${host} ]]
then
    echo "Saving file to network drive '${user}@${host}:${networkBackupDir}'"
    # Will get prompted for password if not using ssh keys between host and target.
    # For full automation, make sure to setup ssh keys.
    scp ${localBackupDir}${filename} ${user}@${host}:${networkBackupDir}
    echo "Done saving file on network drive"
fi

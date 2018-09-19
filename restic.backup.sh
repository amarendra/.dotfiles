#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

# a new log file for every run so that I can easily check what happened when and can delete previous log files
LOG_FILE=$RESTIC_LOG_DIR/restic_backup.log

echo "RESTIC BACKUP SCRIPT STARTED AT $(date -R)" >> $LOG_FILE

# regain lock if needed
restic unlock

# I have decided to keep the log as I do not think for my aggressively small backup size it would affect the sppeed that much
restic backup \
	--files-from $RESTIC_INCLUDE_FILE \
	--exclude-caches \
	--exclude-file=$RESTIC_EXCLUDE_FILE \
	>> LOG_FILE

echo "Running restic check with cache...." >> $LOG_FILE
restic check --with-cache >> $LOG_FILE

echo "Running restic stats...." >> $LOG_FILE
restic stats >> $LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

echo "RESTIC BACKUP SCRIPT FINISHED $(date -R)" >> $LOG_FILE

echo "===================================================================" >> $LOG_FILE

exit 0
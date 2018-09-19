#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

LOG_FILE=$RESTIC_LOG_DIR/restic_maintenance.log

echo "RESTIC MAINTENANCE SCRIPT STARTED AT $(date -R)" >> $LOG_FILE

restic --verbose forget --keep-last 10 \
	--keep-daily 7 \
	--keep-weekly 5 \
	--keep-monthly 12 \
	--keep-yearly 3 \
	--prune	>> $LOG_FILE
	
# Checks the backup status. Once in a while run this without cache.
echo "Running restic check...." >> $LOG_FILE
restic check >> $LOG_FILE


echo "Running restic stats...." >> $LOG_FILE
restic stats >> $LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

echo "RESTIC MAINTENANCE SCRIPT FINISHED at $(date -R)" >> $LOG_FILE

echo "===================================================================" >> $LOG_FILE

exit 0
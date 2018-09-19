#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

echo "RESTIC MAINTENANCE SCRIPT STARTED AT $(date -R)" >> $RESTIC_LOG_FILE

restic --verbose forget --keep-last 10 \
	--keep-daily 7 \
	--keep-weekly 5 \
	--keep-monthly 12 \
	--keep-yearly 3 \
	--prune	>> $RESTIC_LOG_FILE
	
# Checks the backup status. Once in a while run this without cache.
echo "Running restic check...." >> $RESTIC_LOG_FILE
restic check >> $RESTIC_LOG_FILE


echo "Running restic stats...." >> $RESTIC_LOG_FILE
restic stats >> $RESTIC_LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

echo "RESTIC MAINTENANCE SCRIPT FINISHED at $(date -R)" >> $RESTIC_LOG_FILE

echo "===================================================================" >> $RESTIC_LOG_FILE

exit 0
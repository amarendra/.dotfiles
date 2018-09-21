#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

echo "*** RESTIC BACKUP SCRIPT STARTED AT $(date -R)" >> $RESTIC_LOG_FILE

# regain lock if needed
restic unlock

# I have decided to keep the log as I do not think for my aggressively small backup size it would affect the sppeed that much
restic --verbose backup \
	--files-from $RESTIC_INCLUDE_FILE \
	--exclude-caches \
	--exclude-file=$RESTIC_EXCLUDE_FILE >> $RESTIC_LOG_FILE

echo "\n\n*** Running restic check with cache...." >> $RESTIC_LOG_FILE
restic check --with-cache >> $RESTIC_LOG_FILE

echo "\n\n*** Running restic stats...." >> $RESTIC_LOG_FILE
restic stats >> $RESTIC_LOG_FILE

echo "\n*** Running restic stats for raw-data:" >> $RESTIC_LOG_FILE
restic stats --mode raw-data >> $RESTIC_LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

echo "\n*** RESTIC BACKUP SCRIPT FINISHED $(date -R)" >> $RESTIC_LOG_FILE

echo "===================================================================\n\n" >> $RESTIC_LOG_FILE

exit 0
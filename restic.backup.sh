#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

osascript -e 'display notification "Started." with title "Restic" subtitle "Backup script"'
printf "RESTIC BACKUP SCRIPT STARTED AT $(date -R)\n\n" >> $RESTIC_BACKUP_LOG_FILE

# regain lock if needed
restic unlock

# I have decided to keep the log as I do not think for my aggressively small backup size it would affect the sppeed that much
restic --verbose backup \
	--files-from $RESTIC_INCLUDE_FILE \
	--exclude-caches \
	--exclude-file=$RESTIC_EXCLUDE_FILE >> $RESTIC_BACKUP_LOG_FILE

printf "\n\nRunning restic check with cache....\n" >> $RESTIC_BACKUP_LOG_FILE
restic check --with-cache >> $RESTIC_BACKUP_LOG_FILE

printf "\n\nRunning restic stats....\n" >> $RESTIC_BACKUP_LOG_FILE
restic stats >> $RESTIC_BACKUP_LOG_FILE

printf "\n\nRunning restic stats for raw-data:\n" >> $RESTIC_BACKUP_LOG_FILE
restic stats --mode raw-data >> $RESTIC_BACKUP_LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

printf "\n\nRESTIC BACKUP SCRIPT FINISHED $(date -R)\n" >> $RESTIC_BACKUP_LOG_FILE
osascript -e 'display notification "Finished." with title "Restic" subtitle "Backup script"'

printf "\n\n======================================================================================================================================\n\n\n" >> $RESTIC_BACKUP_LOG_FILE

exit 0
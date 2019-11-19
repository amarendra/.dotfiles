#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

osascript -e 'display notification "Started." with title "Restic" subtitle "Maintenance script"'
printf "RESTIC MAINTENANCE SCRIPT STARTED AT $(date -R)\n\n" >> $RESTIC_MAINT_LOG_FILE

restic --verbose forget --keep-last 10 \
	--keep-daily 7 \
	--keep-weekly 5 \
	--keep-monthly 12 \
	--keep-yearly 3 \
	--prune	>> $RESTIC_MAINT_LOG_FILE
	
# Checks the backup status. Once in a while run this without cache or "restic check --read-data".
printf "\n\nRunning restic check....\n" >> $RESTIC_MAINT_LOG_FILE
restic check >> $RESTIC_MAINT_LOG_FILE

printf "\n\nRunning restic stats....\n" >> $RESTIC_MAINT_LOG_FILE
restic stats >> $RESTIC_MAINT_LOG_FILE

printf "\n\nRunning restic stats for raw-data:\n" >> $RESTIC_MAINT_LOG_FILE
restic stats --mode raw-data >> $RESTIC_MAINT_LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

printf "\n\nRESTIC MAINTENANCE SCRIPT FINISHED at $(date -R)\n" >> $RESTIC_MAINT_LOG_FILE
osascript -e 'display notification "Finished." with title "Restic" subtitle "Maintenance script"'

printf "\n\n======================================================================================================================================\n\n\n" >> $RESTIC_MAINT_LOG_FILE

exit 0
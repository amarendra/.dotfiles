#!/bin/bash
# sources environment varialbes including credentials
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

osascript -e 'display notification "Started." with title "Restic" subtitle "Maintenance script"'
printf "\nRestic maintenance script started. TIME: $(date -R)\n" >> $RESTIC_MAINT_LOG_FILE

restic --verbose forget --keep-last 10 \
	--keep-daily 7 \
	--keep-weekly 5 \
	--keep-monthly 12 \
	--keep-yearly 3 \
	--prune	>> $RESTIC_MAINT_LOG_FILE

prune_exit_code=$?
printf "\nforget with prune finished with exit code ${prune_exit_code}\n" >> $RESTIC_MAINT_LOG_FILE

# Checks the backup status. Once in a while run this without cache or "restic check --read-data".
restic check --with-cache >> $RESTIC_MAINT_LOG_FILE
check_exit_code=$?
printf "\nrestic check with cache finished with exit code ${check_exit_code}\n" >> $RESTIC_MAINT_LOG_FILE

restic stats>> $RESTIC_MAINT_LOG_FILE
stats_exit_code=$?
printf "\nrestic stats finished with exit code ${stats_exit_code}\n" >> $RESTIC_MAINT_LOG_FILE

restic stats --mode raw-data >> $RESTIC_MAINT_LOG_FILE
stats_raw__data_exit_code=$?
printf "\nrestic stats for raw-data finished with exit code ${stats_raw__data_exit_code}\n" >> $RESTIC_MAINT_LOG_FILE


# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

successful="without any issues."

if [ $prune_exit_code -ne 0 -o $check_exit_code -ne 0 -o $stats_exit_code -ne 0 -o $stats_raw__data_exit_code -ne 0 ]; then
	successful="with issues!!!"
fi

printf "\nRestic maintenance script finished ${successful} TIME: $(date -R)\n" >> $RESTIC_MAINT_LOG_FILE
osascript -e 'display notification "Finished '"$successful"'" with title "Restic" subtitle "Maintenance script"'

printf "\n=======================================================\n\n" >> $RESTIC_MAINT_LOG_FILE

# todo: highest exit code among all 

exit 0
#!/bin/bash
source $HOME/Dropbox/Config/git-ignored/restic/.restic.env

osascript -e 'display notification "Started." with title "Restic" subtitle "Backup script"'
printf "\nrestic backup script started. TIME: $(date -R)\n" >> $RESTIC_BACKUP_LOG_FILE

# regain lock if needed
restic unlock
unlock_exit_code=$?
printf "\nRestic unlock with exit code ${unlock_exit_code}\n"

# I have decided to keep the log as I do not think for my aggressively small backup size it would affect the sppeed that much
restic --verbose backup \
	--files-from $RESTIC_INCLUDE_FILE \
	--exclude-caches \
	--exclude-file=$RESTIC_EXCLUDE_FILE >> $RESTIC_BACKUP_LOG_FILE

backup_exit_code=$?
printf "\nrestic backup exit code: ${backup_exit_code}\n" >> $RESTIC_BACKUP_LOG_FILE

restic check --with-cache >> $RESTIC_BACKUP_LOG_FILE
check_exit_code=$?
printf "\nrestic check with cache finished with exit code ${check_exit_code}\n" >> $RESTIC_BACKUP_LOG_FILE

restic stats>> $RESTIC_BACKUP_LOG_FILE
stats_exit_code=$?
printf "\nrestic stats finished with exit code ${stats_exit_code}\n" >> $RESTIC_BACKUP_LOG_FILE

restic stats --mode raw-data >> $RESTIC_BACKUP_LOG_FILE
stats_raw__data_exit_code=$?
printf "\nrestic stats for raw-data finished with exit code ${stats_raw__data_exit_code}\n" >> $RESTIC_BACKUP_LOG_FILE

# reset restic credentials
export RESTIC_REPOSITORY=""
export B2_ACCOUNT_ID=""
export B2_ACCOUNT_KEY=""
export RESTIC_PASSWORD_FILE=""

successful="without any issues."

if [ $unlock_exit_code -ne 0 -o $backup_exit_code-ne 0 -o $check_exit_code -ne 0 -o $stats_exit_code -ne 0 -o $stats_raw__data_exit_code -ne 0 ]; then
	successful="with issues!!!"
fi

printf "\nRestic backup script finished ${successful} TIME: $(date -R)\n" >> $RESTIC_BACKUP_LOG_FILE
osascript -e 'display notification "Finished '"$successful"'" with title "Restic" subtitle "Backup script"'

printf "\n=======================================================\n\n" >> $RESTIC_BACKUP_LOG_FILE

# todo: highest exit code among all 

exit 0
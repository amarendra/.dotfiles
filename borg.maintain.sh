#!/bin/bash
source $HOME/Dropbox/Config/git-ignored/borg/.borg.env

osascript -e 'display notification "Started." with title "Borg" subtitle "Maintenance script"'
printf "\nBorg maintenance script started. TIME: $(date -R)\n" >> $BORG_MAINT_LOG_FILE

borg prune --verbose --list --show-rc \
	--prefix ${BORG_LOCAL_HOSTNAME} \
    --keep-daily 7 \
    --keep-weekly 5 \
    --keep-monthly 12 \
    --keep-yearly 3 2>> $BORG_MAINT_LOG_FILE

prune_exit_code=$?
printf "\nprune finished with exit code ${prune_exit_code}\n" >> $BORG_MAINT_LOG_FILE

# reset borg repo env vars
export BORG_REPO=""
export BORG_PASSCOMMAND=""
export BORG_REMOTE_PATH=""
export BORG_LOCAL_HOSTNAME=""

successful="without any issues."

if [ $prune_exit_code -ne 0 ]; then
	successful="with issues!!!"
fi

printf "\nBorg maintenance script finished ${successful} TIME: $(date -R)" >> $BORG_MAINT_LOG_FILE
osascript -e 'display notification "Finished '"$successful"'" with title "Borg" subtitle "Maintenance script"'

printf "\n=======================================================\n\n" >> $BORG_MAINT_LOG_FILE

exit $prune_exit_code
#!/bin/bash
source $HOME/Dropbox/Config/git-ignored/borg/.borg.env

# just for reference this is how we init a repo
# borg init --encryption=MODE PATH

osascript -e 'display notification "Started." with title "Borg" subtitle "Backup script"'
printf "\nBorg backup script started. TIME: $(date -R)" >> $BORG_BCAKUP_LOG_FILE

borg create -x --verbose --progress --stats --show-rc \
	--filter AME \
	--compression auto,zstd,9 \
	--exclude-caches \
	--patterns-from $BORG_PATTERNS_FILE \
	::$BORG_LOCAL_HOSTNAME-$(date +"%d%m%Y%H%M") 2>> $BORG_BCAKUP_LOG_FILE

backup_exit_code=$?

# reset borg repo env vars
export BORG_REPO=""
export BORG_PASSCOMMAND=""
export BORG_REMOTE_PATH=""
export BORG_LOCAL_HOSTNAME=""

successful="without any issues."

if [ $backup_exit_code -ne 0 ]; then
	successful="with issues!!!"
fi

printf "\nBorg backup script finished ${successful} TIME: $(date -R)" >> $BORG_BCAKUP_LOG_FILE
osascript -e 'display notification "Finished '"$successful"'" with title "Borg" subtitle "Backup script"'

printf "\n=======================================================\n\n" >> $BORG_BCAKUP_LOG_FILE

exit $backup_exit_code
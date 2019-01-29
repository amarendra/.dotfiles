#!/bin/bash

source $HOME/Dropbox/Config/git-ignored/borg/.borg.env

# just for reference this is how we init a repo
# borg init --encryption=MODE PATH

printf "*** BORG BACKUP SCRIPT STARTED AT $(date -R)\n"

borg create	-x --verbose --progress --stats --show-rc \
	--filter AME \
	--compression auto,lzma,9 \
	--exclude-caches
	--exclude-from $BORG_EXCLUDE_FILE \
	--patterns-from $BORG_INCLUDE_FILE \
	$BORG_REPO::$BORG_LOCAL_HOSTNAME-$(date +"%d%m%y%H%M") >> $BORG_LOG_FILE

# reset bog repo env vars
$BORG_REPO=""
$BORG_PWD_FILE=""
$BORG_PASSCOMMAND=""

printf "\n*** BORG BACKUP SCRIPT FINISHED AT $(date -R)\n\n\n"

exit 0
	
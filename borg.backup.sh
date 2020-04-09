#!/bin/bash

source $HOME/Dropbox/Config/git-ignored/borg/.borg.env

# just for reference this is how we init a repo
# borg init --encryption=MODE PATH

printf "*** BORG BACKUP SCRIPT STARTED AT $(date -R)\n"

borg create -x --verbose --progress --stats --show-rc \
	--filter AME \
	--compression auto,zstd,9 \
	--exclude-caches \
	--patterns-from $BORG_PATTERNS_FILE \
	::$BORG_LOCAL_HOSTNAME-$(date +"%d%m%Y%H%M") >> $BORG_BCAKUP_LOG_FILE

# reset bog repo env vars
export BORG_REPO=""
export BORG_PASSCOMMAND=""
export BORG_REMOTE_PATH=""
export BORG_LOCAL_HOSTNAME=""

printf "\n*** BORG BACKUP SCRIPT FINISHED AT $(date -R)\n\n\n"

exit 0
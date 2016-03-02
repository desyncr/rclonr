#!/bin/bash
source ./rclonr.cfg

# Check internet connection before anything. See http://stackoverflow.com/a/932187
CONNECTION_OK=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null);
if ! $CONNECTION_OK; then
	exit 1
fi

# Iterate over PATHS to syncronize
for TARGET in $PATHS; do
	echo $RCLONE_PATH/rclone sync $BASE_PATH/$TARGET gdrive:$TARGET
done

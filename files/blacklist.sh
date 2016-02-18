#!/bin/bash
# DO NOT EDIT!
# This file is puppet generated.

PEER_KEY=$1
if /bin/grep -Fq $PEER_KEY /etc/fastd/blacklist.json; then
	exit 1
else
	exit 0
fi


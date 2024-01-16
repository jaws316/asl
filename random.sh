#!/bin/bash

# Witten By Tony Morris WRAW556 K1TNY
# GMRS Live  support@gmrslive.com
# 03/12/2023


# Just call the command from you node computer

# random.sh <directory> <node number> 1

# Directory can be any directory on the computer. ONLY have audio files in the directory
# The audio files must be anything Asterisk can play. Mix and match.

# File Name doesn't matter. 

# node is the node you want it to play on

# Placing a 1 at the end will play accross ANYTHING connected to you. Leaving the 1 off
# will play on THIS node only

# Example:  The command below will play a file randomly from the /var/lib/asterisk/sound/notices
#           directory on node 1234

#  random.sh /var/lib/asterisk/sound/notices 1234

# Make sure you give this script permissions to run

FILES=($1/*)
RANDOM_INDEX="$(($RANDOM % ${#FILES[@]}))"
echo ${FILES[$RANDOM_INDEX]%.*}

if [ -z "$3" ]
	then
		play="localplay"

	else
		if [ $3 -eq 1 ];then  play="playback"; fi

	fi

sudo asterisk -rx "rpt $play $2 ${FILES[$RANDOM_INDEX]%.*}"
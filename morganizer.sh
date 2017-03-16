#!/bin/bash

##########################################################################################
# Name: Massive Organizer
# Author: ArenGamerZ
# Email: arendevel@gmail.com
# Version: 2.0-stable
# Description: This script will order alphabetically all files and directorys in the
#              current directory.
#
# LICENSE: GNU GPL
##########################################################################################

# Only files starting with a letter will be kept on the list, also, removing this script from the list
ls -1 | grep '^[a-zA-Z]' | grep -v "$(echo "$0" | cut -c 3-)" | while read file;
do
	first_letter=$(echo "$file" | cut -c 1 | tr '[:lower:]' '[:upper:]')
	dir_w_belongs="-$first_letter-"
	if [ -d "./$dir_w_belongs" ]; then
		mv "./$file" "./$dir_w_belongs"
	elif [ ! -d "./$dir_w_belongs" ]; then
		mkdir "./$dir_w_belongs"
		mv "./$file" "./$dir_w_belongs"
	else
		echo "Something has gone wrong with file $file"
	fi
done

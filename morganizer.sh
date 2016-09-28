#!/bin/bash

##########################################################################################
# Name: Massive Organizer                                                                 
# Author: Aren <alex13gamerz@gmail.com>                                                   
# Version: 1.2                                                                            
# Description: This script will order alphabetically all files and directorys in the      
#              current directory.                                                          
#                                                                                         
# ATTENTION: Do not change the name to the script because otherwise the grep filter       
#            will not work properly and will cause the script to malfunction.      
#
# LICENSE: GNU GPL    
##########################################################################################

letters=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

# Create the dirs to be able to organize
 
for letter in ${letters[@]}
do
	if [ ! -d ./-$letter- ]; then
		mkdir ./-$letter-
	fi
done

# Move files to their respective directorys
ls -l --full-time | grep -iv "morganizer.sh" | sed '1d' |  sed 's/^.*.0.00 //' | grep -iv "\-[[:alpha:]]\-" | while read cfile
do
	case "$cfile" in
		[Aa]*) mv ./"$cfile" ./-A- ;;
		[Bb]*) mv ./"$cfile" ./-B- ;;
		[Cc]*) mv ./"$cfile" ./-C- ;;
		[Dd]*) mv ./"$cfile" ./-D- ;;
		[Ee]*) mv ./"$cfile" ./-E- ;;
		[Ff]*) mv ./"$cfile" ./-F- ;;
		[Gg]*) mv ./"$cfile" ./-G- ;;
		[Hh]*) mv ./"$cfile" ./-H- ;;
		[Ii]*) mv ./"$cfile" ./-I- ;;
		[Jj]*) mv ./"$cfile" ./-J- ;;
		[Kk]*) mv ./"$cfile" ./-K- ;;
		[Ll]*) mv ./"$cfile" ./-L- ;;
		[Mm]*) mv ./"$cfile" ./-M- ;;
		[Nn]*) mv ./"$cfile" ./-N- ;;
		[Oo]*) mv ./"$cfile" ./-O- ;;
		[Pp]*) mv ./"$cfile" ./-P- ;;
		[Qq]*) mv ./"$cfile" ./-Q- ;;
		[Rr]*) mv ./"$cfile" ./-R- ;;
		[Ss]*) mv ./"$cfile" ./-S- ;;
		[Tt]*) mv ./"$cfile" ./-T- ;;
		[Uu]*) mv ./"$cfile" ./-U- ;;
		[Vv]*) mv ./"$cfile" ./-V- ;;
		[Ww]*) mv ./"$cfile" ./-W- ;;
		[Xx]*) mv ./"$cfile" ./-X- ;;
		[Yy]*) mv ./"$cfile" ./-Y- ;;
		[Zz]*) mv ./"$cfile" ./-Z- ;;
		*) echo "File $cfile does not start with a letter, please change the name of the file."
	esac
done 

# Removing empty directorys created by this script
for letter in ${letters[@]}
do
	if ! find "./-$letter-" -mindepth 1 -print -quit | grep -q . ; then
		rm -rf "./-$letter-"	
	fi
done
	
exit 0

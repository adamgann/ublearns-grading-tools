#!/usr/bin/env bash
#
# Then unzip each student's submissions and place them in a folder with their username


# This is the unzipped folder downloaded from UB Learns. It contains zipped directories of 
# each students assignments . Edit this to the directory you choose. FIXME: User prompt?
SRC_DIR=/tmp/gradebook

# Change to the directory 
cd $SRC_DIR
pwd

# Get rid of the text files UB Learns spits out
#if [ -f *.txt ]; then
rm *.txt
#fi


# Store all filenames
ALL_FILES=*

num_files=0


# Unpack all student assignments
for f in $ALL_FILES 
do

	# Get the file extension
	file_extension="${f#*.}"
	
	# Get the UBIT name
	ubit_name="$(cut -d'_' -f2 <<<"$f")"
	
	# Unpack .zip with unzip
	if [ "$file_extension" == "zip" ]; then
		unzip "$f" -d $ubit_name >> /dev/null
	fi
	
	# Unpack .rar with unar
	if [ "$file_extension" == "rar" ]; then
		unar "$f" -o $ubit_name >> /dev/null
	fi
	
	# Incriment the file counter
	num_files=$((num_files+1))
	
	
done


echo "There are a total of $num_files student files"

unpacked_counter=0


for f in $ALL_FILES
do

	# $ALL_FILES now includes the unpacked directories so exlude those
	if [[ $f != *"Matlab"* ]]; then
		continue
	fi
	
	# Get the current name from our original list
	ubit_name="$(cut -d'_' -f2 <<<"$f")"
	echo -n $ubit_name
	
	
	# Search for that name over all unpacked directories
	status_string="Failure"
	for d in */ ; do
		dcut=${d::-1}
		if [ $dcut == $ubit_name ]; then
			status_string="Success"
			unpacked_counter=$((unpacked_counter+1))
		fi
	done 
	
	# Report the status 
	echo -e "  $status_string"
	
done

echo "There are a total of $unpacked_counter student directories correctly unpacked"


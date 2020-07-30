#!/bin/bash

# This script organizes my photos by titles. They have types that differentiate
# the output folders. Other images go to another folder called "others"
#
# Example type WP: WP_20160624_04_48_54_Pro.jpg
# Example type IM: IMG-20170421-WA0009.jpg
#
# Mateus Krause Jul 2020

input_folder="src/jpg"
output_folder="out"

for content in $(ls $input_folder)
do
	type=$(echo $content | head -c 2)
	
	if [ $type = "WP" ]
	then
		date=$(echo $content | cut -d "_" -f 2)
		year=$(echo $date | head -c 4)
		month=$(echo $date | head -c 6 | rev | head -c 2 | rev)
		mv $input_folder/$content $output_folder/$year/camera/$month/$content
	elif [ $type = "IM" ]
	then
		date=$(echo $content | cut -d "-" -f 2)
		year=$(echo $date | head -c 4)
		month=$(echo $date | head -c 6 | rev | head -c 2 | rev)
		mv $input_folder/$content $output_folder/$year/download/$month/$content	
	else
		mv $input_folder/$content $output_folder/others/$content
	fi
done

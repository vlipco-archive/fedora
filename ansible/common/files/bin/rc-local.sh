#!/usr/bin/zsh

run_boot_script() {
  echo "Executing $1"
  $1
}

for file in $(find /opt/rc.local -executable -type f); do
  run_boot_script $file
done

for file in $(find /srv/rc.local -executable -type f); do
  run_boot_script $file
done

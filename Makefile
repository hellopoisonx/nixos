clean:
	if [ -f flake.lock ]; then rm ./flake.lock; fi;

copy:
	cp -r `ls | grep -v 'flake.lock'` /etc/nixos	

switch: copy
	nixos-rebuild switch $(arguments)

boot: copy
	nixos-rebuild boot $(arguments)

reboot: boot
	reboot

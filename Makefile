clean:
	if [ -f flake.lock ]; then rm ./flake.lock; fi;
copy: clean
	cp -r * /etc/nixos	

switch: copy
	nixos-rebuild switch $(arguments)

boot: copy
	nixos-rebuild boot $(arguments)

reboot: boot
	reboot

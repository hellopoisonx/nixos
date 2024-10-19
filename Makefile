clean:
	if [ -f flake.lock ]; then rm ./flake.lock; fi;

update-flake:
	nix flake update

update: update-flake
	cp flake.lock /etc/nixos/flake.lock
	nixos-rebuild switch --upgrade $(arguments)

copy: update-flake
	rm -rf `find /etc/nixos/ | tail --lines=+2`
	cp -r `ls` /etc/nixos

switch: copy
	nixos-rebuild switch $(arguments)

boot: copy
	nixos-rebuild boot $(arguments)

reboot: boot
	reboot

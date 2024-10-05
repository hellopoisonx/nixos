copy:
	cp -r * /etc/nixos	

switch: copy
	nixos-rebuild switch

boot: copy
	nixos-rebuild boot

reboot: boot
	reboot

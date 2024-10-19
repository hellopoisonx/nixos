clean:
	if [ -f flake.lock ]; then rm ./flake.lock; fi;

update-flake:
	nix flake update

update: update-flake
	nixos-rebuild switch --upgrade --flake . $(arguments)

switch:
	nixos-rebuild switch  --flake . $(arguments)

boot:
	nixos-rebuild boot --flake . $(arguments)

reboot: boot
	reboot

update-flake:
	nix flake update ${arguments}

update: update-flake
	nixos-rebuild switch --upgrade --flake . $(arguments)

switch:
	nixos-rebuild switch  --flake . $(arguments)

boot:
	nixos-rebuild boot --flake . $(arguments)

reboot: boot
	reboot

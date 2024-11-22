update-flake:
	nix flake update ${arguments}

update:
	nixos-rebuild switch --upgrade --flake . $(arguments)

switch:
	nixos-rebuild switch  --flake . $(arguments)

boot:
	nixos-rebuild boot --flake . $(arguments)

reboot: boot
	reboot

update-flake:
	nix flake update ${args}

update:
	nixos-rebuild switch --upgrade --flake . $(args)

switch:
	nixos-rebuild switch --flake . $(args)

boot:
	nixos-rebuild boot --flake . $(args)

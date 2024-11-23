up:
    just -l

laptop-macos-work:
	darwin-rebuild switch --flake .

desktop-nixos-workstation: ## Run
	sudo nixos-rebuild switch --flake ".#desktop-nixos-workstation"

desktop-nixos-workstation-update: ## Update
	nix flake update
	sudo nixos-rebuild switch --flake ".#desktop-nixos-workstation"

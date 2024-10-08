##---------- Preliminaries ----------------------------------------------------
.POSIX:     # Get reliable POSIX behaviour
.SUFFIXES:  # Clear built-in inference rules

##---------- Variables --------------------------------------------------------
PREFIX = /usr/local  # Default installation directory

##---------- Build targets ----------------------------------------------------

help: ## Show this help message (default)
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: ## Build all the things

up: ## Run
	sudo nixos-rebuild switch --flake ".#default"

boot: ## Boot
	sudo nixos-rebuild boot --flake ".#default"

update: ## Update
	nix flake update
	sudo nixos-rebuild switch --flake ".#default"

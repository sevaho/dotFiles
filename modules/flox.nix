{ config, lib, pkgs, inputs, ... }: {
    nix.settings = {
        substituters = [ "https://cache.flox.dev" ];
        trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];
    };

    environment.systemPackages = with pkgs; [
        inputs.flox.packages.${system}.default
    ];
}

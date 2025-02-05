{ config, lib, pkgs, ... }: {
  networking = {
    hostName = "asicli"; # Define your hostname.
    dhcpcd.enable = false;

    interfaces = {
      br0 = {
        useDHCP = false;
        ipv4.addresses = [ {
            # address = "192.168.0.195";
            # prefixLength = 24;

            address = "192.168.68.100";
            prefixLength = 22;
        }];
      };
    };
    bridges = {
      "br0" = {
        interfaces = [ "enp70s0" ];
      };
    };
    # defaultGateway = "192.168.0.1";
    defaultGateway = "192.168.68.1";
    nameservers = [ "1.1.1.1" "9.9.9.9" ];

    firewall.allowedTCPPorts = [ 3389 8080 5000];

    firewall.extraCommands = ''
        ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
    '';

    firewall.interfaces."virbr1" = {
        allowedTCPPorts = [ 2049 ];
        allowedUDPPorts = [ 2049 ];
    };  
  };
}

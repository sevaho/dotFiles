{ config, lib, pkgs, ... }: {
  networking = {
    hosts = {
        # =============================================
        # WEGROUP GOOGLE DNS
        # =============================================
        "10.0.4.31" = [
            "vault.google.wegroup.be"
            "cd.google.wegroup.be"
        ];
        "10.0.0.14" = ["harbor.internal.google.wegroup.be"];
        "10.0.0.15" = ["drone.internal.google.wegroup.be"];
        "10.0.0.16" = [
            "search.internal.google.wegroup.be"
            "drone.internal.azure.wegroup.be"
        ];
        "10.0.0.17" = [
            "htmltopdf.internal.google.wegroup.be"
            "vault.internal.azure.wegroup.be"
        ];
        "10.0.0.18" = ["htmltopdf2.internal.google.wegroup.be"];
        "10.0.0.19" = ["house-property.internal.google.wegroup.be"];
        "10.0.0.20" = ["pypi.internal.google.wegroup.be"];
        "10.0.0.21" = ["dns.internal.google.wegroup.be"];
        "10.0.0.23" = ["dekra.internal.google.wegroup.be"];
        "10.25.0.2" = ["postgres.internal.google.wegroup.be"];

        # =============================================
        # WEGROUP AZURE DNS
        # =============================================
        "10.0.0.10" = ["pypi.azure.wegroup.be"];
        "10.0.0.22" = ["harbor.internal.azure.wegroup.be"];
        "10.0.8.4" = [
            "wg-production-dns-d2mgxi4q.b7aa91d2-13f4-4565-af1c-8da13b99964a.privatelink.francecentral.azmk8s.io"
        ];
        "10.0.4.10" = [
            "wg-staging-dns-y9liqo5l.9fae2481-40d0-4598-9155-9672978a28f7.privatelink.francecentral.azmk8s.io"
        ];
    };
    hostName = "asicli"; # Define your hostname.
    dhcpcd.enable = false;

    interfaces = {
      br0 = {
        useDHCP = false;
        ipv4.addresses = [ {
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

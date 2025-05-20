{ 
    age = {
        identityPaths = [ "/home/sevaho/.ssh/id_rsa" ];
        secrets = {
            secret1 = {
                file = ../secrets/secret1.age;
                owner = "sevaho";
                group = "users";
                mode = "0600";
            };
        };
    };
}

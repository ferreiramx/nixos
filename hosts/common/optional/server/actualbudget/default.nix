 { pkgs, ... }:
 {
   virtualisation.oci-containers.containers = {
     actualbudget = {
       image = "actualbudget/actual-server:latest";
       autoStart = true;
       ports = ["5006:5006"];
       volumes = [
         "/root/actualbudget/data:/root/actualbudget/data"
       ];
     };
   };
  
  services.nginx = {
    virtualHosts."actualbudget" = {
      serverName = "actual.proyectosatan.org";
      extraConfig = ''
        proxy_buffering off;
      '';
      # forceSSL = true;
      # enableACME = true;
      listen = [{port = 443;  addr="0.0.0.0"; ssl=false;}];
      locations."/" = {
        proxyPass = "http://[::1]:5006";
        # proxyWebsockets = true;
      };
    };
  };
 }
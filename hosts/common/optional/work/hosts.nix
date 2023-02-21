{
  sops.secrets.data-engineering-pem = {
    owner = "aferreira";
    path = "/etc/ssh/data-engineering.pem";
  };
  sops.secrets.devops-pem = {
    owner = "aferreira";
    path = "/etc/ssh/devops.pem";
  };
  networking.hosts = {
    "172.30.7.116" = [ "airbyte" ];
    "172.30.7.29" = [ "prefect" ];
    "172.30.0.13" = [ "streamlit" ];
    # "172.0.0.0" = [ "baserow" ];
  };
  programs.ssh.knownHosts = {
    airbyte = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMu+P2rEv6l32GuVz+fms2K8MSM91ucIVZ1dwaqzD39";
    };
    prefect = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJnwIfQ6u4h5TxoeeUchQli4gUuZavS+vybveux/3Nfe";
    };
    streamlit = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPVGWcK0xI/qqatViQije1tpal/R8HggWBFvAfCS6Lct";
    };
    # baserow = {
    #   publicKey = "";
    # };
  };
}

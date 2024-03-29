{ config, ... }:
{
  sops.defaultSopsFile = ../../secrets/cirrus/secrets.yaml;
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  sops.secrets = {
    "wg/oxalab-seckey" = {
      owner = config.users.users.systemd-network.name;
    };
    "wg/oxaproxy-seckey" = {
      owner = config.users.users.systemd-network.name;
    };
  };
}

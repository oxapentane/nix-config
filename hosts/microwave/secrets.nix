{ config, ... }:
{
  sops.defaultSopsFile = ../../secrets/microwave/secrets.yaml;
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
}

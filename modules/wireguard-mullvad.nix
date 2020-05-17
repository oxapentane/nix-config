{ config, ... }:

{
  networking.wg-quick.interfaces.mullvad-de4 = {
    address = [ "10.66.12.213/32" "fc00:bbbb:bbbb:bb01::3:cd4/128" ];
    dns = [ "193.138.218.74" ];
    privateKeyFile = "/etc/nixos/secrets/mullvad";
    peers = [
      {
        publicKey = "XTdlx3YmLb1vg1NsruXYmfzP6FZKmZR90Vr3u9kJ7S0=";
        allowedIPs = [ "0.0.0.0/0" "::0/0" ];
        endpoint = "185.213.155.130:51820";
      }
    ];
  };
}

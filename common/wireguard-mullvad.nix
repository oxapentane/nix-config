{ config, ... }:

{
  networking.wg-quick.interfaces.mullvad-de4 = {
    address = [ "10.64.218.48/32" "fc00:bbbb:bbbb:bb01::1:da2f/128" ];
    dns = [ "193.138.218.74" ];
    privateKeyFile = "/etc/nixos/secrets/mullvad";
    peers = [
      {
        publicKey = "vtqDtifokiHna0eBshGdJLedj/lzGW+iDvWKx+YjDFs=";
                  # "XTdlx3YmLb1vg1NsruXYmfzP6FZKmZR90Vr3u9kJ7S0=";
        allowedIPs = [ "0.0.0.0/0" "::0/0" ];
        endpoint = "193.27.14.98:51820";
      }
    ];
  };
}

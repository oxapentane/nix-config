{ config, ... }:

{
  networking.wg-quick.interfaces.mv-nl4 = {
    address = [ "10.64.36.83/32" "fc00:bbbb:bbbb:bb01::1:2452/128" ];
    dns = [ "193.138.218.74" ];
    privateKeyFile = "/etc/nixos/secrets/mv-nl4";
    peers = [
      {
        publicKey = "hnRyse6QxPPcZOoSwRsHUtK1W+APWXnIoaDTmH6JsHQ=";
        allowedIPs = [ "0.0.0.0/0" "::0/0" ];
        endpoint = "185.65.134.224:51820";
      }
    ];
  };
}

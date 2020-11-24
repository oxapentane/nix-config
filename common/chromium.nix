{config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (ungoogled-chromium.override { enableVaapi = true; })
  ];

  programs.chromium = {
    enable = true;
    # doesn't work with ungoogled chromium unfortunately...
    # extensions = [
    #   "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privacy badger
    #   "ekhagklcjbdpajgpjgmbionohlpdbjgc" # zotero connector
    #   "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    #   "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    # ];
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "TranslateEnabled" = false;
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "AutoplayAllowed" = false;
      "DefaultNotificationSetting" = 2;
      "BackgroundModeEnabled" = false;
    };
  };
}

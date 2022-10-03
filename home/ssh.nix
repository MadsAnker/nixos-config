{ pkgs, ... }: 

{
  programs.ssh = let
    username = "SDU\\madsn20";
    imada3 = "imada3.stud-srv.sdu.dk";
    sdulogon = "sdulogon";
  in
  {
    enable = true;
    matchBlocks = {
      # NOTE: Need to install pubkey for this to work. How?
      "${sdulogon}" = {
        hostname = "logon.sdu.dk";
        user = username;
      };
      "unilab" = {
        hostname = imada3;
        user = username;
        proxyJump = sdulogon;
      };
      # NOTE: VPN connection needed for this to work
      # The easiest way to do this is using openvpn-sso
      "unilabvpn" = {
        hostname = imada3;
        user = username;
      };
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.arcan.Xarcan;
  Xarcan = cfg.package;
in {
  options.arcan.Xarcan = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
          You do not need to enable this option if you have enabled a desktop manager or window manager that use Arcan.
        '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.Xarcan;
      description = ''
        '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [Xarcan];
  };
}

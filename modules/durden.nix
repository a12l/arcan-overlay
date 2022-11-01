{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.arcan.durden;
  durden = cfg.package;
in {
  options.arcan.durden = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.durden;
      description = ''
      '';
    };
  };

  config = mkIf cfg.enable {
    arcan.enable = true;
    arcan.Xarcan.enable = true;
  };
}

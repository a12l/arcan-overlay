{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.arcan.pipeworld;
  pipeworld = cfg.package;
in {
  options.arcan.pipeworld = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.pipeworld;
      description = ''
      '';
    };
  };

  config = mkIf cfg.enable {
    arcan.enable = true;
    arcan.Xarcan.enable = true;
  };
}

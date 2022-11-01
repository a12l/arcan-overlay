{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.arcan;
  arcan = cfg.package;
in {
  options.arcan = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.arcan-universe;
      description = ''
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [arcan];

    security.wrappers.arcan = {
      owner = "root";
      group = "root";
      source = "${arcan}/bin/arcan";
      setuid = true;
    };

    hardware.opengl.enable = true;

    boot = {
      kernelModules = with pkgs.linuxPackages; [
        "v4l2loopback"
      ];
      extraModulePackages = with config.boot.kernelPackages; [
        v4l2loopback
      ];
    };
  };
}

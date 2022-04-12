{
  lib,
  ...
}:

let
  findModules =
    /**
      Copied from divnix/digga/src/importers.nix, and changed by Albin "a12l" Otterhäll.

      Synopsis: findModules _path_

      Recursively collect the nix files of _path_ into a list.

      Output Format:
      A list of paths to where all `.nix` files and directories with `default.nix` is located.

      Example file structure:
      ```
      ./arcan.nix
      ./foo/bar.nix
      ./durden.nix
      ./pipeworld.nix
      ./Xarcan.nix
      ```

      Example output:
      ```
      [
        ./arcan.nix
        ./foo/bar.nix
        ./durden.nix
        ./pipeworld.nix
        ./Xarcan.nix
      ]
      ```
      **/
    dirPath:
    let
      seive = file: type:
        # Only rake `.nix` files or directories
        (type == "regular" && lib.hasSuffix ".nix" file) || (type == "directory");

      collect = file: type: {
        value =
          let
            path = dirPath + "/${file}";
          in
            if (type == "regular") || (type == "directory" && builtins.pathExists (path + "/default.nix"))
            then path
              # recurse on directories that don't contain a `default.nix`
            else findModules path;
      };

      files = lib.filterAttrs seive (builtins.readDir dirPath);
      
      arcanModules = lib.filterAttrs (n: v: v != { }) (lib.mapAttrs collect files);
    in
      lib.attrsets.attrValues arcanModules;
in
{
  imports = findModules ./.;
  # [
  #   ./arcan.nix
  #   ./durden.nix
  #   ./pipeworld.nix
  #   ./Xarcan.nix
  # ];
}

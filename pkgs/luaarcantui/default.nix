{ stdenv
, luajit
, fetchFromGitHub
, meson
, pkg-config
, arcan
, lua5_1
, ninja
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "luaarcantui";
  version = "1.0.0+unstable=2022-10-23";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = "tui-bindings";
    rev = "322a852c68a606d916a7aeb2b4142d6e91935503";
    sha256 = "sha256-bSnzsCuvNBFrnnPNNQRyUgJ4YZYAthN+MjGnZK8Lg/U=";
  };

  sourceRoot = "${finalAttrs.src.name}/lua";

  nativeBuildInputs = [
    meson
    pkg-config
    ninja
  ];

  buildInputs = [
    arcan
    lua5_1
  ];

  meta = {
    homepage = "https://github.com/letoram/tui-bindings";
    description = "luaarcantui is a text UI library for the Arcan Desktop Engine";
    license.fullName = "BSD-3-clause";
  };
})

{ stdenv
, fetchurl
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
  version = "0.0.0+unstable=2022-10-23";

  src = fetchFromGitHub {
    owner = "a12l";
    repo = "tui-bindings";
    rev = "2c0d9767b4128308c0417427eda3ca3eaa6a834f";
    sha256 = "1cm9v5pwxznr5wssbsl0z8fckzhh4zay36hshihqy6030vpb2hgw";
  };

  # postUnpack = ''
  #   pushd $sourceRoot/lua/
  # '';

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

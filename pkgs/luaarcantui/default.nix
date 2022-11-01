{ stdenv
, fetchurl
, luajit
}:

stdenv.mkDerivation {
  pname = "luaarcantui";
  version = "0.0.0+unstable=2022-10-23";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = "tui-bindings";
    rev = "6cd098a5a2a696b2116eec937b8a9910f8f62c61";
    sha256 = "0hs9zmb28m6dm89wa80fd1f7yfykwmikmbz8yfwzgxy784f6b1a2";
  };

  postUnpack = ''
    pushd $sourceRoot/lua/
  '';

  nativeBuildInputs = [
    meson
    pkg-config
  ];

  meta = {
    homepage = "https://github.com/letoram/tui-bindings";
    description = "luaarcantui is a text UI library for the Arcan Desktop Engine";
    license.fullName = "BSD-3-clause";
  };
}

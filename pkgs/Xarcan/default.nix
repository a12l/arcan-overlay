{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  pkg-config,
  xorgproto,
  xtrans,
  libxshmfence,
  pixman,
  xkbcomp,
  libxkbfile,
  libXfont2,
  dbus,
  systemd,
  fontutil,
  mesa,
  epoxy,
  libmd,
  nettle,
  libgcrypt,
  openssl,
  libXdmcp,
  libdrm,
  libselinux,
  audit,
  libGL,
  libtirpc,
  libXau,
  arcan,
  libxcb,
  ninja,
  libX11,
  xcbutil,
  xcbutilwm,
}:
stdenv.mkDerivation rec {
  pname = "xarcan";
  version = "0.6.1+unstable=2022-06-14";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "02111f4925453c0c545e9193c6a5e22c0d4e98c3";
    sha256 = "06c8gcvm0rprdsm7bjbfir0wcx5zzz5px69agxfydl7g2qssr7df";
  };

  nativeBuildInputs = [meson pkg-config];

  buildInputs = [
    xorgproto
    xtrans
    libxshmfence
    pixman
    xkbcomp
    libxkbfile
    libXfont2
    dbus
    systemd
    fontutil
    mesa
    epoxy
    libmd
    nettle
    libgcrypt
    openssl
    libXdmcp
    libdrm
    libselinux
    audit
    libGL
    libtirpc
    libXau
    arcan
    libxcb
    ninja
    libX11
    xcbutil
    xcbutilwm
  ];

  meta = with lib; {
    description = "Patched Xserver that bridges connections to Arcan";
    homepage = "https://github.com/letoram/letoram";
    changelog = "https://github.com/letoram/letoram/releases/tag/${version}";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [a12l];
  };
}

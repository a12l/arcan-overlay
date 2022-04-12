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
  arcan-unwrapped,
  libxcb,
  ninja,
  libX11,
  xcbutil,
  xcbutilwm,
}:
stdenv.mkDerivation rec {
  pname = "xarcan";
  version = "0.6.0+unstable=2021-08-26";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "e40f0176e495ffdad6e7405c58378df6532eb70d";
    sha256 = "sha256:103wvkjxbpw98qcgwyrsq5kizs6lvkjyimi7g7j30cgrncpnivag";
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
    arcan-unwrapped
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

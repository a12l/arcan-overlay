{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xz, libuvc, libffi, libX11
, libxcb, libXcomposite, libXfixes, xcbutil, xcbutilwm, libXau, libXdmcp, openal
, freetype, sqlite, libGL, libdrm, libxkbcommon, mesa, valgrind, luajit, libusb1
, harfbuzzFull, SDL2, withVLC ? true, libvlc, withFFmpeg ? true, ffmpeg-full
, withWayland ? true, wayland, wayland-protocols, withEspeak ? true
, espeak-classic, withLibmagic ? true, file, withTesseract ? true, tesseract
, withLeptonica ? true, leptonica, withVNC ? true, libvncserver
, debugging ? false }:

let
  srcs = {
    arcan = fetchFromGitHub {
      owner = "letoram";
      repo = "arcan";
      rev = "0145a79c26600b69114092d1d2c7c6d3cf027d6a";
      sha256 = lib.fakeSha256;
    };

    openal = fetchFromGitHub {
      owner = "letoram";
      repo = "openal";
      rev = "1c7302c580964fee9ee9e1d89ff56d24f934bdef";
      sha256 = "sha256-InqU59J0zvwJ20a7KU54xTM7d76VoOlFbtj7KbFlnTU=";
    };
  };
in stdenv.mkDerivation rec {
  pname = "arcan";
  version = "0.6.1+unstable=2022-02-16";

  src = srcs.arcan;

  postUnpack = ''
    mkdir --parents $sourceRoot/external/git/openal
    pushd $sourceRoot/external/git/
    cp --recursive ${srcs.openal}/* openal/
    chmod --recursive 777 openal/
    popd
  '';

  postPatch = ''
    substituteInPlace ./src/platform/posix/paths.c \
    	--replace "/usr/bin" "$out/bin" \
    	--replace "/usr/share" "$out/share"

    substituteInPlace ./src/CMakeLists.txt \
    	--replace "SETUID" "# SETUID"
  '';

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [
    openal
    freetype
    sqlite
    libuvc
    libGL
    SDL2
    libdrm
    libxkbcommon
    mesa
    valgrind
    luajit
    libusb1
    libvlc
    xz
    libffi
    libX11
    libxcb
    libXcomposite
    libXfixes
    xcbutil
    xcbutilwm
    libXau
    libXdmcp
    harfbuzzFull
  ] ++ lib.optionals withFFmpeg [ ffmpeg-full ]
    ++ lib.optionals withWayland [ wayland wayland-protocols ]
    ++ lib.optionals withEspeak [ espeak-classic ]
    ++ lib.optionals withLibmagic [ file ]
    ++ lib.optionals withTesseract [ tesseract ]
    ++ lib.optionals withLeptonica [ leptonica ]
    ++ lib.optionals withVNC [ libvncserver ];

  cmakeFlags = [
    "-DBUILD_PRESET=everything"
    "-DISTR_TAG=Nix"
    "-DENGINE_BUILDTAG=${version}"
    "../src"
  ] ++ lib.optionals debugging [ "-DCMAKE_BUILD_TYPE=Debug" ];

  hardeningDisable = [ "format" ] ++ lib.optionals debugging [ "fortify" ];

  meta = with lib; {
    description = "Scriptable Multimedia Engine";
    longDescription = ''
      Arcan  is a portable and fast self-sufficient multimedia engine for
      advanced visualization and analysis work in a wide range of applications
      e.g. game development, real-time streaming video,  monitoring  and
      surveillance, up to and including desktop compositors and window managers.
    '';
    homepage = "https://github.com/letoram/arcan";
    changelog = "https://github.com/letoram/arcan/releases/tag/${version}";
    license = with licenses; [ gpl2Plus lgpl2Plus bsd3 ];
    platforms = platforms.all;
    maintainers = with maintainers; [ a12l ];
  };
}

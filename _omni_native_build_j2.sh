#!/usr/bin/env bash
# Native macOS build of pokeheartgold using wine-crossover (32-bit-capable wine).
set -uo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO"
BREW=/opt/homebrew

echo "===== PATH: GNU tools + wine shims ====="
SHIMDIR="$HOME/.omni_winebin"
export PATH="$BREW/opt/coreutils/libexec/gnubin:$BREW/opt/gnu-sed/libexec/gnubin:$BREW/opt/make/libexec/gnubin:$SHIMDIR:$BREW/bin:$PATH"
export PATH="$PATH:$HOME/toolchains/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin"

echo "===== wine shims (wine/winepath -> GPTK wine64) ====="
command -v wine64 >/dev/null || { echo "FATAL: wine64 (game-porting-toolkit) not found"; exit 1; }
mkdir -p "$SHIMDIR"
printf '#!/bin/bash\nexec wine64 "$@"\n'          > "$SHIMDIR/wine"
printf '#!/bin/bash\nexec wine64 winepath "$@"\n' > "$SHIMDIR/winepath"
chmod +x "$SHIMDIR/wine" "$SHIMDIR/winepath"
echo "wine=$(command -v wine) winepath=$(command -v winepath) gsed=$(command -v gsed) grealpath=$(command -v grealpath) gmktemp=$(command -v gmktemp) make=$(command -v make)"

echo "===== wine env + init ====="
export WINEPREFIX="$HOME/.wine_pokehg"
export WINEDEBUG=-all
export WINEDLLOVERRIDES="mscoree,mshtml="
export LM_LICENSE_FILE="$REPO/tools/mwccarm/license.dat"
mkdir -p "$WINEPREFIX"
wine --version
wine64 wineboot --init >/dev/null 2>&1 || true
echo "winepath check: $(winepath -w "$REPO" 2>/dev/null)"

echo "===== extract Nitro SDK 4.2 -> tools/bin ====="
cd "$REPO/tools"
if [ ! -f bin/makelcf.exe ] || [ ! -f bin/makerom.exe ]; then
  rm -rf _nitrosdk
  7zz x -y -o_nitrosdk NitroSDK-4_2-071210-jp.7z >/dev/null
  MAKELCF=$(find _nitrosdk -iname makelcf.exe | head -1)
  [ -n "$MAKELCF" ] || { echo "FATAL: makelcf.exe not found"; exit 1; }
  SDKBIN=$(dirname "$MAKELCF")
  echo "SDK bin dir: $SDKBIN"
  mkdir -p bin; cp -R "$SDKBIN"/. bin/
fi
echo "tools/bin (first 8):"; ls bin | head -8

echo "===== copy .lcf templates ====="
cd "$REPO"
mkdir -p sub
find tools/_nitrosdk -name 'ARM7-TS.lcf.template'      -exec cp -f {} sub/ \;
find tools/_nitrosdk -name 'ARM9-TS.lcf.template'      -exec cp -f {} ./  \;
find tools/_nitrosdk -name 'mwldarm.response.template' -exec cp -f {} ./  \;
ls -la ARM9-TS.lcf.template mwldarm.response.template sub/ARM7-TS.lcf.template || { echo "FATAL: templates missing"; exit 1; }

echo "===== mwccarm smoke test (does wine run the 32-bit compiler?) ====="
wine tools/mwccarm/2.0/sp2p2/mwccarm.exe -version 2>&1 | tail -4 || true

echo "===== make (COMPARE=0, native wine) ====="; date
make -j2 COMPARE=0 > _omni_native_build.log 2>&1
EXIT=$?
echo "MAKE EXIT=$EXIT"; date
echo "----- last 30 lines -----"; tail -30 _omni_native_build.log
echo "----- resulting .nds -----"; find . -maxdepth 3 -name '*.nds' -exec ls -lh {} \;
exit $EXIT

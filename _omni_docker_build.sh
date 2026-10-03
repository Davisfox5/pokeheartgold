#!/usr/bin/env bash
# Runs INSIDE the pokehg-build container. Repo is mounted at /work.
set -uo pipefail
REPO=/work
cd "$REPO"

echo "===== [1/4] Extract Nitro SDK 4.2 -> tools/bin ====="
cd "$REPO/tools"
if [ ! -f bin/makelcf.exe ] || [ ! -f bin/makerom.exe ]; then
  rm -rf _nitrosdk
  7z x -y -o_nitrosdk NitroSDK-4_2-071210-jp.7z >/dev/null
  MAKELCF=$(find _nitrosdk -iname makelcf.exe | head -1)
  if [ -z "$MAKELCF" ]; then echo "FATAL: makelcf.exe not found in SDK"; exit 1; fi
  SDKBIN=$(dirname "$MAKELCF")
  echo "SDK bin dir: $SDKBIN"
  mkdir -p bin
  cp -r "$SDKBIN"/. bin/
fi
echo "tools/bin (first 10):"; ls bin | head

echo "===== [2/4] Copy .lcf specfile templates ====="
cd "$REPO"
mkdir -p sub
find tools/_nitrosdk -name 'ARM7-TS.lcf.template'        -exec cp -f {} sub/ \;
find tools/_nitrosdk -name 'ARM9-TS.lcf.template'        -exec cp -f {} ./  \;
find tools/_nitrosdk -name 'mwldarm.response.template'   -exec cp -f {} ./  \;
ls -la ARM9-TS.lcf.template mwldarm.response.template sub/ARM7-TS.lcf.template || { echo "FATAL: templates missing"; exit 1; }

echo "===== [3/4] Init wine ====="
export WINEDEBUG=-all
export WINEPREFIX=/root/.wine
export LM_LICENSE_FILE="$REPO/tools/mwccarm/license.dat"
export DISPLAY=
wineboot --init >/dev/null 2>&1 || true

echo "===== [4/4] make (this is the slow part: wine under emulation) ====="
date
make -j"$(nproc)" > _omni_build.log 2>&1
EXIT=$?
echo "MAKE EXIT=$EXIT"
date
echo "----- last 30 lines of build log -----"
tail -30 _omni_build.log
echo "----- resulting .nds -----"
find . -maxdepth 3 -name '*.nds' -exec ls -lh {} \;
exit $EXIT

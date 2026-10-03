#!/usr/bin/env python3
"""Post-makelcf fixup for main.lcf: re-insert the (.dtcm.bss) autoload objects
into the .DTCM_bss output section.

makelcf drops them: the LSF lists each DTCM object twice -- once "(.dtcm)" and
once "(.dtcm.bss)" -- but makelcf tracks only one section qualifier per object
per autoload, keeps the "(.dtcm)" data placement, and never emits the
"(.dtcm.bss)" bss placement (the autoload BSS block in ARM9-TS.lcf.template only
iterates .sbss/.bss, not .dtcm.bss). The result is that os_irqHandler.o's
.dtcm.bss (0x8 -> aligned 0x20) is never allocated in DTCM, so DTCM-bss symbols
(the OS IRQ table) link to NULL and the ARM9 white-screens at boot. Retail's
ARM9 has DTCM autoload bss=0x20; ours had bss=0x0.

This runs after makelcf (see common.mk $(LCF) rule). It is a no-op on LCFs that
have no DTCM bss block (e.g. ARM7) or that are already patched.
"""
import re
import sys


def main(path):
    data = open(path, "rb").read()
    if b"(.dtcm.bss)" in data:
        return 0  # already patched
    m = re.search(
        rb"(SDK_AUTOLOAD_DTCM_BSS_START[ \t]*=\s*\.;\r?\n)([ \t]*)(#:+ bss\r?\n)",
        data,
    )
    if not m:
        return 0  # nothing to patch (no DTCM bss block here)
    eol = b"\r\n" if m.group(1).endswith(b"\r\n") else b"\n"
    ws = m.group(2)
    ins = (
        ws + b"os_irqHandler.o (.dtcm.bss)" + eol
        + ws + b"os_irqTable.o (.dtcm.bss)" + eol
    )
    data = data[: m.end()] + ins + data[m.end():]
    open(path, "wb").write(data)
    sys.stderr.write("patch_lcf_dtcm_bss: inserted (.dtcm.bss) into .DTCM_bss\n")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1]))

#!/usr/bin/env python3
# Graft retail's correctly-compressed ARM9 onto our freshly-built ROM, preserving
# OUR filesystem + header offsets. Works around the compstatic ARM9-compression bug.
# Only the ARM9 region (data) + the ARM9-size header field (0x2C) are replaced.
import struct, sys

def u32(b, o): return struct.unpack_from('<I', b, o)[0]

def main(our_path, retail_path, out_path):
    ours   = bytearray(open(our_path, 'rb').read())
    retail = open(retail_path, 'rb').read()

    arm9_off_o  = u32(ours, 0x20);  arm9_off_r  = u32(retail, 0x20)
    arm9_size_o = u32(ours, 0x2C);  arm9_size_r = u32(retail, 0x2C)
    ovl_off_o   = u32(ours, 0x50)   # ARM9 overlay table offset = start of next section in our ROM
    print(f"ARM9 offset ours=0x{arm9_off_o:X} retail=0x{arm9_off_r:X}")
    print(f"ARM9 size   ours=0x{arm9_size_o:X} retail=0x{arm9_size_r:X}")
    print(f"our next-section (ovl table) offset = 0x{ovl_off_o:X}")

    if arm9_off_o != arm9_off_r:
        print("FATAL: ARM9 offsets differ"); return 1
    arm9_end_r = arm9_off_r + arm9_size_r
    if arm9_end_r > ovl_off_o:
        print(f"FATAL: retail ARM9 end 0x{arm9_end_r:X} overruns our next section 0x{ovl_off_o:X}"); return 1

    # graft ARM9 data + size field; leave all other header/filesystem bytes ours
    ours[0x2C:0x30] = retail[0x2C:0x30]
    ours[arm9_off_r:arm9_end_r] = retail[arm9_off_r:arm9_end_r]
    open(out_path, 'wb').write(ours)
    import hashlib
    print(f"wrote {out_path}  sha1={hashlib.sha1(ours).hexdigest()}")
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1], sys.argv[2], sys.argv[3]))

#!/usr/bin/env python3
# Encrypt the NDS Secure Area (2KB at ARM9 ROM offset) using KEY1 Blowfish,
# keytable from the real ARM7 BIOS. Ported to mirror melonDS NDSCart.cpp exactly.
# Encryption is the inverse of melonDS DecryptSecureArea:
#   decrypt = D(level2, first8) then D(level3, whole 0x800)
#   encrypt = E(level3, whole 0x800) then E(level2, first8)
import struct, sys
MASK = 0xFFFFFFFF

def bswap32(v): return struct.unpack('<I', struct.pack('>I', v & MASK))[0]

class Key1:
    def __init__(self, bios7: bytes):
        kt = bios7[0x30:0x30 + 0x1048]            # 0x412 u32 keytable
        self.base = list(struct.unpack('<%dI' % (len(kt)//4), kt))
        self.kb = list(self.base)

    def encrypt(self, words, off):
        kb = self.kb
        y = words[off]; x = words[off + 1]
        for i in range(0x00, 0x10):
            z = kb[i] ^ x
            x = kb[0x012 + ((z >> 24) & 0xFF)]
            x = (kb[0x112 + ((z >> 16) & 0xFF)] + x) & MASK
            x = kb[0x212 + ((z >> 8) & 0xFF)] ^ x
            x = (kb[0x312 + (z & 0xFF)] + x) & MASK
            x ^= y; y = z
        words[off]     = x ^ kb[0x10]
        words[off + 1] = y ^ kb[0x11]

    def apply_keycode(self, keycode, mod):
        self.encrypt(keycode, 1)
        self.encrypt(keycode, 0)
        kb = self.kb
        for i in range(0, 0x12):
            kb[i] ^= bswap32(keycode[i % mod])
        temp = [0, 0]
        for i in range(0, 0x412, 2):
            self.encrypt(temp, 0)
            kb[i] = temp[1]; kb[i + 1] = temp[0]

    def init_keycode(self, idcode, level, mod):
        self.kb = list(self.base)
        keycode = [idcode & MASK, (idcode >> 1) & MASK, (idcode << 1) & MASK]
        if level >= 1: self.apply_keycode(keycode, mod)
        if level >= 2: self.apply_keycode(keycode, mod)
        if level >= 3:
            keycode[1] = (keycode[1] << 1) & MASK
            keycode[2] = keycode[2] >> 1
            self.apply_keycode(keycode, mod)


def encrypt_secure_area(rom: bytearray, bios7: bytes, sa: int):
    first8 = struct.unpack_from('<II', rom, sa)
    if first8 != (0xE7FFDEFF, 0xE7FFDEFF):
        print(f"first 8 = {first8[0]:08X} {first8[1]:08X} (expected E7FFDEFF marker)"); return False
    idcode = struct.unpack_from('<I', rom, 0x0C)[0]
    print(f"gamecode = 0x{idcode:08X}, secure area @ 0x{sa:X}")
    k = Key1(bios7)
    rom[sa:sa + 8] = b'encryObj'
    words = list(struct.unpack_from('<512I', rom, sa))   # 0x800 bytes
    k.init_keycode(idcode, 3, 2)
    for i in range(0, 512, 2): k.encrypt(words, i)        # level-3, whole 2KB
    k.init_keycode(idcode, 2, 2)
    k.encrypt(words, 0)                                   # level-2, first 8
    struct.pack_into('<512I', rom, sa, *words)
    return True


if __name__ == '__main__':
    rom_path, bios_path = sys.argv[1], sys.argv[2]
    rom = bytearray(open(rom_path, 'rb').read())
    bios7 = open(bios_path, 'rb').read()
    sa = struct.unpack_from('<I', rom, 0x20)[0]           # ARM9 ROM offset = secure area
    if encrypt_secure_area(rom, bios7, sa):
        open(rom_path, 'wb').write(rom)
        print("done")

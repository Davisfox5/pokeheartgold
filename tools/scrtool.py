#!/usr/bin/env python3
# Headless HGSS field-script (scr_seq) disassembler.
# Parses asm/macros/script.inc to learn every command's opcode + arg layout,
# then decodes a scr_seq .bin into a readable .s using those same macro names.
# Authoring: edit the .s and let the decomp build (mwasmarm + script.inc) reassemble it.
import sys, re, struct, os

SCRDEF_END = 0xFD13
SIZES = {'.byte': 1, '.short': 2, '.hword': 2, '.word': 4, '.long': 4}

def parse_script_inc(path):
    """Return {opcode: (name, [arg_sizes])} and ordered macro arg names."""
    text = open(path).read()
    cmds = {}                 # opcode -> (name, [sizes], [argnames])
    # split into .macro ... .endm blocks
    for m in re.finditer(r'^\s*\.macro\s+(\w+)([^\n]*)\n(.*?)^\s*\.endm', text, re.M | re.S):
        name, argline, body = m.group(1), m.group(2), m.group(3)
        argnames = [a.strip() for a in argline.replace(',', ' ').split()]
        # gather directive lines in order
        dirs = []
        for line in body.splitlines():
            line = line.split(';')[0].strip()        # strip comments
            mm = re.match(r'(\.\w+)\s+(.*)$', line)
            if mm and mm.group(1) in SIZES:
                dirs.append((mm.group(1), mm.group(2).strip()))
        if not dirs:
            continue
        # first .short with a literal numeric/constant value = opcode
        op = None; opidx = None
        for i, (d, val) in enumerate(dirs):
            if d in ('.short', '.hword'):
                op = val; opidx = i; break
        if op is None:
            continue
        # opcode must be a constant (number) for a real command (skip scrdef etc.)
        try:
            opcode = int(op, 0)
        except ValueError:
            continue
        # remaining directives after the opcode = argument layout
        sizes = [SIZES[d] for d, _ in dirs[opidx + 1:]]
        cmds[opcode] = (name, sizes, argnames)
    return cmds

def disassemble(binpath, cmds):
    data = open(binpath, 'rb').read()
    out = []
    # ---- header: scrdef relative pointers until SCRDEF_END ----
    starts = []
    pos = 0
    while pos + 2 <= len(data):
        if struct.unpack_from('<H', data, pos)[0] == SCRDEF_END:
            hdr_end = pos + 2
            break
        rel = struct.unpack_from('<i', data, pos)[0]
        target = pos + 4 + rel            # scrdef: offset - . - 4  => target = pos+4+rel
        starts.append((len(starts), target))
        pos += 4
    else:
        hdr_end = pos
    out.append(f"; {os.path.basename(binpath)}  ({len(starts)} script(s), {len(data)} bytes)")
    for idx, tgt in starts:
        out.append(f";   script {idx} -> 0x{tgt:X}")
    out.append("")
    # ---- decode each script ----
    decoded = set()
    for idx, start in starts:
        if start in decoded:
            out.append(f"_script_{idx}:  ; (shared, see above)"); continue
        decoded.add(start)
        out.append(f"_script_{idx}:  ; offset 0x{start:X}")
        p = start
        steps = 0
        while 0 <= p < len(data) and steps < 100000:
            steps += 1
            opcode = struct.unpack_from('<H', data, p)[0]
            p += 2
            if opcode not in cmds:
                out.append(f"\t.short 0x{opcode:04X}  ; UNKNOWN opcode"); break
            name, sizes, argnames = cmds[opcode]
            args = []
            for s in sizes:
                if s == 1: v = data[p]
                elif s == 2: v = struct.unpack_from('<H', data, p)[0]
                else: v = struct.unpack_from('<I', data, p)[0]
                args.append(v); p += s
            argstr = ', '.join(hex(a) for a in args)
            out.append(f"\t{name}{(' ' + argstr) if args else ''}")
            if name in ('end', 'return'):       # terminators
                break
    return '\n'.join(out)

if __name__ == '__main__':
    inc = os.path.join(os.path.dirname(__file__), '..', 'asm', 'macros', 'script.inc')
    cmds = parse_script_inc(inc)
    if len(sys.argv) > 1 and sys.argv[1] == '--list':
        print(f"parsed {len(cmds)} commands")
        for op in sorted(cmds)[:int(sys.argv[2]) if len(sys.argv) > 2 else 30]:
            n, s, a = cmds[op]; print(f"  0x{op:03X} {n}  args={s}")
    else:
        print(disassemble(sys.argv[1], cmds))

#!/usr/bin/env python3
"""Build repton.html from repton2.asm (Superior Software's Repton 2 BBC disassembly).

Parses the py8dis-style disassembly into a 64K memory image using the
address tags in each line's trailing comment, slices out the game's data
tables, decodes/verifies the 16 levels, and injects everything into
repton-template.html to produce the single-page repton.html.
"""
import base64
import json
import re
import sys

ASM = "repton2.asm"
TEMPLATE = "repton-template.html"
OUT = "repton.html"

# ---------------------------------------------------------------- parser

sym = {}
mem = {}  # addr -> byte

addr_re = re.compile(r"//\s*([0-9a-f]{4}):")
equ_re = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)\s*=\s*\$([0-9a-fA-F]+)")
byt_re = re.compile(r"^\s*\.byt\s+(.*?)\s*(?://|$)")

def eval_expr(expr):
    expr = expr.strip()
    m = re.match(r"^([<>])\(?([A-Za-z_][A-Za-z0-9_]*)\)?$", expr)
    if m:
        v = sym[m.group(2)]
        return (v & 0xFF) if m.group(1) == "<" else (v >> 8)
    if expr.startswith("$"):
        return int(expr[1:], 16)
    if expr.startswith("%"):
        return int(expr[1:], 2)
    if expr.startswith("'") and expr.endswith("'") and len(expr) == 3:
        return ord(expr[1])
    return int(expr, 10)

def parse_byt(body):
    """Parse the RHS of a .byt directive into a list of byte values."""
    out = []
    i = 0
    while i < len(body):
        c = body[i]
        if c in " \t":
            i += 1
            continue
        if c == ';':
            break
        if c == '"':
            j = body.index('"', i + 1)
            out.extend(body[i + 1:j].encode("latin1"))
            i = j + 1
            continue
        # read one expression up to comma / semicolon / end
        j = i
        depth = 0
        while j < len(body):
            if body[j] == '(':
                depth += 1
            elif body[j] == ')':
                depth -= 1
            elif body[j] in ",;" and depth == 0:
                break
            j += 1
        out.append(eval_expr(body[i:j]) & 0xFF)
        if body[j:j + 1] == ";":
            break
        i = j + 1
    return out

with open(ASM, "r", encoding="utf-8") as f:
    lines = f.readlines()

# pass 1: equates
for ln in lines:
    m = equ_re.match(ln)
    if m:
        sym[m.group(1)] = int(m.group(2), 16)

# pass 2: .byt data with address tags
n_data_lines = 0
for ln in lines:
    bm = byt_re.match(ln)
    if not bm:
        continue
    am = addr_re.search(ln)
    if not am:
        continue
    addr = int(am.group(1), 16)
    for b in parse_byt(bm.group(1)):
        mem[addr] = b
        addr += 1
    n_data_lines += 1

# pass 3: instruction bytes from trailing comments (fills embedded code in data areas)
ins_re = re.compile(r"//\s*([0-9a-f]{4}):((?:\s*[0-9a-f]{2}){1,3})\s")
n_ins = 0
for ln in lines:
    if byt_re.match(ln):
        continue
    m = ins_re.search(ln)
    if not m:
        continue
    addr = int(m.group(1), 16)
    for h in m.group(2).split():
        mem.setdefault(addr, int(h, 16))
        addr += 1
        n_ins += 1

def rng(addr, n, what):
    vals = [mem.get(a, -1) for a in range(addr, addr + n)]
    if any(b < 0 for b in vals):
        bad = addr + next(i for i, b in enumerate(vals) if b < 0)
        raise SystemExit(f"HOLE in memory image for {what} at ${bad:04x}")
    return bytes(vals)

def b64(bs):
    return base64.b64encode(bs).decode("ascii")

print(f"symbols: {len(sym)}, data lines: {n_data_lines}, image bytes: {len(mem)}")

# ---------------------------------------------------------------- slices

S = {}
S["gfx"]          = rng(0x2F40, 0x4200 - 0x2F40, "graphics block")  # tiles+sprites+font, tile N at N*8
S["tilemap"]      = rng(0x2AA0, 16 * 0x4A, "object tilemap")     # objects 0..0x49
S["levelidx"]     = rng(0x2800, 64, "level strip indices")
S["levelstrips"]  = rng(0x4200, 0x1E00, "level strips")
S["transporters"] = rng(0x2840, 64 * 6, "transporters")
S["puzzle"]       = rng(0x29F8, 42 * 4, "puzzle pieces")
S["music2"]       = rng(0x0D80, 128, "music channel 2")
S["music3"]       = rng(0x0ED8, 128, "music channel 3")
S["banner"]       = rng(0x2233, 160, "banner")
S["curvedness"]   = rng(0x0E2E, 32, "curvedness")
S["spritesize"]   = rng(0x0E4A, 31, "sprite sizes")
S["spriteaddrlo"] = rng(0x0E69, 31, "sprite addr lo")
S["spriteaddrhi"] = rng(0x0E88, 31, "sprite addr hi")
S["boundary"]     = rng(0x0EA7, 4, "boundary objects")
S["levelpal"]     = rng(0x0EC5, 4, "level palettes")
S["colmasks"]     = rng(0x0EC1, 4, "colour masks")
S["animleft"]     = rng(0x0E02, 8, "anim left")
S["animright"]    = rng(0x0E0A, 8, "anim right")
S["animdeath"]    = rng(0x0E12, 12, "anim death")
S["deathoff"]     = rng(0x0E1E, 12, "death offsets")
S["animbored"]    = rng(0x0E2A, 4, "anim bored")
S["spiritanim"]   = rng(0x1F8F, 8, "spirit anim")
S["spiritdxdy"]   = rng(0x1F97, 6, "spirit dx/dy")
S["spiritsolid"]  = rng(0x20D1, 16, "spirit solidness")
S["addpal"]       = rng(0x3380, 2, "additional palette")
S["env1"]         = rng(0x0EB3, 14, "envelope 1")
S["env2"]         = rng(0x70A0, 14, "envelope 2")
S["str_status"]   = rng(0x2432, 0x24FA - 0x2432, "status string")
S["str_congrats"] = rng(0x25DC, 0x2670 - 0x25DC, "congrats string")
S["str_endgame"]  = rng(0x2730, 0x2775 - 0x2730, "endgame string")
S["str_name"]     = rng(0x27D7, 0x27F5 - 0x27D7, "name string")

# ---------------------------------------------------------------- level decode

def unpack_level(lv):
    """Replicates unpack_level/new_level: returns the 32x32 map as a list."""
    m = [0] * 1024
    idx = S["levelidx"]
    for k in range(4):
        si = idx[lv * 4 + k]
        if si & 0x80:  # fill strip
            for o in range(256):
                m[k * 256 + o] = si & 0x7F
        else:
            base_bit = si * 256 * 5
            for o in range(256):
                v = 0
                for j in range(5):
                    bi = base_bit + o * 5 + j
                    bit = (S["levelstrips"][bi >> 3] >> (bi & 7)) & 1
                    v |= bit << j
                m[k * 256 + o] = v
    return m

OBJNAME = {
    0: ".", 1: ".", 2: " ", 3: "e", 4: "e", 5: "e", 6: "d", 7: "k",
    8: "S", 9: "X", 10: "t", 11: "T", 12: "c", 13: "B", 14: "r", 15: "O",
}
def objch(o):
    if o in OBJNAME:
        return OBJNAME[o]
    if 0x10 <= o < 0x20:
        return "#"
    if o >= 0x20:
        return "P"
    return "?"

levels = [unpack_level(lv) for lv in range(16)]

# sanity checks
total_earth = sum(sum(1 for o in m if 3 <= o <= 5) for m in levels)
total_diamonds = sum(m.count(6) + m.count(0x0D) + m.count(0x0C) for m in levels)
total_eggs = sum(m.count(0x0F) for m in levels)
total_skulls = sum(m.count(8) for m in levels)
total_spirits = sum(m.count(9) for m in levels[1:])
total_rocks = sum(m.count(0x0E) for m in levels)
print(f"earth={total_earth} (expect 4744), diamonds+safes+cages={total_diamonds} (expect 1634), "
      f"eggs={total_eggs} (expect 18), skulls={total_skulls}, spiritsL1+={total_spirits}, rocks={total_rocks}")
# counters in the ROM: earth=4744, diamonds(incl. safes/cages)=$1634, monsters(eggs)=$18
assert total_earth == 4744, "earth count mismatch - decode is wrong!"
assert total_diamonds == 1634, "diamond count mismatch - decode is wrong!"
assert total_eggs == 18, "egg count mismatch - decode is wrong!"

# puzzle piece / transporter target validity
for i in range(42):
    lv, x, y, pos = S["puzzle"][i * 4:i * 4 + 4]
    assert lv < 16 and x < 32 and y < 32, "bad puzzle piece"
for i in range(64):
    lv, x, y, dlv, dx, dy = S["transporters"][i * 6:i * 6 + 6]
    assert lv < 16 and dlv < 16 and x < 32 and y < 32 and dx < 32 and dy < 32

if "--maps" in sys.argv:
    for lv in range(16):
        print(f"\n=== LEVEL {lv} ({chr(65+lv)}) strips "
              f"{[hex(S['levelidx'][lv*4+k]) for k in range(4)]} ===")
        m = levels[lv]
        for y in range(32):
            print("".join(objch(m[y * 32 + x]) for x in range(32)))

# ---------------------------------------------------------------- tile preview (ppm)

if "--tiles" in sys.argv:
    pal = [(0, 0, 0), (255, 0, 255), (255, 255, 0), (255, 255, 255)]
    W, H = 16 * 4, 12 * 8
    px = bytearray(W * H * 3)
    for t in range(0xB6):
        ox, oy = (t % 16) * 4, (t // 16) * 8
        for r in range(8):
            b = S["gfx"][t * 8 + r]
            for p in range(4):
                c = pal[((b >> (3 - p)) & 1) | (((b >> (7 - p)) & 1) << 1)]
                i = ((oy + r) * W + ox + p) * 3
                px[i:i + 3] = bytes(c)
    with open("tiles.ppm", "wb") as f:
        f.write(f"P6 {W} {H} 255 ".encode())
        f.write(px)
    print("wrote tiles.ppm")

# ---------------------------------------------------------------- emit

data_js = "const REPTON_DATA=" + json.dumps({k: b64(v) for k, v in S.items()}) + ";\n"

with open(TEMPLATE, "r", encoding="utf-8") as f:
    tpl = f.read()
assert "/*__REPTON_DATA__*/" in tpl
with open(OUT, "w", encoding="utf-8") as f:
    f.write(tpl.replace("/*__REPTON_DATA__*/", data_js, 1))
print(f"wrote {OUT}")

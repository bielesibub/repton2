# Repton 2 — single-page HTML remake

Faithful browser port of Superior Software's Repton 2 (BBC Micro, 1985), built
**exclusively from `repton2.asm`** (a py8dis-style disassembly of the D.REPB binary).
No other ROM/graphics sources are used.

## Files

- `repton2.asm` — the disassembly (read-only source of truth: code + all game data).
- `repton.html` — the game. Fully self-contained single page (data inlined as base64).
- `repton-template.html` — game source (HTML/JS). Contains a `/*__REPTON_DATA__*/` marker.
- `build.py` — regenerates `repton.html`: parses the asm into a 64K memory image using
  the `// addr:` comment tags, slices out the data tables, verifies decodes, injects.
- `completion.md` — project log (attempts, decisions, bug history).

## Build / regenerate

```
python3 build.py            # writes repton.html
python3 build.py --maps     # also dumps all 16 levels as ASCII (decode check)
python3 build.py --tiles    # also writes tiles.ppm (tile-sheet preview)
```

build.py asserts the level decode is correct (earth=4744, diamonds+safes+cages=1634,
eggs=18 — the exact counters the ROM initialises). If those asserts fail, the asm
parse or the 5-bit level-strip bitstream decode is broken — fix before continuing.

## Test

No formal test suite in-repo; the workflow that was used (scripts are throwaway):
- Node smoke tests: the template exports engine internals when `window` is undefined
  (`module.exports`), so `node yourtest.js` can boot the game, tick it, inject keys via
  the exported `keys` set, and assert on state. `node --check` for syntax.
- Headless Chrome via puppeteer-core (installed elsewhere) for screenshots and live
  state inspection (`page.evaluate(() => G....)`).

## Architecture notes (read before touching the JS)

- Everything is byte-faithful to the 6502: 32x32 maps, 4x4 subtiles (4px x 8scanlines)
  per cell, an 8KB virtual screen memory (`vram`) in real BBC MODE 5 layout, and the
  50 Hz main loop mirroring the original's tick order (move repton -> mark map -> move
  monsters -> scan rocks -> update spirits -> update meteors -> unmark -> hit checks).
- BBC MODE 5 pixels: 4 px/byte, 2bpp, LEFT pixel uses HIGH bits:
  `pixel(p) = bit(3-p) | bit(7-p)<<1`. Do not "simplify" this — it was a real bug once.
- Rasterisation must go logical -> physical via `pal` (VDU 19 state). MODE 5 default
  palette is black/red/yellow/white (physical 0/1/3/7), NOT identity — the game only
  redefines logicals 1 and 3, so default logical 2 must stay yellow.
- Quirks that are intentional (documented in completion.md; do not "fix"): the
  rows-48..63 phantom wrap region on even levels, meteors only in that zone, skull = 8
  points + death, end-square = 9 points/frame, left-roll is silent and stays on-row,
  no egg-crack check on map row 30, collect() adds the raw object id to the BCD score.
- `completion.md` is the project memory: update it when you change behaviour, fix a
  bug, or learn something non-obvious.

![Repton 2](https://img.shields.io/badge/BBC%20Micro-Repton%202-blue)
# Repton 2 — faithful single-page HTML remake

A faithful browser port of **Superior Software's Repton 2** (BBC Micro, 1985), built
**exclusively from the 6502 disassembly** — every level, sprite, note and rule is
decoded byte-for-byte from the original game data. No ROM dumps, no hand-drawn assets,
no approximations: the game you get is the game that shipped in 1985.

**[▶ Play](https://html-preview.github.io/?url=https://github.com/bielesibub/repton2/main/repton.html)** in any modern browser. It's one fully self-contained file.



## The game

All 16 interconnected screens (A–P) of the original, with its full feature set:

- 32×32-cell scrolling caverns with earth to dig, diamonds to collect and skulls to avoid
- Falling **rocks** and **eggs** with the original curvedness/roll physics (including its
  left/right roll asymmetry); eggs crack open and hatch **monsters** that chase you
- **Spirits** following their left-hand wall rule (trap them into cages for diamonds)
- **Meteors** raining in the phantom wrap-region above even-numbered screens
- 64 **transporters** linking the 16 screens into one continuous world
- 42 **puzzle pieces** to find and assemble into the puzzle wall on screen A
- Keys that convert safes to diamonds, status screens, skull progress indicators,
  dissolve transitions, the death sequence, high-score name entry, and the
  "Congratulations!" ending
- The full in-game tune and all sound effects (square-wave Web Audio, BBC pitch→Hz)

### Controls

| Key | Action |
| --- | --- |
| Arrow keys (or `Z` `X` `:` `/`) | Move |
| `SPACE` | Status screen / continue |
| `ESC` | Give up (lose a life) |
| `S` / `Q` | Sound on / off |
| `D` / `W` | Music on / off |

## How it's built

The source of truth is [`repton2.asm`](repton2.asm), a py8dis-style disassembly of the
game binary taken from **[gfoot/repton2disassembly](https://github.com/gfoot/repton2disassembly)**.

The [repton2.asm](https://github.com/gfoot/repton2disassembly) was passed to [Kimi K3](https://platform.kimi.ai/) using [opencode CLI](https://opencode.ai/) 

`build.py` parses the disassembly into a 64K memory image using the `// addr:` comment
tags, slices out the data tables, verifies them against the ROM's own counters
(earth = 4744, diamonds + safes + cages = 1634, eggs = 18), and injects everything into
`repton-template.html` to produce `repton.html`:

```
python3 build.py            # regenerate repton.html
python3 build.py --maps     # also dump all 16 levels as ASCII (decode check)
python3 build.py --tiles    # also write tiles.ppm (tile-sheet preview)
```

The JavaScript engine mirrors the 6502 routine-by-routine: an 8 KB virtual screen in
real BBC MODE 5 layout (4 px/byte, 2 bpp), the 50 Hz main-loop tick order, the
bottom-up rock scan, the monster/spirit AIs, and even the original's quirks — the
phantom rows 48–63 above even screens (you can walk off the top!), the silent left
roll, skulls being worth 8 points (then killing you), and end squares paying 9 points
per frame.

## Files

| File | Purpose |
| --- | --- |
| `repton.html` | The game — fully self-contained single page |
| `repton-template.html` | Game source (HTML/JS) with the data marker |
| `build.py` | Regenerates `repton.html` from the disassembly |
| `repton2.asm` | The disassembly (source of truth, read-only) |
| `completion.md` | Project log (attempts, decisions, bug history) |
| `AGENTS.md` | Maintainer/agent notes (build, test, architecture) |

## Credits

- **Repton 2** written by Tim Tyler, published by Superior Software, 1985.
- Disassembly by [gfoot](https://github.com/gfoot/repton2disassembly).
- HTML remake built from that disassembly.

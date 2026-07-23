# v1.0 - Repton 2 BBC disassembly to single-page HTML - Kimi K3
Repton 2 built exclusively from [repton2disassembly in github](https://github.com/gfoot/repton2disassembly) copied here `repton2.asm` (py8dis-style disassembly of D.REPB). 

Created purely by [Kimi K3](https://platform.kimi.ai/) and [opencode CLI](https://opencode.ai/) 

## Completion Output

Done! `repton.html` (~52 KB, fully self-contained) is a faithful Repton 2, verified working
in Chrome end-to-end. `build.py` regenerates it from `repton-template.html` + `repton2.asm`
(also `python3 build.py --maps` / `--tiles` to inspect decoded data).

Data decoded byte-for-byte from the disassembly (build.py builds a 64K memory image from the
address tags, then slices the tables):
- All 16 levels (A-P) - 32x32 cells each, unpacked with the exact 5-bit bitstream algorithm
  from `read_5_bits_from_levelstrip_data` (48 shared strips + fill-strips). Verified: earth=4744,
  diamonds+safes+cages=1634, eggs=18 - the exact counters the ROM initialises.
- All graphics - 8KB MODE 5 2bpp block: 4x8-px tiles per object (74 objects), every sprite
  (Repton walk/idle/bored/death cycles, monsters, spirits, meteors, cracked egg), the font,
  the REPTON2 banner logo, plus per-level palettes via the game's own VDU 19 sequence.
- Music - both channels of the in-game tune (128 steps, envelope 2, 160 ms/step, channels 2+3)
  from `musicdata_channel2/3`; sound effects from every `sound_play` call site (diamond ding,
  rock thud, egg crack, monster crush, spirit->diamond, transporter sweep, death rise).
  Square-wave Web Audio, BBC pitch->Hz, channel flush semantics, S/Q and D/W toggles.

Faithful game logic ported routine-by-routine:
- 50 Hz loop; smooth subtile scrolling with Repton centred; cell-aligned movement blocking;
  rock pushing (rocks and eggs); collect() BCD score quirk (earth 3/4/5, diamond 6, key 7,
  skull 8 + death, end square 9/frame).
- Rocks/eggs: bottom-up scan order, one cell per tick, curvedness table (roll off rocks/
  diamonds/eggs, asymmetric left/right walls), left-roll vs right-fall asymmetry, $80
  map-marker crush on Repton, egg crack -> monster, silent left roll, no-crack on row 30.
- Monsters: cracked egg -> newborn -> chase AI (random axis, toward Repton, digs through
  earth), rock-crush check on both body cells, spawn-slot exhaustion quirk.
- Spirits: left-hand wall follower with dir-4 halt, initial direction scan, cage -> diamond.
- Meteors: spawn above the map top and rain through the rows-48..63 phantom wrap region
  (verified reachable/visible on even levels), key conversion of safes, transporter table
  (64 links, taken flags), puzzle pieces (42) into the level-0 puzzle wall, level-0 save/
  restore with zeroed wall rows, skull progress indicators, status screen (Written by Tim
  Tyler / for Superior Software LTD 1985), statustrigger mid-game status, dissolve and
  random-clear wipes, death explosion + respawn, end-of-game + high-score name entry,
  victory "Congratulations!" flow. Even the phantom zone (rows 48-63 read as empty on even
  levels - you can walk off the top of even maps) works.

Verified with Node smoke tests (unpack, rock/egg/monster/spirit/transporter/key/puzzle/
death/victory flows, 40k-tick random bot) and headless-Chrome screenshots + state checks
(boot status screen, wipe, palettes L0 blue / L1 red / L14 cyan, transporter effect, death,
endgame, name entry, music notes firing, 120 fps).

## Controls

Arrows (or Z/X + ://) move - SPACE status/continue - ESC give up - S/Q sound - D/W music

## Other..

Single page HTML BBC Repton 2 remake
Files: build.py, repton-template.html, repton.html

---

# v2.1 - Palette fix - Kimi K3

Bug reported by user (screenshot diff vs the original): skulls rendered green, no yellow
anywhere. Root cause: the MODE 5 default palette was initialised as identity `[0,1,2,3]`,
but the BBC's actual default 4-colour palette is black/red/yellow/white (`[0,1,3,7]`).
The game only ever redefines logical colours 1 and 3, so every value-2 pixel (skulls,
yellow status numbers, "ESCAPE"/"SPACE" highlights, Repton's body) came out green.
One-line fix in repton-template.html (`const pal=[0,1,3,7]`); rebuilt with build.py and
re-verified pixel-faithful vs the original on levels A/B + status screen.

## Rendering gotchas worth remembering (all three were real bugs found during v2.x)

- BBC MODE 5 byte -> pixels: 4 px/byte, 2bpp, and the LEFT pixel uses the HIGH bits:
  pixel p (0=left) = `bit(3-p) | bit(7-p)<<1`. Getting this wrong mirrors every glyph.
- Always translate logical -> physical through the palette when rasterising; indexing the
  RGB table directly by pixel value silently ignores all VDU 19 palette changes.
- MODE 5 default palette is black/red/yellow/white (physical 0/1/3/7), NOT identity.

Status: repton.html is complete and colour-correct; full test suite (node bot + headless
Chrome) passes.

# Cost

New session - 2026-07-19T15:18:08.830Z
Context
419,683 tokens
40% used
$15.49 spent

---

# v2.2 - Touch overlay for mobile play - Kimi K3

Added `touchpad.js`, a modular touch overlay (no dependencies, ~350 lines) for playing on
phones/tablets. It dispatches **synthetic KeyboardEvents**, so the game engine is untouched —
any game that reads keys from window/document can adopt it with one script tag + an init call.
- Glass-style D-pad (hold + slide between directions, dead zone, optional 8-way), A/B hold
  buttons, toggle chips (SOUND/MUSIC send the on/off key pair s/q, d/w), all configurable.
- Shows itself only on touch devices (`pointer: coarse` / touch points); `?touchpad=1|0`
  forces on/off. Haptics via navigator.vibrate where supported.
- build.py originally inlined it into repton.html via a `/*__TOUCHPAD__*/` marker; switched
  to a plain `<script src="touchpad.js">` import for ease of access (edit the overlay without
  rebuilding). The init is guarded (`if (window.TouchPad)`) so the game still runs keyboard-
  only if the file is missing. GOTCHA if you ever inline it instead: the JS must not contain
  a literal `</script>` — an early version had one in a doc comment and Chrome killed the
  whole script block.
- Template CSS: on coarse pointers with body.tp-on, the caption hides and the canvas centres
  in the space above the dock (portrait) or shrinks to leave corner room (landscape).

Verified with headless Chrome device emulation (iPhone viewport, CDP touch events): overlay
appears, A tap leaves the status screen into PLAY, holding the right wedge drives Repton
rx 16 -> 19, keys clear on release, no JS errors. Screenshots: portrait/landscape/hold.
Note: high-score NAMEENTRY still needs a real keyboard for letters (ENTER chip accepts).
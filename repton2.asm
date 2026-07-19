sprite_death5 = $00
sprite_death4 = $01
obj_empty = $02
sprite_death3 = $02
obj_firstnonempty = $03
sprite_death2 = $03
sprite_death1 = $04
sprite_death0 = $05
obj_diamond = $06
obj_key = $07
obj_skull = $08
obj_spirit = $09
sprite_crackedegg = $09
obj_statustrigger = $0a
obj_firstnoncollectable = $0a
sprite_spirit0 = $0a
obj_transporter = $0b
sprite_spirit1 = $0b
obj_cage = $0c
sprite_spirit2 = $0c
obj_safe = $0d
sprite_spirit3 = $0d
obj_rock = $0e
sprite_meteor = $0e
obj_egg = $0f
sprite_monster_newborn = $0f
obj_wall = $10
sprite_monster0 = $10
sprite_monster1 = $11
sprite_repton_lookleft = $12
sprite_repton_stationary = $13
sprite_repton_lookright = $14
sprite_updown0 = $15
sprite_updown1 = $16
sprite_right3 = $17
sprite_right2 = $18
sprite_right1 = $19
sprite_right0 = $1a
sprite_left0 = $1b
sprite_left1 = $1c
sprite_left2 = $1d
sprite_left3 = $1e
obj_firstpuzzlepiece = $20
total_puzzlepieces_bcd = $42
total_transporters_bcd = $64
keycode_escape = $8f
keycode_question = $97
keycode_space = $9d
keycode_z = $9e
keycode_s = $ae
keycode_star = $b7
keycode_x = $bd
keycode_d = $cd
keycode_w = $de
keycode_q = $ef
screen_base = $6000

l0000 = $00
l0001 = $01
l0002 = $02
l0003 = $03
zp_tmp4 = $04
l0005 = $05
l0006 = $06
l0007 = $07
zp_x = $08
zp_y = $09
zp_ptr = $0a
zp_ptr_hi = $0b
zp_count = $0c
l000d = $0d
l000e = $0e
l000f = $0f
l0040 = $40
zp_music_osword_channel = $41
zp_music_osword_envelope = $43
zp_music_osword_pitch = $45
zp_music_osword_duration = $47
zp_music_subnote = $50
zp_music_note = $51
zp_music_enabled = $5f
zp_rock_x = $60
zp_rock_y = $61
zp_rock_addr = $62
zp_rock_addr_hi = $63
l0064 = $64
zp_rock_thinghit = $65
zp_rock_thinghit_x = $66
l0067 = $67
zp_rock_w__print_bcd_lo = $68
zp_rock_e__print_bcd_mid = $69
zp_rock_sw__print_bcd_hi = $6a
zp_rock_se__suppressleadingzerosflag = $6b
zp_rock_s = $6c
zp_transporters_count = $6d
zp_rock_curvedness__transporters_ptr = $6e
zp_rock_type__puzzlepiece_offset = $6f
zp_temp_x = $70
zp_temp_y = $71
l0072 = $72
l0073 = $73
zp_drawscreen_x = $74
zp_drawscreen_y = $75
zp_drawscreen_counter = $76
l0077 = $77
l0078 = $78
l007e = $7e
zp_textpos_x = $80
zp_textpos_y = $81
zp_textcolour = $82
zp_soundon = $83
zp_random = $84
zp_score_bcd = $85
l0088 = $88
l0089 = $89
zp_lives = $8a
zp_current_level = $8b
zp_screen_topleft_x = $8c
zp_screen_topleft_y = $8d
zp_screenaddr = $8e
zp_irq_saved_a = $fc
irq2v = $0206
evntv = $0220
l034e = $034e
l0352 = $0352
l0353 = $0353
l0354 = $0354
l0355 = $0355
l0356 = $0356
mapdata1 = $0400
mapdata1_skulls_monsters1 = $0421
mapdata1_skulls_diamonds1 = $0423
mapdata1_skulls_earth1 = $0425
mapdata1_skulls_puzzlepieces1 = $0427
mapdata1_skulls_transporters1 = $0429
mapdata1_skulls_monsters2 = $04a1
mapdata1_skulls_diamonds2 = $04a3
mapdata1_skulls_earth2 = $04a5
mapdata1_skulls_puzzlepieces2 = $04a7
mapdata1_skulls_transporters2 = $04a9
mapdata2 = $0500
mapdata3 = $0600
mapdata4 = $0700
savedlevel0data1 = $0900
savedlevel0data2 = $0a00
data_gamestate = $0b00
data_meteors_x = $0b10
data_meteors_y = $0b11
remaining_monsters = $0be0
remaining_diamonds_bcd = $0be1
remaining_diamonds_bcd_hi = $0be2
remaining_earth_bcd = $0be3
remaining_earth_bcd_hi = $0be4
remaining_puzzlepieces_bcd = $0be5
remaining_transporters_bcd = $0be6
repton_x = $0bf8
repton_y = $0bf9
repton_last_x = $0bfa
repton_last_y = $0bfb
l0bfc = $0bfc
repton_animframe = $0bfd
repton_moving_x = $0bfe
repton_moving_y = $0bff
savedlevel0data3 = $0c00
l7000 = $7000
l7060 = $7060
crtc_reg = $fe00
crtc_data = $fe01
lfe40 = $fe40
via2_t1cl = $fe64
via2_t1ch = $fe65
via2_t2cl = $fe68
via2_t2ch = $fe69
via2_ier = $fe6e
osrdch = $ffe0
oswrch = $ffee
osword = $fff1
osbyte = $fff4

    * = $0d00
nmihandler:
pydis_start:
    rti                                                     // 0d00: 40
// Referenced 1 time by $1ed4
collect:
    jsr map_read                                            // 0d01: 20 1a 11
    cmp #obj_firstnonempty                                  // 0d04: c9 03
    bcc collect_not                                         // 0d06: 90 19
    cmp #obj_firstnoncollectable                            // 0d08: c9 0a
    bcs collect_not                                         // 0d0a: b0 15
    pha                                                     // 0d0c: 48
    sed                                                     // 0d0d: f8
    clc                                                     // 0d0e: 18
    adc zp_score_bcd                                        // 0d0f: 65 85
    sta zp_score_bcd                                        // 0d11: 85 85
    lda zp_score_bcd+1                                      // 0d13: a5 86
    adc #$00                                                // 0d15: 69 00
    sta zp_score_bcd+1                                      // 0d17: 85 86
    lda zp_score_bcd+2                                      // 0d19: a5 87
    adc #$00                                                // 0d1b: 69 00
    sta zp_score_bcd+2                                      // 0d1d: 85 87
    cld                                                     // 0d1f: d8
    pla                                                     // 0d20: 68
// Referenced 2 times by $0d0a, $0d06
collect_not:
    rts                                                     // 0d21: 60
// Referenced 2 times by $0d38, $0d43
irq2v_return:
    pla                                                     // 0d22: 68
    tay                                                     // 0d23: a8
    pla                                                     // 0d24: 68
    tax                                                     // 0d25: aa
    lda #$20 // ' '                                         // 0d26: a9 20
    sta via2_ier                                            // 0d28: 8d 6e fe
    lda zp_irq_saved_a                                      // 0d2b: a5 fc
    rti                                                     // 0d2d: 40
irq2v_handler:
    txa                                                     // 0d2e: 8a
    pha                                                     // 0d2f: 48
    tya                                                     // 0d30: 98
    pha                                                     // 0d31: 48
    inc zp_music_subnote                                    // 0d32: e6 50
    lda zp_music_subnote                                    // 0d34: a5 50
    and #$07                                                // 0d36: 29 07
    bne irq2v_return                                        // 0d38: d0 e8
    inc zp_music_note                                       // 0d3a: e6 51
    lda zp_music_note                                       // 0d3c: a5 51
    and #$7f                                                // 0d3e: 29 7f
    jsr music_nextnotes                                     // 0d40: 20 80 03
    jmp irq2v_return                                        // 0d43: 4c 22 0d
// Referenced 1 time by $03a8
enable_event:
    lda #$0d                                                // 0d46: a9 0d
    sta evntv+1                                             // 0d48: 8d 21 02
    lda #$64 // 'd'                                         // 0d4b: a9 64
    sta evntv                                               // 0d4d: 8d 20 02
    lda #$0e                                                // 0d50: a9 0e
    ldx #$04                                                // 0d52: a2 04
    jmp osbyte                                              // 0d54: 4c f4 ff
    .byt $ea, $ea, $ea                                      // 0d57: ...
// Referenced 1 time by $1bb0
disable_event:
    jsr oswrch                                              // 0d5a: 20 ee ff
    lda #$0d                                                // 0d5d: a9 0d
    ldx #$04                                                // 0d5f: a2 04
    jmp osbyte                                              // 0d61: 4c f4 ff
event_handler:
    lda #$a0                                                // 0d64: a9 a0
    sta via2_ier                                            // 0d66: 8d 6e fe
    lda #$d0                                                // 0d69: a9 d0
    sta via2_t2cl                                           // 0d6b: 8d 68 fe
    lda #$09                                                // 0d6e: a9 09
    sta via2_t2ch                                           // 0d70: 8d 69 fe
    lda #$2e // '.'                                         // 0d73: a9 2e
    sta irq2v                                               // 0d75: 8d 06 02
    lda #$0d                                                // 0d78: a9 0d
    sta irq2v+1                                             // 0d7a: 8d 07 02
    rts                                                     // 0d7d: 60
    .byt $00, $00                                           // 0d7e: ..
musicdata_channel2:
    .byt $a1, $a9, $b1, $89, $95, $9d, $a1, $81             // 0d80: ........
    .byt $8d, $95, $9d, $79, $79, $8d, $79, $00             // 0d88: ...yy.y.
    .byt $79, $7d, $81, $a1, $81, $85, $89, $a1             // 0d90: y}......
    .byt $9d, $8d, $9d, $a9, $a9, $00, $9d, $00             // 0d98: ........
    .byt $a1, $a9, $b1, $89, $95, $9d, $a1, $81             // 0da0: ........
    .byt $8d, $95, $9d, $79, $79, $75, $79, $81             // 0da8: ...yyuy.
    .byt $89, $8d, $91, $95, $9d, $95, $8d, $b1             // 0db0: ........
    .byt $a9, $00, $00, $00, $a9, $00, $9d, $00             // 0db8: ........
    .byt $a1, $a9, $b1, $89, $95, $9d, $a1, $81             // 0dc0: ........
    .byt $8d, $95, $9d, $79, $79, $8d, $79, $00             // 0dc8: ...yy.y.
    .byt $79, $7d, $81, $a1, $81, $85, $89, $a1             // 0dd0: y}......
    .byt $9d, $8d, $9d, $a9, $a9, $00, $00, $00             // 0dd8: ........
    .byt $9d, $a1, $a9, $81, $91, $95, $9d, $81             // 0de0: ........
    .byt $95, $91, $95, $9d, $a1, $00, $a5, $00             // 0de8: ........
    .byt $a9, $bd, $a9, $9d, $8d, $79, $89, $a9             // 0df0: .....y..
    .byt $8d, $00, $00, $00, $8d, $00, $9d, $00             // 0df8: ........
    .byt $0d, $ff                                           // 0e00: ..
lut_reptonanim_left:
    .byt $1b, $1c, $1d, $1e, $1e, $1d, $1c, $1b             // 0e02: ........
lut_reptonanim_right:
    .byt $1a, $19, $18, $17, $17, $18, $19, $1a             // 0e0a: ........
lut_reptonanim_death:
    .byt $05, $04, $03, $02, $01, $00, $00, $01             // 0e12: ........
    .byt $02, $03, $04, $05                                 // 0e1a: ....
lut_somethingtodowithdeathanims:
    .byt $0f, $0f, $0f, $0e, $0e, $0e, $0e, $0e             // 0e1e: ........
    .byt $0e, $0f, $0f, $0f                                 // 0e26: ....
lut_reptonanim_bored:
    .byt $13, $14, $13, $12                                 // 0e2a: ....
lut_curvedness:
    .byt $01, $01, $01, $01, $01, $01, $03, $03             // 0e2e: ........
    .byt $03, $03, $03, $01, $01, $01, $03, $03             // 0e36: ........
    .byt $02, $00, $01, $01, $01, $01, $01, $01             // 0e3e: ........
    .byt $01, $01, $00, $02                                 // 0e46: ....
lut_spritesize:
    .byt $04, $04, $04, $02, $02, $02, $01, $01             // 0e4a: ........
    .byt $01, $04, $02, $02, $02, $02, $02, $04             // 0e52: ........
    .byt $04, $04, $04, $04, $04, $04, $04, $04             // 0e5a: ........
    .byt $04, $04, $04, $04, $04, $04, $04                  // 0e62: .......
lut_spriteaddr_lo:
    .byt $c0, $e0, $00, $20, $30, $a0, $00, $00             // 0e69: ... 0...
    .byt $00, $60, $40, $50, $60, $70, $b0, $60             // 0e71: .`@P`p.`
    .byt $80, $a0, $00, $20, $40, $00, $20, $40             // 0e79: ... @. @
    .byt $60, $80, $a0, $c0, $e0, $00, $20                  // 0e81: `..... 
lut_spriteaddr_hi:
    .byt $38, $38, $39, $39, $39, $3b, $35, $35             // 0e88: 88999;55
    .byt $35, $30, $2f, $2f, $2f, $2f, $3b, $38             // 0e90: 50////;8
    .byt $38, $38, $38, $38, $38, $3d, $3d, $3d             // 0e98: 88888===
    .byt $3d, $3d, $3d, $3d, $3d, $3e, $3e                  // 0ea0: =====>>
lut_boundary_objects:
    .byt $18, $1e, $19, $18                                 // 0ea7: ....
lut_powers_of_two:
    .byt $01, $02, $04, $08, $10, $20, $40, $80             // 0eab: ..... @.
data_envelope:
    .byt $01, $02, $00, $00, $00, $01, $02, $03             // 0eb3: ........
    .byt $64, $01, $ff, $fe, $7e, $7e                       // 0ebb: d...~~
lut_colour_masks:
    .byt $00, $0f, $f0, $ff                                 // 0ec1: ....
lut_level_palettes:
    .byt $15, $14, $16, $36                                 // 0ec5: ...6
// Referenced 8 times by $1be4, $10a5, $1c4c, $1c1d, $1c14, $1c17, $1c1a, $1f1d
vsync:
    lda #$13                                                // 0ec9: a9 13
    jmp osbyte                                              // 0ecb: 4c f4 ff
    .byt $e0, $00, $f0, $03, $4c, $69, $0f, $60             // 0ece: ....Li.`
    .byt $ea, $ea                                           // 0ed6: ..
musicdata_channel3:
    .byt $35, $00, $59, $00, $19, $00, $59, $00             // 0ed8: 5.Y...Y.
    .byt $2d, $00, $5d, $00, $19, $00, $5d, $00             // 0ee0: -.]...].
    .byt $29, $00, $59, $00, $19, $00, $65, $00             // 0ee8: ).Y...e.
    .byt $2d, $00, $5d, $00, $3d, $00, $5d, $00             // 0ef0: -.].=.].
    .byt $35, $00, $59, $00, $19, $00, $59, $00             // 0ef8: 5.Y...Y.
    .byt $2d, $00, $5d, $00, $31, $00, $55, $00             // 0f00: -.].1.U.
    .byt $35, $00, $59, $00, $31, $00, $65, $00             // 0f08: 5.Y.1.e.
    .byt $65, $31, $35, $00, $19, $00, $00, $00             // 0f10: e15.....
    .byt $35, $00, $59, $00, $19, $00, $59, $00             // 0f18: 5.Y...Y.
    .byt $2d, $00, $5d, $00, $19, $00, $5d, $00             // 0f20: -.]...].
    .byt $29, $00, $59, $00, $19, $00, $65, $00             // 0f28: ).Y...e.
    .byt $2d, $00, $5d, $00, $3d, $00, $5d, $00             // 0f30: -.].=.].
    .byt $51, $00, $61, $00, $49, $00, $5d, $00             // 0f38: Q.a.I.].
    .byt $41, $00, $51, $00, $21, $00, $21, $00             // 0f40: A.Q.!.!.
    .byt $49, $00, $5d, $00, $49, $00, $59, $00             // 0f48: I.].I.Y.
    .byt $2d, $00, $49, $00, $3d, $00, $00, $00             // 0f50: -.I.=...
    .byt $ff                                                // 0f58: .
// Referenced 5 times by $1b83, $1769, $1b8c, $175e, $18ff
random:
    lda zp_random                                           // 0f59: a5 84
    adc via2_t1ch                                           // 0f5b: 6d 65 fe
    eor via2_t1cl                                           // 0f5e: 4d 64 fe
    sta zp_random                                           // 0f61: 85 84
    rol                                                     // 0f63: 2a
    adc zp_random                                           // 0f64: 65 84
    sta zp_random                                           // 0f66: 85 84
    rts                                                     // 0f68: 60
// Referenced 10 times by $1580, $1a22, $16a2, $1646, $1528, $1c2d, $156d, $17b4, $2057, $187b
sound_play:
    pha                                                     // 0f69: 48
    lda zp_soundon                                          // 0f6a: a5 83
    beq sound_play_disabled                                 // 0f6c: f0 25
    pla                                                     // 0f6e: 68
    sta l0003                                               // 0f6f: 85 03
    stx l0005                                               // 0f71: 86 05
    sty l0007                                               // 0f73: 84 07
    ldx #$00                                                // 0f75: a2 00
    stx zp_x                                                // 0f77: 86 08
    stx l0006                                               // 0f79: 86 06
    stx l0002                                               // 0f7b: 86 02
    ldx l0000                                               // 0f7d: a6 00
    stx l0001                                               // 0f7f: 86 01
    ldx #$ff                                                // 0f81: a2 ff
    tay                                                     // 0f83: a8
    bmi sound_play_osword                                   // 0f84: 30 02
    ldx #$00                                                // 0f86: a2 00
// Referenced 1 time by $0f84
sound_play_osword:
    sty zp_tmp4                                             // 0f88: 84 04
    ldx #$01                                                // 0f8a: a2 01
    ldy #$00                                                // 0f8c: a0 00
    lda #$07                                                // 0f8e: a9 07
    jmp osword                                              // 0f90: 4c f1 ff
// Referenced 1 time by $0f6c
sound_play_disabled:
    pla                                                     // 0f93: 68
    rts                                                     // 0f94: 60
// Referenced 13 times by $0fe0, $23e0, $08a5, $1d85, $2725, $1d6a, $0fec, $088f, $1dd0, $25d1, $1df5, $23d6, $089a
kbd_test:
    tax                                                     // 0f95: aa
    ldy #$ff                                                // 0f96: a0 ff
    lda #$81                                                // 0f98: a9 81
    jsr osbyte                                              // 0f9a: 20 f4 ff
    tya                                                     // 0f9d: 98
    rts                                                     // 0f9e: 60
// Referenced 5 times by $1ce1, $2402, $1cec, $240d, $338e
vdu19:
    sta l0000                                               // 0f9f: 85 00
    lda #$13                                                // 0fa1: a9 13
    jsr oswrch                                              // 0fa3: 20 ee ff
    lda l0000                                               // 0fa6: a5 00
    lsr                                                     // 0fa8: 4a
    lsr                                                     // 0fa9: 4a
    lsr                                                     // 0faa: 4a
    lsr                                                     // 0fab: 4a
    jsr oswrch                                              // 0fac: 20 ee ff
    lda l0000                                               // 0faf: a5 00
    and #$0f                                                // 0fb1: 29 0f
    jsr oswrch                                              // 0fb3: 20 ee ff
    lda #$00                                                // 0fb6: a9 00
    jsr oswrch                                              // 0fb8: 20 ee ff
    jsr oswrch                                              // 0fbb: 20 ee ff
    jmp oswrch                                              // 0fbe: 4c ee ff
// Referenced 3 times by $11cd, $1031, $11fd
convert_xycoords_to_screen_address:
    txa                                                     // 0fc1: 8a
    asl                                                     // 0fc2: 0a
    asl                                                     // 0fc3: 0a
    asl                                                     // 0fc4: 0a
    clc                                                     // 0fc5: 18
    adc zp_screenaddr                                       // 0fc6: 65 8e
    tax                                                     // 0fc8: aa
    tya                                                     // 0fc9: 98
    adc zp_screenaddr+1                                     // 0fca: 65 8f
    bpl convert_xycoords_return                             // 0fcc: 10 03
    sec                                                     // 0fce: 38
    sbc #$20 // ' '                                         // 0fcf: e9 20
// Referenced 1 time by $0fcc
convert_xycoords_return:
    tay                                                     // 0fd1: a8
    rts                                                     // 0fd2: 60
// Referenced 3 times by $2720, $23d1, $1f4b
check_audio_keys:
    nop                                                     // 0fd3: ea
    nop                                                     // 0fd4: ea
    jsr kbd_check_dwq                                       // 0fd5: 20 8d 08
// Z is set if Q was not pressed
    beq kbd_check_s                                         // 0fd8: f0 04
    lda #$00                                                // 0fda: a9 00
    sta zp_soundon                                          // 0fdc: 85 83
// Referenced 1 time by $0fd8
kbd_check_s:
    lda #keycode_s                                          // 0fde: a9 ae
    jsr kbd_test                                            // 0fe0: 20 95 0f
    beq check_audio_keys_rts                                // 0fe3: f0 04
    lda #$01                                                // 0fe5: a9 01
    sta zp_soundon                                          // 0fe7: 85 83
// Referenced 1 time by $0fe3
check_audio_keys_rts:
    rts                                                     // 0fe9: 60
// Referenced 1 time by $1f4e
check_escape_ingame:
    lda #keycode_escape                                     // 0fea: a9 8f
    jsr kbd_test                                            // 0fec: 20 95 0f
    beq check_escape_ingame_rts                             // 0fef: f0 03
    jmp death                                               // 0ff1: 4c ee 1b
// Referenced 1 time by $0fef
check_escape_ingame_rts:
    rts                                                     // 0ff4: 60
// Referenced 5 times by $1890, $1c11, $1750, $1a76, $2017
draw_sprite:
    pha                                                     // 0ff5: 48
    txa                                                     // 0ff6: 8a
    sec                                                     // 0ff7: 38
    sbc zp_screen_topleft_x                                 // 0ff8: e5 8c
    sta zp_temp_x                                           // 0ffa: 85 70
    tya                                                     // 0ffc: 98
    sec                                                     // 0ffd: 38
    sbc zp_screen_topleft_y                                 // 0ffe: e5 8d
    sta zp_temp_y                                           // 1000: 85 71
    pla                                                     // 1002: 68
    tay                                                     // 1003: a8
    lda lut_spriteaddr_lo,y                                 // 1004: b9 69 0e
    sta l0072                                               // 1007: 85 72
    sta zp_drawscreen_x                                     // 1009: 85 74
    lda lut_spriteaddr_hi,y                                 // 100b: b9 88 0e
    sta l0073                                               // 100e: 85 73
    sta zp_drawscreen_y                                     // 1010: 85 75
    lda lut_spritesize,y                                    // 1012: b9 4a 0e
    sta l0002                                               // 1015: 85 02
    lda #$00                                                // 1017: a9 00
    sta l0000                                               // 1019: 85 00
    sta l0001                                               // 101b: 85 01
// Referenced 2 times by $1073, $1056
draw_sprite_loop:
    lda zp_temp_x                                           // 101d: a5 70
    clc                                                     // 101f: 18
    adc l0000                                               // 1020: 65 00
    cmp #$20 // ' '                                         // 1022: c9 20
    bcs draw_sprite_next_tile                               // 1024: b0 1d
    tax                                                     // 1026: aa
    lda zp_temp_y                                           // 1027: a5 71
    clc                                                     // 1029: 18
    adc l0001                                               // 102a: 65 01
    cmp #$20 // ' '                                         // 102c: c9 20
    bcs draw_sprite_next_tile                               // 102e: b0 13
    tay                                                     // 1030: a8
    jsr convert_xycoords_to_screen_address                  // 1031: 20 c1 0f
    stx zp_tmp4                                             // 1034: 86 04
    sty l0005                                               // 1036: 84 05
    ldy #$07                                                // 1038: a0 07
// Referenced 1 time by $1041
draw_sprite_tile_loop:
    lda (l0072),y                                           // 103a: b1 72
    ora (zp_tmp4),y                                         // 103c: 11 04
    sta (zp_tmp4),y                                         // 103e: 91 04
    dey                                                     // 1040: 88
    bpl draw_sprite_tile_loop                               // 1041: 10 f7
// Referenced 2 times by $1024, $102e
draw_sprite_next_tile:
    lda l0072                                               // 1043: a5 72
    clc                                                     // 1045: 18
    adc #$08                                                // 1046: 69 08
    sta l0072                                               // 1048: 85 72
    lda l0073                                               // 104a: a5 73
    adc #$00                                                // 104c: 69 00
    sta l0073                                               // 104e: 85 73
    inc l0000                                               // 1050: e6 00
    lda l0000                                               // 1052: a5 00
    cmp l0002                                               // 1054: c5 02
    bne draw_sprite_loop                                    // 1056: d0 c5
    lda zp_drawscreen_x                                     // 1058: a5 74
    clc                                                     // 105a: 18
    adc #$40 // '@'                                         // 105b: 69 40
    sta zp_drawscreen_x                                     // 105d: 85 74
    sta l0072                                               // 105f: 85 72
    lda zp_drawscreen_y                                     // 1061: a5 75
    adc #$01                                                // 1063: 69 01
    sta zp_drawscreen_y                                     // 1065: 85 75
    sta l0073                                               // 1067: 85 73
    lda #$00                                                // 1069: a9 00
    sta l0000                                               // 106b: 85 00
    inc l0001                                               // 106d: e6 01
    lda l0001                                               // 106f: a5 01
    cmp l0002                                               // 1071: c5 02
    bne draw_sprite_loop                                    // 1073: d0 a8
    rts                                                     // 1075: 60
// Referenced 5 times by $189f, $1a64, $1fe5, $1712, $1c3f
erase_sprite:
    stx zp_count                                            // 1076: 86 0c
    sty l000d                                               // 1078: 84 0d
    tay                                                     // 107a: a8
    lda lut_spritesize,y                                    // 107b: b9 4a 0e
    tax                                                     // 107e: aa
    dex                                                     // 107f: ca
    stx zp_tmp4                                             // 1080: 86 04
    stx l0005                                               // 1082: 86 05
    stx zp_temp_x                                           // 1084: 86 70
// Referenced 2 times by $10a2, $109a
erase_sprite_loop:
    lda zp_count                                            // 1086: a5 0c
    clc                                                     // 1088: 18
    adc zp_tmp4                                             // 1089: 65 04
    tax                                                     // 108b: aa
    lda l000d                                               // 108c: a5 0d
    clc                                                     // 108e: 18
    adc l0005                                               // 108f: 65 05
    tay                                                     // 1091: a8
    jsr lookup_subtile_image_data                           // 1092: 20 d1 10
    jsr draw_subtile_at_coords                              // 1095: 20 ba 11
    dec zp_tmp4                                             // 1098: c6 04
    bpl erase_sprite_loop                                   // 109a: 10 ea
    lda zp_temp_x                                           // 109c: a5 70
    sta zp_tmp4                                             // 109e: 85 04
    dec l0005                                               // 10a0: c6 05
    bpl erase_sprite_loop                                   // 10a2: 10 e2
    rts                                                     // 10a4: 60
// Referenced 4 times by $1b53, $1b14, $1a95, $1ace
scroll:
    jsr vsync                                               // 10a5: 20 c9 0e
    lda zp_screenaddr                                       // 10a8: a5 8e
    sta l0000                                               // 10aa: 85 00
    lda zp_screenaddr+1                                     // 10ac: a5 8f
    sta l0001                                               // 10ae: 85 01
    lsr l0001                                               // 10b0: 46 01
    ror l0000                                               // 10b2: 66 00
    lsr l0001                                               // 10b4: 46 01
    ror l0000                                               // 10b6: 66 00
    lsr l0001                                               // 10b8: 46 01
    ror l0000                                               // 10ba: 66 00
    lda #$0c                                                // 10bc: a9 0c
    sta crtc_reg                                            // 10be: 8d 00 fe
    lda l0001                                               // 10c1: a5 01
    sta crtc_data                                           // 10c3: 8d 01 fe
    lda #$0d                                                // 10c6: a9 0d
    sta crtc_reg                                            // 10c8: 8d 00 fe
    lda l0000                                               // 10cb: a5 00
    sta crtc_data                                           // 10cd: 8d 01 fe
    rts                                                     // 10d0: 60
// Referenced 10 times by $1b26, $1aa7, $1ae7, $11ab, $140c, $1b6c, $1092, $1433, $1416, $143d
lookup_subtile_image_data:
    stx l0006                                               // 10d1: 86 06
    sty l0007                                               // 10d3: 84 07
// Look up map data for x/4,y/4
    txa                                                     // 10d5: 8a
    lsr                                                     // 10d6: 4a
    lsr                                                     // 10d7: 4a
    tax                                                     // 10d8: aa
    tya                                                     // 10d9: 98
    lsr                                                     // 10da: 4a
    lsr                                                     // 10db: 4a
    tay                                                     // 10dc: a8
    jsr map_read                                            // 10dd: 20 1a 11
    tay                                                     // 10e0: a8
    ldx #$00                                                // 10e1: a2 00
    stx zp_ptr_hi                                           // 10e3: 86 0b
// Store remainder of x/4,y/4 in zp_x,zp_y
    lda l0006                                               // 10e5: a5 06
    and #$03                                                // 10e7: 29 03
    sta zp_x                                                // 10e9: 85 08
    lda l0007                                               // 10eb: a5 07
    and #$03                                                // 10ed: 29 03
    sta zp_y                                                // 10ef: 85 09
// Multiply object index by 16, store in zp_ptr,zp_ptr_hi
    tya                                                     // 10f1: 98
    asl                                                     // 10f2: 0a
    asl                                                     // 10f3: 0a
l10f4:
// 0b 0a => ANC #&0a, equiv to AND #&0a in this context - called after screen dissolve?
// Referenced 1 time by $220c
bug_shouldnt_call_here = l10f4+1
    rol zp_ptr_hi                                           // 10f4: 26 0b
    asl                                                     // 10f6: 0a
    rol zp_ptr_hi                                           // 10f7: 26 0b
    asl                                                     // 10f9: 0a
    rol zp_ptr_hi                                           // 10fa: 26 0b
    sta zp_ptr                                              // 10fc: 85 0a
// Add on subtile y*4 and x
    lda zp_y                                                // 10fe: a5 09
    asl                                                     // 1100: 0a
    asl                                                     // 1101: 0a
    clc                                                     // 1102: 18
    adc zp_ptr                                              // 1103: 65 0a
    adc zp_x                                                // 1105: 65 08
// Add start address of tile graphics
    adc #<data_tilegraphics_indices                         // 1107: 69 a0
    sta zp_ptr                                              // 1109: 85 0a
    lda zp_ptr_hi                                           // 110b: a5 0b
    adc #>data_tilegraphics_indices // '*'                  // 110d: 69 2a
    sta zp_ptr_hi                                           // 110f: 85 0b
    ldx l0006                                               // 1111: a6 06
    ldy #$00                                                // 1113: a0 00
    lda (zp_ptr),y                                          // 1115: b1 0a
    ldy l0007                                               // 1117: a4 07
    rts                                                     // 1119: 60
// Referenced 25 times by $0d01, $1186, $2109, $1593, $1e9a, $1da4, $132e, $1db0, $1eb3, $1dbc, $203f, $1841, $18c8, $1dc9, $18d4, $1d57, $1e5c, $10dd, $185d, $18e0, $1d63, $18ec, $1174, $1e75, $207a
map_read:
    txa                                                     // 111a: 8a
    and #$3f // '?'                                         // 111b: 29 3f
    tax                                                     // 111d: aa
    tya                                                     // 111e: 98
    and #$3f // '?'                                         // 111f: 29 3f
    tay                                                     // 1121: a8
    stx zp_x                                                // 1122: 86 08
    sty zp_y                                                // 1124: 84 09
// If X or Y outside range 0..31, do different things
    cpx #$20 // ' '                                         // 1126: e0 20
    bcs map_read_badx                                       // 1128: b0 25
    cpy #$20 // ' '                                         // 112a: c0 20
    bcs map_read_bady                                       // 112c: b0 2c
// Multiply Y by 32 in A, carry into l000b
    lda #$00                                                // 112e: a9 00
    sta zp_ptr_hi                                           // 1130: 85 0b
    tya                                                     // 1132: 98
    asl                                                     // 1133: 0a
    asl                                                     // 1134: 0a
    asl                                                     // 1135: 0a
    asl                                                     // 1136: 0a
    rol zp_ptr_hi                                           // 1137: 26 0b
    asl                                                     // 1139: 0a
    rol zp_ptr_hi                                           // 113a: 26 0b
// Add on X
    ora zp_x                                                // 113c: 05 08
    sta zp_ptr                                              // 113e: 85 0a
// Add &400 to l000a/l000b
    lda zp_ptr_hi                                           // 1140: a5 0b
    ora #$04                                                // 1142: 09 04
    sta zp_ptr_hi                                           // 1144: 85 0b
// Read byte pointed at by l000a/l0000b
    ldy #$00                                                // 1146: a0 00
    lda (zp_ptr),y                                          // 1148: b1 0a
// Restore X and Y
    ldx zp_x                                                // 114a: a6 08
    ldy zp_y                                                // 114c: a4 09
    rts                                                     // 114e: 60
// Referenced 3 times by $1128, $1162, $115e
map_read_badx:
    lda zp_current_level                                    // 114f: a5 8b
    lsr                                                     // 1151: 4a
    lsr                                                     // 1152: 4a
    tax                                                     // 1153: aa
    lda lut_boundary_objects,x                              // 1154: bd a7 0e
    ldx zp_x                                                // 1157: a6 08
    rts                                                     // 1159: 60
// Referenced 1 time by $112c
map_read_bady:
    lda zp_current_level                                    // 115a: a5 8b
    and #$01                                                // 115c: 29 01
    bne map_read_badx                                       // 115e: d0 ef
    cpy #$30 // '0'                                         // 1160: c0 30
    bcc map_read_badx                                       // 1162: 90 eb
    lda #$c0                                                // 1164: a9 c0
    sta zp_ptr_hi                                           // 1166: 85 0b
    lda #$00                                                // 1168: a9 00
    rts                                                     // 116a: 60
// Referenced 4 times by $13c1, $1394, $136d, $0887
map_store_obj:
    cpx #$20 // ' '                                         // 116b: e0 20
    bcs map_store_obj_rts                                   // 116d: b0 0d
    cpy #$20 // ' '                                         // 116f: c0 20
    bcs map_store_obj_rts                                   // 1171: b0 09
    pha                                                     // 1173: 48
    jsr map_read                                            // 1174: 20 1a 11
    ldy #$00                                                // 1177: a0 00
    pla                                                     // 1179: 68
    sta (zp_ptr),y                                          // 117a: 91 0a
// Referenced 2 times by $1171, $116d
map_store_obj_rts:
    rts                                                     // 117c: 60
// Referenced 14 times by $1541, $19c2, $1782, $19cc, $154d, $19ad, $204c, $1534, $19f4, $2155, $1695, $155a, $159c, $19ff
map_write:
    cpx #$20 // ' '                                         // 117d: e0 20
    bcs map_write_afterwrite                                // 117f: b0 0d
    cpy #$20 // ' '                                         // 1181: c0 20
    bcs map_write_afterwrite                                // 1183: b0 09
    pha                                                     // 1185: 48
    jsr map_read                                            // 1186: 20 1a 11
    ldy #$00                                                // 1189: a0 00
    pla                                                     // 118b: 68
    sta (zp_ptr),y                                          // 118c: 91 0a
// Referenced 2 times by $1183, $117f
map_write_afterwrite:
    txa                                                     // 118e: 8a
    asl                                                     // 118f: 0a
    asl                                                     // 1190: 0a
    sta l000e                                               // 1191: 85 0e
    lda zp_y                                                // 1193: a5 09
    asl                                                     // 1195: 0a
    asl                                                     // 1196: 0a
    sta l000f                                               // 1197: 85 0f
    lda #$03                                                // 1199: a9 03
    sta zp_count                                            // 119b: 85 0c
// Referenced 1 time by $11b7
map_write_drawloop_y:
    lda #$03                                                // 119d: a9 03
    sta l000d                                               // 119f: 85 0d
// Referenced 1 time by $11b3
map_write_drawloop_x:
    lda l000e                                               // 11a1: a5 0e
    ora zp_count                                            // 11a3: 05 0c
    tax                                                     // 11a5: aa
    lda l000f                                               // 11a6: a5 0f
    ora l000d                                               // 11a8: 05 0d
    tay                                                     // 11aa: a8
    jsr lookup_subtile_image_data                           // 11ab: 20 d1 10
    jsr draw_subtile_at_coords                              // 11ae: 20 ba 11
    dec l000d                                               // 11b1: c6 0d
    bpl map_write_drawloop_x                                // 11b3: 10 ec
    dec zp_count                                            // 11b5: c6 0c
    bpl map_write_drawloop_y                                // 11b7: 10 e4
    rts                                                     // 11b9: 60
// Referenced 18 times by $1440, $1519, $1487, $1507, $1b29, $1aaa, $1aea, $14ac, $11ae, $140f, $1b6f, $1490, $1510, $1095, $1436, $14b5, $1419, $14fe
draw_subtile_at_coords:
    pha                                                     // 11ba: 48
    txa                                                     // 11bb: 8a
    sec                                                     // 11bc: 38
    sbc zp_screen_topleft_x                                 // 11bd: e5 8c
    tax                                                     // 11bf: aa
    cpx #$20 // ' '                                         // 11c0: e0 20
    bcs draw_subtile_at_coords_outofrange                   // 11c2: b0 32
    tya                                                     // 11c4: 98
    sec                                                     // 11c5: 38
    sbc zp_screen_topleft_y                                 // 11c6: e5 8d
    tay                                                     // 11c8: a8
    cpy #$20 // ' '                                         // 11c9: c0 20
    bcs draw_subtile_at_coords_outofrange                   // 11cb: b0 29
    jsr convert_xycoords_to_screen_address                  // 11cd: 20 c1 0f
    stx l0000                                               // 11d0: 86 00
    sty l0001                                               // 11d2: 84 01
    pla                                                     // 11d4: 68
// Referenced 1 time by $221a
draw_subtile:
// Tile index is in A; destination address is at &00,&01
    ldx #$00                                                // 11d5: a2 00
    stx l0003                                               // 11d7: 86 03
    asl                                                     // 11d9: 0a
    rol l0003                                               // 11da: 26 03
    asl                                                     // 11dc: 0a
    rol l0003                                               // 11dd: 26 03
    asl                                                     // 11df: 0a
    rol l0003                                               // 11e0: 26 03
    adc #<data_tilegraphics_tiles // '@'                    // 11e2: 69 40
    sta l0002                                               // 11e4: 85 02
    lda l0003                                               // 11e6: a5 03
    adc #>data_tilegraphics_tiles // '/'                    // 11e8: 69 2f
    sta l0003                                               // 11ea: 85 03
    ldy #$07                                                // 11ec: a0 07
// Referenced 1 time by $11f3
draw_subtile_loop:
    lda (l0002),y                                           // 11ee: b1 02
    sta (l0000),y                                           // 11f0: 91 00
    dey                                                     // 11f2: 88
    bpl draw_subtile_loop                                   // 11f3: 10 f9
    rts                                                     // 11f5: 60
// Referenced 2 times by $11c2, $11cb
draw_subtile_at_coords_outofrange:
    pla                                                     // 11f6: 68
    rts                                                     // 11f7: 60
// Charater code in A, position at zp_textpos_x,zp_textpos_y
// Referenced 1 time by $2182
draw_character:
    pha                                                     // 11f8: 48
    ldx zp_textpos_x                                        // 11f9: a6 80
    ldy zp_textpos_y                                        // 11fb: a4 81
    jsr convert_xycoords_to_screen_address                  // 11fd: 20 c1 0f
    stx l0000                                               // 1200: 86 00
    sty l0001                                               // 1202: 84 01
    lda #$00                                                // 1204: a9 00
    sta l0003                                               // 1206: 85 03
    pla                                                     // 1208: 68
    asl                                                     // 1209: 0a
    rol l0003                                               // 120a: 26 03
    asl                                                     // 120c: 0a
    rol l0003                                               // 120d: 26 03
    asl                                                     // 120f: 0a
    rol l0003                                               // 1210: 26 03
    sta l0002                                               // 1212: 85 02
    lda l0003                                               // 1214: a5 03
    adc #>data_font // '4'                                  // 1216: 69 34
    sta l0003                                               // 1218: 85 03
    ldy #$07                                                // 121a: a0 07
// Referenced 1 time by $1223
draw_character_loop:
    lda (l0002),y                                           // 121c: b1 02
    and zp_textcolour                                       // 121e: 25 82
    sta (l0000),y                                           // 1220: 91 00
    dey                                                     // 1222: 88
    bpl draw_character_loop                                 // 1223: 10 f7
    rts                                                     // 1225: 60
// Referenced 1 time by $1cd9
unpack_level:
    lda #$04                                                // 1226: a9 04
    sta l0003                                               // 1228: 85 03
    lda #$00                                                // 122a: a9 00
    sta l0002                                               // 122c: 85 02
    sta zp_tmp4                                             // 122e: 85 04
// Referenced 1 time by $123e
unpack_level_loop:
    ldx zp_tmp4                                             // 1230: a6 04
    lda data_level_strip_indices,x                          // 1232: bd 00 28
    jsr unpack_level_strip                                  // 1235: 20 69 12
    inc zp_tmp4                                             // 1238: e6 04
    lda zp_tmp4                                             // 123a: a5 04
    and #$03                                                // 123c: 29 03
    bne unpack_level_loop                                   // 123e: d0 f0
    rts                                                     // 1240: 60
// Referenced 1 time by $161d
new_level:
    lda #$00                                                // 1241: a9 00
    sta l0002                                               // 1243: 85 02
    lda #$04                                                // 1245: a9 04
    sta l0003                                               // 1247: 85 03
    lda zp_current_level                                    // 1249: a5 8b
    beq new_level_going_to_0                                // 124b: f0 42
    asl                                                     // 124d: 0a
    asl                                                     // 124e: 0a
    sta zp_tmp4                                             // 124f: 85 04
// Referenced 1 time by $125f
new_level_unpack_loop:
    ldx zp_tmp4                                             // 1251: a6 04
    lda data_level_strip_indices,x                          // 1253: bd 00 28
    jsr unpack_level_strip                                  // 1256: 20 69 12
    inc zp_tmp4                                             // 1259: e6 04
    lda zp_tmp4                                             // 125b: a5 04
    and #$03                                                // 125d: 29 03
    bne new_level_unpack_loop                               // 125f: d0 f0
    lda zp_current_level                                    // 1261: a5 8b
    bne new_level_rts                                       // 1263: d0 03
// This can never happen, it was handled already at &124b
    jsr new_level_going_to_0                                // 1265: 20 8f 12
// Referenced 1 time by $1263
new_level_rts:
    rts                                                     // 1268: 60
// Referenced 2 times by $1235, $1256
unpack_level_strip:
    bmi fill_level_strip                                    // 1269: 30 18
    sta l0001                                               // 126b: 85 01
    lda #$00                                                // 126d: a9 00
    sta l0000                                               // 126f: 85 00
// Referenced 1 time by $127e
unpack_level_strip_loop:
    ldx l0000                                               // 1271: a6 00
    ldy l0001                                               // 1273: a4 01
    jsr read_5_bits_from_levelstrip_data                    // 1275: 20 d3 12
    ldy l0000                                               // 1278: a4 00
    sta (l0002),y                                           // 127a: 91 02
    inc l0000                                               // 127c: e6 00
    bne unpack_level_strip_loop                             // 127e: d0 f1
    inc l0003                                               // 1280: e6 03
    rts                                                     // 1282: 60
// Referenced 1 time by $1269
fill_level_strip:
    and #$7f                                                // 1283: 29 7f
    ldy #$00                                                // 1285: a0 00
// Referenced 1 time by $128a
fill_level_strip_loop:
    sta (l0002),y                                           // 1287: 91 02
    iny                                                     // 1289: c8
    bne fill_level_strip_loop                               // 128a: d0 fb
    inc l0003                                               // 128c: e6 03
    rts                                                     // 128e: 60
// Referenced 2 times by $124b, $1265
new_level_going_to_0:
    ldy #$00                                                // 128f: a0 00
// Referenced 1 time by $12a9
new_level_going_to_0_loop:
    lda savedlevel0data1,y                                  // 1291: b9 00 09
    sta mapdata1,y                                          // 1294: 99 00 04
    lda savedlevel0data2,y                                  // 1297: b9 00 0a
    sta mapdata2,y                                          // 129a: 99 00 05
    lda savedlevel0data3,y                                  // 129d: b9 00 0c
    sta mapdata3,y                                          // 12a0: 99 00 06
    lda #$00                                                // 12a3: a9 00
    sta mapdata4,y                                          // 12a5: 99 00 07
    iny                                                     // 12a8: c8
    bne new_level_going_to_0_loop                           // 12a9: d0 e6
    rts                                                     // 12ab: 60
// test bit Y:X from bitfield at 4200, return 0 or &ff
// Referenced 1 time by $130d
bittest_from_levelstrip_data:
    stx zp_temp_x                                           // 12ac: 86 70
    sty zp_temp_y                                           // 12ae: 84 71
    lsr zp_temp_y                                           // 12b0: 46 71
    ror zp_temp_x                                           // 12b2: 66 70
    lsr zp_temp_y                                           // 12b4: 46 71
    ror zp_temp_x                                           // 12b6: 66 70
    lsr zp_temp_y                                           // 12b8: 46 71
    ror zp_temp_x                                           // 12ba: 66 70
    lda zp_temp_y                                           // 12bc: a5 71
    clc                                                     // 12be: 18
    adc #>data_levelstrip_00 // 'B'                         // 12bf: 69 42
    sta zp_temp_y                                           // 12c1: 85 71
    ldy #$00                                                // 12c3: a0 00
    txa                                                     // 12c5: 8a
    and #$07                                                // 12c6: 29 07
    tax                                                     // 12c8: aa
    lda lut_powers_of_two,x                                 // 12c9: bd ab 0e
    and (zp_temp_x),y                                       // 12cc: 31 70
    beq bittest_from_levelstrip_data_done                   // 12ce: f0 02
    lda #$ff                                                // 12d0: a9 ff
// Referenced 1 time by $12ce
bittest_from_levelstrip_data_done:
    rts                                                     // 12d2: 60
// reads five bits at 5*(Y:X) from bitfield at 4200
// Referenced 1 time by $1275
read_5_bits_from_levelstrip_data:
    stx l0072                                               // 12d3: 86 72
    sty l0073                                               // 12d5: 84 73
    stx zp_drawscreen_x                                     // 12d7: 86 74
    sty zp_drawscreen_y                                     // 12d9: 84 75
    asl l0072                                               // 12db: 06 72
    rol l0073                                               // 12dd: 26 73
    asl l0072                                               // 12df: 06 72
    rol l0073                                               // 12e1: 26 73
    clc                                                     // 12e3: 18
    lda l0072                                               // 12e4: a5 72
    adc zp_drawscreen_x                                     // 12e6: 65 74
    sta l0072                                               // 12e8: 85 72
    lda l0073                                               // 12ea: a5 73
    adc zp_drawscreen_y                                     // 12ec: 65 75
    sta l0073                                               // 12ee: 85 73
    lda #$00                                                // 12f0: a9 00
    sta zp_drawscreen_counter                               // 12f2: 85 76
    jsr read_1_bit                                          // 12f4: 20 09 13
    jsr read_1_bit                                          // 12f7: 20 09 13
    jsr read_1_bit                                          // 12fa: 20 09 13
    jsr read_1_bit                                          // 12fd: 20 09 13
    jsr read_1_bit                                          // 1300: 20 09 13
    lda zp_drawscreen_counter                               // 1303: a5 76
    lsr                                                     // 1305: 4a
    lsr                                                     // 1306: 4a
    lsr                                                     // 1307: 4a
    rts                                                     // 1308: 60
// Referenced 5 times by $1300, $12f4, $12f7, $12fa, $12fd
read_1_bit:
    ldx l0072                                               // 1309: a6 72
    ldy l0073                                               // 130b: a4 73
    jsr bittest_from_levelstrip_data                        // 130d: 20 ac 12
    asl                                                     // 1310: 0a
    ror zp_drawscreen_counter                               // 1311: 66 76
    inc l0072                                               // 1313: e6 72
    bne read_1_bit_rts                                      // 1315: d0 02
    inc l0073                                               // 1317: e6 73
// Referenced 1 time by $1315
read_1_bit_rts:
    rts                                                     // 1319: 60
// Referenced 2 times by $1620, $1cdc
init_spirits:
    lda #$00                                                // 131a: a9 00
    ldx #$2f // '/'                                         // 131c: a2 2f
// Referenced 1 time by $1322
clear_spirits_loop:
    sta data_spirit_x,x                                     // 131e: 9d c8 29
    dex                                                     // 1321: ca
    bne clear_spirits_loop                                  // 1322: d0 fa
    lda #$00                                                // 1324: a9 00
    sta zp_temp_x                                           // 1326: 85 70
    sta zp_temp_y                                           // 1328: 85 71
// Referenced 2 times by $1344, $134c
scan_for_spirits_loop:
    ldx zp_temp_x                                           // 132a: a6 70
    ldy zp_temp_y                                           // 132c: a4 71
    jsr map_read                                            // 132e: 20 1a 11
    cmp #obj_spirit                                         // 1331: c9 09
    bne scan_for_spirits_next                               // 1333: d0 07
    ldx zp_temp_x                                           // 1335: a6 70
    ldy zp_temp_y                                           // 1337: a4 71
    jsr place_spirit2                                       // 1339: 20 5d 1f
// Referenced 1 time by $1333
scan_for_spirits_next:
    inc zp_temp_x                                           // 133c: e6 70
    lda zp_temp_x                                           // 133e: a5 70
    and #$1f                                                // 1340: 29 1f
    sta zp_temp_x                                           // 1342: 85 70
    bne scan_for_spirits_loop                               // 1344: d0 e4
    inc zp_temp_y                                           // 1346: e6 71
    lda zp_temp_y                                           // 1348: a5 71
    cmp #$20 // ' '                                         // 134a: c9 20
    bne scan_for_spirits_loop                               // 134c: d0 dc
    lda #$00                                                // 134e: a9 00
    sta zp_temp_x                                           // 1350: 85 70
// Referenced 1 time by $13a0
place_puzzlepieces_loop:
    ldx zp_temp_x                                           // 1352: a6 70
    lda data_puzzlepieces_level,x                           // 1354: bd f8 29
    bmi place_puzzlepieces_inlevel0                         // 1357: 30 17
    and #$7f                                                // 1359: 29 7f
    cmp zp_current_level                                    // 135b: c5 8b
    bne place_puzzlepieces_inlevel0                         // 135d: d0 11
    lda data_puzzlepieces_y,x                               // 135f: bd fa 29
    tay                                                     // 1362: a8
    lda data_puzzlepieces_x,x                               // 1363: bd f9 29
    tax                                                     // 1366: aa
    lda zp_temp_x                                           // 1367: a5 70
    lsr                                                     // 1369: 4a
    lsr                                                     // 136a: 4a
    adc #obj_firstpuzzlepiece // ' '                        // 136b: 69 20
    jsr map_store_obj                                       // 136d: 20 6b 11
// Referenced 2 times by $135d, $1357
place_puzzlepieces_inlevel0:
    ldx zp_temp_x                                           // 1370: a6 70
    lda zp_current_level                                    // 1372: a5 8b
    bne place_puzzlepieces_next                             // 1374: d0 21
    lda data_puzzlepieces_level,x                           // 1376: bd f8 29
    bpl place_puzzlepieces_next                             // 1379: 10 1c
    lda data_puzzlepieces_pos,x                             // 137b: bd fb 29
    pha                                                     // 137e: 48
    and #$0f                                                // 137f: 29 0f
    clc                                                     // 1381: 18
    adc #$08                                                // 1382: 69 08
    tax                                                     // 1384: aa
    pla                                                     // 1385: 68
    lsr                                                     // 1386: 4a
    lsr                                                     // 1387: 4a
    lsr                                                     // 1388: 4a
    lsr                                                     // 1389: 4a
    clc                                                     // 138a: 18
    adc #$18                                                // 138b: 69 18
    tay                                                     // 138d: a8
    lda zp_temp_x                                           // 138e: a5 70
    lsr                                                     // 1390: 4a
    lsr                                                     // 1391: 4a
    adc #$20 // ' '                                         // 1392: 69 20
    jsr map_store_obj                                       // 1394: 20 6b 11
// Referenced 2 times by $1379, $1374
place_puzzlepieces_next:
    lda zp_temp_x                                           // 1397: a5 70
    clc                                                     // 1399: 18
    adc #$04                                                // 139a: 69 04
    sta zp_temp_x                                           // 139c: 85 70
    cmp #$a8                                                // 139e: c9 a8
    bne place_puzzlepieces_loop                             // 13a0: d0 b0
    lda #<data_transporters // '@'                          // 13a2: a9 40
    sta zp_temp_x                                           // 13a4: 85 70
    lda #>data_transporters // '('                          // 13a6: a9 28
    sta zp_temp_y                                           // 13a8: 85 71
// Referenced 2 times by $13d9, $13d3
place_transporters_loop:
    ldy #$00                                                // 13aa: a0 00
    lda (zp_temp_x),y                                       // 13ac: b1 70
    bmi place_transporters_next                             // 13ae: 30 14
    and #$7f                                                // 13b0: 29 7f
    cmp zp_current_level                                    // 13b2: c5 8b
    bne place_transporters_next                             // 13b4: d0 0e
    ldy #$01                                                // 13b6: a0 01
    lda (zp_temp_x),y                                       // 13b8: b1 70
    tax                                                     // 13ba: aa
    iny                                                     // 13bb: c8
    lda (zp_temp_x),y                                       // 13bc: b1 70
    tay                                                     // 13be: a8
    lda #obj_transporter                                    // 13bf: a9 0b
    jsr map_store_obj                                       // 13c1: 20 6b 11
// Referenced 2 times by $13b4, $13ae
place_transporters_next:
    lda zp_temp_x                                           // 13c4: a5 70
    clc                                                     // 13c6: 18
    adc #$06                                                // 13c7: 69 06
    sta zp_temp_x                                           // 13c9: 85 70
    lda zp_temp_y                                           // 13cb: a5 71
    adc #$00                                                // 13cd: 69 00
    sta zp_temp_y                                           // 13cf: 85 71
    cmp #>data_transporters_end // ')'                      // 13d1: c9 29
    bne place_transporters_loop                             // 13d3: d0 d5
    lda zp_temp_x                                           // 13d5: a5 70
    cmp #<data_transporters_end                             // 13d7: c9 c0
    bne place_transporters_loop                             // 13d9: d0 cf
    rts                                                     // 13db: 60
// Start the music and draw the screen from the centre out
// Referenced 3 times by $1d11, $23fa, $25ad
reenter_game:
    jsr music_start                                         // 13dc: 20 a2 03
    nop                                                     // 13df: ea
// Referenced 1 time by $1452
redraw_from_centre_loop:
    lda zp_screen_topleft_x                                 // 13e0: a5 8c
    clc                                                     // 13e2: 18
    adc #$0f                                                // 13e3: 69 0f
    sec                                                     // 13e5: 38
    sbc l0078                                               // 13e6: e5 78
    sta zp_drawscreen_x                                     // 13e8: 85 74
    lda zp_screen_topleft_x                                 // 13ea: a5 8c
    clc                                                     // 13ec: 18
    adc #$10                                                // 13ed: 69 10
    clc                                                     // 13ef: 18
    adc l0078                                               // 13f0: 65 78
    sta zp_drawscreen_y                                     // 13f2: 85 75
    lda zp_screen_topleft_y                                 // 13f4: a5 8d
    clc                                                     // 13f6: 18
    adc #$0f                                                // 13f7: 69 0f
    sec                                                     // 13f9: 38
    sbc l0078                                               // 13fa: e5 78
    sta zp_drawscreen_counter                               // 13fc: 85 76
    lda zp_screen_topleft_y                                 // 13fe: a5 8d
    clc                                                     // 1400: 18
    adc #$10                                                // 1401: 69 10
    clc                                                     // 1403: 18
    adc l0078                                               // 1404: 65 78
    sta l0077                                               // 1406: 85 77
// Referenced 1 time by $1423
redraw_from_centre_loop2:
    ldx zp_drawscreen_x                                     // 1408: a6 74
    ldy zp_drawscreen_counter                               // 140a: a4 76
    jsr lookup_subtile_image_data                           // 140c: 20 d1 10
    jsr draw_subtile_at_coords                              // 140f: 20 ba 11
    ldx zp_drawscreen_x                                     // 1412: a6 74
    ldy l0077                                               // 1414: a4 77
    jsr lookup_subtile_image_data                           // 1416: 20 d1 10
    jsr draw_subtile_at_coords                              // 1419: 20 ba 11
    inc zp_drawscreen_x                                     // 141c: e6 74
    ldx zp_drawscreen_x                                     // 141e: a6 74
    dex                                                     // 1420: ca
    cpx zp_drawscreen_y                                     // 1421: e4 75
    bne redraw_from_centre_loop2                            // 1423: d0 e3
    lda zp_screen_topleft_x                                 // 1425: a5 8c
    clc                                                     // 1427: 18
    adc #$0f                                                // 1428: 69 0f
    sec                                                     // 142a: 38
    sbc l0078                                               // 142b: e5 78
    sta zp_drawscreen_x                                     // 142d: 85 74
// Referenced 1 time by $144a
redraw_from_centre_loop3:
    ldx zp_drawscreen_x                                     // 142f: a6 74
    ldy zp_drawscreen_counter                               // 1431: a4 76
    jsr lookup_subtile_image_data                           // 1433: 20 d1 10
    jsr draw_subtile_at_coords                              // 1436: 20 ba 11
    ldx zp_drawscreen_y                                     // 1439: a6 75
    ldy zp_drawscreen_counter                               // 143b: a4 76
    jsr lookup_subtile_image_data                           // 143d: 20 d1 10
    jsr draw_subtile_at_coords                              // 1440: 20 ba 11
    inc zp_drawscreen_counter                               // 1443: e6 76
    ldx zp_drawscreen_counter                               // 1445: a6 76
    dex                                                     // 1447: ca
    cpx l0077                                               // 1448: e4 77
    bne redraw_from_centre_loop3                            // 144a: d0 e3
    inc l0078                                               // 144c: e6 78
    lda l0078                                               // 144e: a5 78
    cmp #$10                                                // 1450: c9 10
    bne redraw_from_centre_loop                             // 1452: d0 8c
    rts                                                     // 1454: 60
// Referenced 3 times by $25b0, $25aa, $15d5
transporter_effect:
    lda #$00                                                // 1455: a9 00
    sta l0078                                               // 1457: 85 78
// Referenced 1 time by $14cd
transporter_effect_size_loop:
    lda zp_screen_topleft_x                                 // 1459: a5 8c
    clc                                                     // 145b: 18
    adc #$0f                                                // 145c: 69 0f
    sec                                                     // 145e: 38
    sbc l0078                                               // 145f: e5 78
    sta zp_drawscreen_x                                     // 1461: 85 74
    lda zp_screen_topleft_x                                 // 1463: a5 8c
    clc                                                     // 1465: 18
    adc #$10                                                // 1466: 69 10
    clc                                                     // 1468: 18
    adc l0078                                               // 1469: 65 78
    sta zp_drawscreen_y                                     // 146b: 85 75
    lda zp_screen_topleft_y                                 // 146d: a5 8d
    clc                                                     // 146f: 18
    adc #$0f                                                // 1470: 69 0f
    sec                                                     // 1472: 38
    sbc l0078                                               // 1473: e5 78
    sta zp_drawscreen_counter                               // 1475: 85 76
    lda zp_screen_topleft_y                                 // 1477: a5 8d
    clc                                                     // 1479: 18
    adc #$10                                                // 147a: 69 10
    clc                                                     // 147c: 18
    adc l0078                                               // 147d: 65 78
    sta l0077                                               // 147f: 85 77
// Referenced 1 time by $149a
transporter_effect_horiz_loop:
    ldx zp_drawscreen_x                                     // 1481: a6 74
    ldy zp_drawscreen_counter                               // 1483: a4 76
    lda #$09                                                // 1485: a9 09
    jsr draw_subtile_at_coords                              // 1487: 20 ba 11
    ldx zp_drawscreen_x                                     // 148a: a6 74
    ldy l0077                                               // 148c: a4 77
    lda #$0e                                                // 148e: a9 0e
    jsr draw_subtile_at_coords                              // 1490: 20 ba 11
    inc zp_drawscreen_x                                     // 1493: e6 74
    ldx zp_drawscreen_x                                     // 1495: a6 74
    dex                                                     // 1497: ca
    cpx zp_drawscreen_y                                     // 1498: e4 75
    bne transporter_effect_horiz_loop                       // 149a: d0 e5
    lda zp_screen_topleft_x                                 // 149c: a5 8c
    clc                                                     // 149e: 18
    adc #$0f                                                // 149f: 69 0f
    sec                                                     // 14a1: 38
    sbc l0078                                               // 14a2: e5 78
    sta zp_drawscreen_x                                     // 14a4: 85 74
// Referenced 1 time by $14c2
transporter_effect_vert_loop:
    ldx zp_drawscreen_x                                     // 14a6: a6 74
    ldy zp_drawscreen_counter                               // 14a8: a4 76
    lda #$0b                                                // 14aa: a9 0b
    jsr draw_subtile_at_coords                              // 14ac: 20 ba 11
    ldx zp_drawscreen_y                                     // 14af: a6 75
    ldy zp_drawscreen_counter                               // 14b1: a4 76
    lda #$0c                                                // 14b3: a9 0c
    jsr draw_subtile_at_coords                              // 14b5: 20 ba 11
    jsr transporter_effect_corners                          // 14b8: 20 d0 14
    inc zp_drawscreen_counter                               // 14bb: e6 76
    ldy zp_drawscreen_counter                               // 14bd: a4 76
    dey                                                     // 14bf: 88
    cpy l0077                                               // 14c0: c4 77
    bne transporter_effect_vert_loop                        // 14c2: d0 e2
    jsr transporter_sound                                   // 14c4: 20 1c 15
    inc l0078                                               // 14c7: e6 78
    lda l0078                                               // 14c9: a5 78
    cmp #$10                                                // 14cb: c9 10
    bne transporter_effect_size_loop                        // 14cd: d0 8a
    rts                                                     // 14cf: 60
// Referenced 1 time by $14b8
transporter_effect_corners:
    lda zp_screen_topleft_x                                 // 14d0: a5 8c
    clc                                                     // 14d2: 18
    adc #$0f                                                // 14d3: 69 0f
    sec                                                     // 14d5: 38
    sbc l0078                                               // 14d6: e5 78
    sta zp_temp_x                                           // 14d8: 85 70
    lda zp_screen_topleft_x                                 // 14da: a5 8c
    clc                                                     // 14dc: 18
    adc #$10                                                // 14dd: 69 10
    clc                                                     // 14df: 18
    adc l0078                                               // 14e0: 65 78
    sta zp_temp_y                                           // 14e2: 85 71
    lda zp_screen_topleft_y                                 // 14e4: a5 8d
    clc                                                     // 14e6: 18
    adc #$0f                                                // 14e7: 69 0f
    sec                                                     // 14e9: 38
    sbc l0078                                               // 14ea: e5 78
    sta l0072                                               // 14ec: 85 72
    lda zp_screen_topleft_y                                 // 14ee: a5 8d
    clc                                                     // 14f0: 18
    adc #$10                                                // 14f1: 69 10
    clc                                                     // 14f3: 18
    adc l0078                                               // 14f4: 65 78
    sta l0073                                               // 14f6: 85 73
    ldx zp_temp_x                                           // 14f8: a6 70
    ldy l0072                                               // 14fa: a4 72
    lda #$08                                                // 14fc: a9 08
    jsr draw_subtile_at_coords                              // 14fe: 20 ba 11
    ldx zp_temp_x                                           // 1501: a6 70
    ldy l0073                                               // 1503: a4 73
    lda #$0d                                                // 1505: a9 0d
    jsr draw_subtile_at_coords                              // 1507: 20 ba 11
    ldx zp_temp_y                                           // 150a: a6 71
    ldy l0072                                               // 150c: a4 72
    lda #$0a                                                // 150e: a9 0a
    jsr draw_subtile_at_coords                              // 1510: 20 ba 11
    ldx zp_temp_y                                           // 1513: a6 71
    ldy l0073                                               // 1515: a4 73
    lda #$0f                                                // 1517: a9 0f
    jmp draw_subtile_at_coords                              // 1519: 4c ba 11
// Referenced 1 time by $14c4
transporter_sound:
    lda #$11                                                // 151c: a9 11
    sta l0000                                               // 151e: 85 00
    lda l0078                                               // 1520: a5 78
    asl                                                     // 1522: 0a
    tax                                                     // 1523: aa
    ldy #$02                                                // 1524: a0 02
    lda #$01                                                // 1526: a9 01
    jmp sound_play                                          // 1528: 4c 69 0f
// Referenced 1 time by $1ded
push_left:
    ldx repton_x                                            // 152b: ae f8 0b
    ldy repton_y                                            // 152e: ac f9 0b
    dex                                                     // 1531: ca
    lda #obj_empty                                          // 1532: a9 02
    jsr map_write                                           // 1534: 20 7d 11
    ldx repton_x                                            // 1537: ae f8 0b
    ldy repton_y                                            // 153a: ac f9 0b
    dex                                                     // 153d: ca
    dex                                                     // 153e: ca
    lda l0073                                               // 153f: a5 73
    jmp map_write                                           // 1541: 4c 7d 11
// Referenced 1 time by $1e12
push_right:
    ldx repton_x                                            // 1544: ae f8 0b
    ldy repton_y                                            // 1547: ac f9 0b
    inx                                                     // 154a: e8
    lda #obj_empty                                          // 154b: a9 02
    jsr map_write                                           // 154d: 20 7d 11
    ldx repton_x                                            // 1550: ae f8 0b
    ldy repton_y                                            // 1553: ac f9 0b
    inx                                                     // 1556: e8
    inx                                                     // 1557: e8
    lda zp_drawscreen_x                                     // 1558: a5 74
    jmp map_write                                           // 155a: 4c 7d 11
// Referenced 1 time by $1edb
collect_diamond:
    lda #obj_empty                                          // 155d: a9 02
    ldy #$00                                                // 155f: a0 00
    sta (zp_ptr),y                                          // 1561: 91 0a
    lda #$01                                                // 1563: a9 01
    sta l0000                                               // 1565: 85 00
    lda #$01                                                // 1567: a9 01
    ldx #$c8                                                // 1569: a2 c8
    ldy #$01                                                // 156b: a0 01
    jsr sound_play                                          // 156d: 20 69 0f
    jsr decrement_remaining_diamonds                        // 1570: 20 70 25
    jmp after_hit_checks                                    // 1573: 4c 15 1f
// Referenced 1 time by $1ee2
collect_key:
    lda #$10                                                // 1576: a9 10
    sta l0000                                               // 1578: 85 00
    lda #$f8                                                // 157a: a9 f8
    ldx #$00                                                // 157c: a2 00
    ldy #$03                                                // 157e: a0 03
    jsr sound_play                                          // 1580: 20 69 0f
    lda #obj_empty                                          // 1583: a9 02
    ldy #$00                                                // 1585: a0 00
    sta (zp_ptr),y                                          // 1587: 91 0a
    lda #$00                                                // 1589: a9 00
    sta zp_temp_x                                           // 158b: 85 70
    sta zp_temp_y                                           // 158d: 85 71
// Referenced 2 times by $15af, $15a7
collect_key_loop:
    ldx zp_temp_x                                           // 158f: a6 70
    ldy zp_temp_y                                           // 1591: a4 71
    jsr map_read                                            // 1593: 20 1a 11
    cmp #obj_safe                                           // 1596: c9 0d
    bne collect_key_loop_next                               // 1598: d0 05
    lda #obj_diamond                                        // 159a: a9 06
    jsr map_write                                           // 159c: 20 7d 11
// Referenced 1 time by $1598
collect_key_loop_next:
    inc zp_temp_x                                           // 159f: e6 70
    lda zp_temp_x                                           // 15a1: a5 70
    and #$1f                                                // 15a3: 29 1f
    sta zp_temp_x                                           // 15a5: 85 70
    bne collect_key_loop                                    // 15a7: d0 e6
    inc zp_temp_y                                           // 15a9: e6 71
    lda zp_temp_y                                           // 15ab: a5 71
    cmp #$20 // ' '                                         // 15ad: c9 20
    bne collect_key_loop                                    // 15af: d0 de
    jmp after_hit_checks                                    // 15b1: 4c 15 1f
// Referenced 1 time by $1efe
enter_transporter:
    lda #obj_empty                                          // 15b4: a9 02
    ldy #$00                                                // 15b6: a0 00
    sta (zp_ptr),y                                          // 15b8: 91 0a
    lda zp_current_level                                    // 15ba: a5 8b
    bne lookup_transporter                                  // 15bc: d0 17
    ldx #$00                                                // 15be: a2 00
// Referenced 1 time by $15d3
save_level_0_state:
    lda mapdata1,x                                          // 15c0: bd 00 04
    sta savedlevel0data1,x                                  // 15c3: 9d 00 09
    lda mapdata2,x                                          // 15c6: bd 00 05
    sta savedlevel0data2,x                                  // 15c9: 9d 00 0a
    lda mapdata3,x                                          // 15cc: bd 00 06
    sta savedlevel0data3,x                                  // 15cf: 9d 00 0c
    inx                                                     // 15d2: e8
    bne save_level_0_state                                  // 15d3: d0 eb
// Referenced 1 time by $15bc
lookup_transporter:
    jsr transporter_effect                                  // 15d5: 20 55 14
    lda #<data_transporters // '@'                          // 15d8: a9 40
    sta zp_rock_curvedness__transporters_ptr                // 15da: 85 6e
    lda #>data_transporters // '('                          // 15dc: a9 28
    sta zp_rock_type__puzzlepiece_offset                    // 15de: 85 6f
    lda #$00                                                // 15e0: a9 00
    sta zp_transporters_count                               // 15e2: 85 6d
// Referenced 1 time by $1639
lookup_transporter_loop:
    ldy #$00                                                // 15e4: a0 00
    lda (zp_rock_curvedness__transporters_ptr),y            // 15e6: b1 6e
    bmi lookup_transporter_loop_next                        // 15e8: 30 3c
    and #$7f                                                // 15ea: 29 7f
    cmp zp_current_level                                    // 15ec: c5 8b
    bne lookup_transporter_loop_next                        // 15ee: d0 36
    ldy #$01                                                // 15f0: a0 01
    lda (zp_rock_curvedness__transporters_ptr),y            // 15f2: b1 6e
    cmp repton_x                                            // 15f4: cd f8 0b
    bne lookup_transporter_loop_next                        // 15f7: d0 2d
    ldy #$02                                                // 15f9: a0 02
    lda (zp_rock_curvedness__transporters_ptr),y            // 15fb: b1 6e
    cmp repton_y                                            // 15fd: cd f9 0b
    bne lookup_transporter_loop_next                        // 1600: d0 24
    ldy #$03                                                // 1602: a0 03
    lda (zp_rock_curvedness__transporters_ptr),y            // 1604: b1 6e
    jmp found_transporter_in_table                          // 1606: 4c 99 33
// Referenced 1 time by $33a0
take_transporter:
    lda (zp_rock_curvedness__transporters_ptr),y            // 1609: b1 6e
    sta l0088                                               // 160b: 85 88
    iny                                                     // 160d: c8
    lda (zp_rock_curvedness__transporters_ptr),y            // 160e: b1 6e
    sta l0089                                               // 1610: 85 89
    ldy #$00                                                // 1612: a0 00
    lda (zp_rock_curvedness__transporters_ptr),y            // 1614: b1 6e
    ora #$80                                                // 1616: 09 80
    sta (zp_rock_curvedness__transporters_ptr),y            // 1618: 91 6e
    ldx #$ff                                                // 161a: a2 ff
    txs                                                     // 161c: 9a
    jsr new_level                                           // 161d: 20 41 12
    jsr init_spirits                                        // 1620: 20 1a 13
    jmp after_transporter                                   // 1623: 4c 00 24
// Referenced 4 times by $15e8, $1600, $15ee, $15f7
lookup_transporter_loop_next:
    lda zp_rock_curvedness__transporters_ptr                // 1626: a5 6e
    clc                                                     // 1628: 18
    adc #$06                                                // 1629: 69 06
    sta zp_rock_curvedness__transporters_ptr                // 162b: 85 6e
    lda zp_rock_type__puzzlepiece_offset                    // 162d: a5 6f
    adc #$00                                                // 162f: 69 00
    sta zp_rock_type__puzzlepiece_offset                    // 1631: 85 6f
    inc zp_transporters_count                               // 1633: e6 6d
    lda zp_transporters_count                               // 1635: a5 6d
    cmp #$40 // '@'                                         // 1637: c9 40
    bne lookup_transporter_loop                             // 1639: d0 a9
    jmp after_hit_checks                                    // 163b: 4c 15 1f
// Referenced 1 time by $1f05
collect_puzzlepiece:
    lda #$10                                                // 163e: a9 10
    sta l0000                                               // 1640: 85 00
    lda #$01                                                // 1642: a9 01
    tax                                                     // 1644: aa
    tay                                                     // 1645: a8
    jsr sound_play                                          // 1646: 20 69 0f
    lda #$00                                                // 1649: a9 00
    sta zp_rock_type__puzzlepiece_offset                    // 164b: 85 6f
// Referenced 1 time by $16ae
collect_puzzlepiece_loop:
    ldx zp_rock_type__puzzlepiece_offset                    // 164d: a6 6f
    lda data_puzzlepieces_level,x                           // 164f: bd f8 29
    bmi collect_puzzlepiece_loop_next                       // 1652: 30 51
    and #$7f                                                // 1654: 29 7f
    cmp zp_current_level                                    // 1656: c5 8b
    bne collect_puzzlepiece_loop_next                       // 1658: d0 4b
    lda data_puzzlepieces_x,x                               // 165a: bd f9 29
    cmp repton_x                                            // 165d: cd f8 0b
    bne collect_puzzlepiece_loop_next                       // 1660: d0 43
    lda data_puzzlepieces_y,x                               // 1662: bd fa 29
    cmp repton_y                                            // 1665: cd f9 0b
    bne collect_puzzlepiece_loop_next                       // 1668: d0 3b
    lda zp_current_level                                    // 166a: a5 8b
    ora #$80                                                // 166c: 09 80
    sta data_puzzlepieces_level,x                           // 166e: 9d f8 29
    ldy #$00                                                // 1671: a0 00
    lda #obj_empty                                          // 1673: a9 02
    sta (zp_ptr),y                                          // 1675: 91 0a
    lda zp_current_level                                    // 1677: a5 8b
    bne collect_puzzlepiece_loop_next                       // 1679: d0 2a
    lda data_puzzlepieces_pos,x                             // 167b: bd fb 29
    pha                                                     // 167e: 48
    lsr                                                     // 167f: 4a
    lsr                                                     // 1680: 4a
    lsr                                                     // 1681: 4a
    lsr                                                     // 1682: 4a
    clc                                                     // 1683: 18
    adc #$18                                                // 1684: 69 18
    tay                                                     // 1686: a8
    pla                                                     // 1687: 68
    and #$0f                                                // 1688: 29 0f
    clc                                                     // 168a: 18
    adc #$08                                                // 168b: 69 08
    tax                                                     // 168d: aa
    lda zp_rock_type__puzzlepiece_offset                    // 168e: a5 6f
    lsr                                                     // 1690: 4a
    lsr                                                     // 1691: 4a
    clc                                                     // 1692: 18
    adc #obj_firstpuzzlepiece // ' '                        // 1693: 69 20
    jsr map_write                                           // 1695: 20 7d 11
    lda #$00                                                // 1698: a9 00
    sta l0000                                               // 169a: 85 00
    lda #$01                                                // 169c: a9 01
    ldy #$04                                                // 169e: a0 04
    ldx #$00                                                // 16a0: a2 00
    jsr sound_play                                          // 16a2: 20 69 0f
// Referenced 5 times by $1660, $1668, $1652, $1658, $1679
collect_puzzlepiece_loop_next:
    lda zp_rock_type__puzzlepiece_offset                    // 16a5: a5 6f
    clc                                                     // 16a7: 18
    adc #$04                                                // 16a8: 69 04
    sta zp_rock_type__puzzlepiece_offset                    // 16aa: 85 6f
    cmp #42*4                                               // 16ac: c9 a8
    bne collect_puzzlepiece_loop                            // 16ae: d0 9d
    jmp after_hit_checks                                    // 16b0: 4c 15 1f
// Referenced 1 time by $1e81
scan_rocks:
    lda #$1f                                                // 16b3: a9 1f
    sta zp_rock_x                                           // 16b5: 85 60
    lda #$1e                                                // 16b7: a9 1e
    sta zp_rock_y                                           // 16b9: 85 61
    lda #$07                                                // 16bb: a9 07
    sta zp_rock_addr_hi                                     // 16bd: 85 63
    lda #$de                                                // 16bf: a9 de
    sta zp_rock_addr                                        // 16c1: 85 62
// Referenced 2 times by $16e9, $16ed
scan_rocks_loop:
    ldy #$01                                                // 16c3: a0 01
    lda (zp_rock_addr),y                                    // 16c5: b1 62
    cmp #obj_rock                                           // 16c7: c9 0e
    bcc scan_rocks_next                                     // 16c9: 90 07
    cmp #obj_wall                                           // 16cb: c9 10
    bcs scan_rocks_next                                     // 16cd: b0 03
    jsr rock_move                                           // 16cf: 20 55 19
// Referenced 2 times by $16c9, $16cd
scan_rocks_next:
    lda zp_rock_addr                                        // 16d2: a5 62
    sec                                                     // 16d4: 38
    sbc #$01                                                // 16d5: e9 01
    sta zp_rock_addr                                        // 16d7: 85 62
    lda zp_rock_addr_hi                                     // 16d9: a5 63
    sbc #$00                                                // 16db: e9 00
    sta zp_rock_addr_hi                                     // 16dd: 85 63
    dec zp_rock_x                                           // 16df: c6 60
    lda zp_rock_x                                           // 16e1: a5 60
    and #$1f                                                // 16e3: 29 1f
    sta zp_rock_x                                           // 16e5: 85 60
    cmp #$1f                                                // 16e7: c9 1f
    bne scan_rocks_loop                                     // 16e9: d0 d8
    dec zp_rock_y                                           // 16eb: c6 61
    bpl scan_rocks_loop                                     // 16ed: 10 d4
    rts                                                     // 16ef: 60
// Referenced 1 time by $1e87
update_meteors:
    lda zp_current_level                                    // 16f0: a5 8b
    cmp #$0c                                                // 16f2: c9 0c
    bcs update_meteors_rts                                  // 16f4: b0 67
    and #$01                                                // 16f6: 29 01
    bne update_meteors_rts                                  // 16f8: d0 63
    lda #$00                                                // 16fa: a9 00
    sta zp_rock_type__puzzlepiece_offset                    // 16fc: 85 6f
// Referenced 1 time by $175b
update_meteors_loop:
    ldx zp_rock_type__puzzlepiece_offset                    // 16fe: a6 6f
    lda data_meteors_x,x                                    // 1700: bd 10 0b
    bpl update_meteors_move                                 // 1703: 10 03
    jsr spawn_meteor                                        // 1705: 20 5e 17
// Referenced 1 time by $1703
update_meteors_move:
    lda data_meteors_y,x                                    // 1708: bd 11 0b
    tay                                                     // 170b: a8
    lda data_meteors_x,x                                    // 170c: bd 10 0b
    tax                                                     // 170f: aa
    lda #$0e                                                // 1710: a9 0e
    jsr erase_sprite                                        // 1712: 20 76 10
    ldx zp_rock_type__puzzlepiece_offset                    // 1715: a6 6f
    lda data_meteors_y,x                                    // 1717: bd 11 0b
    clc                                                     // 171a: 18
    adc #$01                                                // 171b: 69 01
    sta data_meteors_y,x                                    // 171d: 9d 11 0b
    cmp #$ff                                                // 1720: c9 ff
    bne update_meteors_check_hit_repton                     // 1722: d0 03
    jsr spawn_meteor                                        // 1724: 20 5e 17
// Referenced 1 time by $1722
update_meteors_check_hit_repton:
    lda data_meteors_x,x                                    // 1727: bd 10 0b
    sec                                                     // 172a: 38
    sbc zp_screen_topleft_x                                 // 172b: e5 8c
    cmp #$12                                                // 172d: c9 12
    bcs update_meteors_not_hit_repton                       // 172f: b0 15
    cmp #$0d                                                // 1731: c9 0d
    bcc update_meteors_not_hit_repton                       // 1733: 90 11
    lda data_meteors_y,x                                    // 1735: bd 11 0b
    sec                                                     // 1738: 38
    sbc zp_screen_topleft_y                                 // 1739: e5 8d
    cmp #$12                                                // 173b: c9 12
    bcs update_meteors_not_hit_repton                       // 173d: b0 07
    cmp #$0e                                                // 173f: c9 0e
    bcc update_meteors_not_hit_repton                       // 1741: 90 03
    jmp death                                               // 1743: 4c ee 1b
// Referenced 4 times by $1741, $1733, $173d, $172f
update_meteors_not_hit_repton:
    lda data_meteors_y,x                                    // 1746: bd 11 0b
    tay                                                     // 1749: a8
    lda data_meteors_x,x                                    // 174a: bd 10 0b
    tax                                                     // 174d: aa
    lda #sprite_meteor                                      // 174e: a9 0e
    jsr draw_sprite                                         // 1750: 20 f5 0f
    inc zp_rock_type__puzzlepiece_offset                    // 1753: e6 6f
    inc zp_rock_type__puzzlepiece_offset                    // 1755: e6 6f
    lda zp_rock_type__puzzlepiece_offset                    // 1757: a5 6f
    cmp #$10                                                // 1759: c9 10
    bne update_meteors_loop                                 // 175b: d0 a1
// Referenced 2 times by $16f8, $16f4
update_meteors_rts:
    rts                                                     // 175d: 60
// Referenced 2 times by $1724, $1705
spawn_meteor:
    jsr random                                              // 175e: 20 59 0f
    and #$07                                                // 1761: 29 07
    clc                                                     // 1763: 18
    adc #$e5                                                // 1764: 69 e5
    sta data_meteors_y,x                                    // 1766: 9d 11 0b
// Referenced 1 time by $1779
spawn_meteor_choose_x:
    jsr random                                              // 1769: 20 59 0f
    and #$3f // '?'                                         // 176c: 29 3f
    sec                                                     // 176e: 38
    sbc #$10                                                // 176f: e9 10
    clc                                                     // 1771: 18
    adc zp_screen_topleft_x                                 // 1772: 65 8c
    sta data_meteors_x,x                                    // 1774: 9d 10 0b
    cmp #$7f                                                // 1777: c9 7f
    bcs spawn_meteor_choose_x                               // 1779: b0 ee
    rts                                                     // 177b: 60
// Referenced 1 time by $1a3d
spawn_monster:
    stx zp_temp_x                                           // 177c: 86 70
    sty zp_temp_y                                           // 177e: 84 71
    lda #obj_empty                                          // 1780: a9 02
    jsr map_write                                           // 1782: 20 7d 11
    ldx #$00                                                // 1785: a2 00
// Referenced 1 time by $17be
find_free_monster_loop:
    lda data_monsters_alive,x                               // 1787: bd ed 29
    bmi find_free_monster_loop_next                         // 178a: 30 2b
    lda zp_temp_x                                           // 178c: a5 70
    asl                                                     // 178e: 0a
    asl                                                     // 178f: 0a
    sta data_monsters_x,x                                   // 1790: 9d e8 29
    lda zp_temp_y                                           // 1793: a5 71
    asl                                                     // 1795: 0a
    asl                                                     // 1796: 0a
    sta data_monsters_y,x                                   // 1797: 9d e9 29
    lda #$00                                                // 179a: a9 00
    sta data_monsters_vel_x,x                               // 179c: 9d ea 29
    sta data_monsters_vel_y,x                               // 179f: 9d eb 29
    sta data_monsters_spawntimer,x                          // 17a2: 9d ec 29
    lda #$80                                                // 17a5: a9 80
    sta data_monsters_alive,x                               // 17a7: 9d ed 29
    lda #$10                                                // 17aa: a9 10
    sta l0000                                               // 17ac: 85 00
    lda #$f1                                                // 17ae: a9 f1
    ldx #$02                                                // 17b0: a2 02
    ldy #$03                                                // 17b2: a0 03
    jmp sound_play                                          // 17b4: 4c 69 0f
// Referenced 1 time by $178a
find_free_monster_loop_next:
    txa                                                     // 17b7: 8a
    clc                                                     // 17b8: 18
    adc #$08                                                // 17b9: 69 08
    tax                                                     // 17bb: aa
    cpx #$10                                                // 17bc: e0 10
    bne find_free_monster_loop                              // 17be: d0 c7
    rts                                                     // 17c0: 60
// Referenced 1 time by $1e7e
move_monsters:
    lda #$00                                                // 17c1: a9 00
    sta zp_rock_type__puzzlepiece_offset                    // 17c3: 85 6f
// Referenced 1 time by $182f
move_monsters_loop:
    ldx zp_rock_type__puzzlepiece_offset                    // 17c5: a6 6f
    lda data_monsters_alive,x                               // 17c7: bd ed 29
    beq move_monsters_next                                  // 17ca: f0 5a
    lda data_monsters_spawntimer,x                          // 17cc: bd ec 29
    bmi move_monsters_alive                                 // 17cf: 30 1d
    clc                                                     // 17d1: 18
    adc #$02                                                // 17d2: 69 02
    sta data_monsters_spawntimer,x                          // 17d4: 9d ec 29
    cmp #$40 // '@'                                         // 17d7: c9 40
    bcs move_monsters_newborn                               // 17d9: b0 08
// Cracked egg stage
    lda #sprite_crackedegg                                  // 17db: a9 09
    jsr draw_monster                                        // 17dd: 20 84 18
    jmp move_monsters_next                                  // 17e0: 4c 26 18
// Newborn standing still stage
// Referenced 1 time by $17d9
move_monsters_newborn:
    jsr erase_monster                                       // 17e3: 20 93 18
    lda #$0f                                                // 17e6: a9 0f
    jsr draw_monster                                        // 17e8: 20 84 18
    jmp move_monsters_next                                  // 17eb: 4c 26 18
// Referenced 1 time by $17cf
move_monsters_alive:
    jsr erase_current_monster                               // 17ee: 20 91 33
    jsr move_monster2                                       // 17f1: 20 b8 33
    lda l007e                                               // 17f4: a5 7e
    lsr                                                     // 17f6: 4a
    lsr                                                     // 17f7: 4a
    and #$01                                                // 17f8: 29 01
    clc                                                     // 17fa: 18
    adc #sprite_monster0                                    // 17fb: 69 10
    jsr draw_monster                                        // 17fd: 20 84 18
    ldx zp_rock_type__puzzlepiece_offset                    // 1800: a6 6f
    jsr check_monster_rock_death                            // 1802: 20 32 18
    ldx zp_rock_type__puzzlepiece_offset                    // 1805: a6 6f
    lda data_monsters_x,x                                   // 1807: bd e8 29
    sec                                                     // 180a: 38
    sbc zp_screen_topleft_x                                 // 180b: e5 8c
    cmp #$12                                                // 180d: c9 12
    bcs move_monsters_next                                  // 180f: b0 15
    cmp #$0b                                                // 1811: c9 0b
    bcc move_monsters_next                                  // 1813: 90 11
    lda data_monsters_y,x                                   // 1815: bd e9 29
    sec                                                     // 1818: 38
    sbc zp_screen_topleft_y                                 // 1819: e5 8d
    cmp #$12                                                // 181b: c9 12
    bcs move_monsters_next                                  // 181d: b0 07
    cmp #$0b                                                // 181f: c9 0b
    bcc move_monsters_next                                  // 1821: 90 03
    jmp death                                               // 1823: 4c ee 1b
// Referenced 7 times by $17e0, $1821, $17ca, $17eb, $180f, $1813, $181d
move_monsters_next:
    lda zp_rock_type__puzzlepiece_offset                    // 1826: a5 6f
    clc                                                     // 1828: 18
    adc #$08                                                // 1829: 69 08
    sta zp_rock_type__puzzlepiece_offset                    // 182b: 85 6f
    cmp #$10                                                // 182d: c9 10
    bne move_monsters_loop                                  // 182f: d0 94
    rts                                                     // 1831: 60
// Referenced 1 time by $1802
check_monster_rock_death:
    lda data_monsters_y,x                                   // 1832: bd e9 29
    lsr                                                     // 1835: 4a
    lsr                                                     // 1836: 4a
    tay                                                     // 1837: a8
    clc                                                     // 1838: 18
    lda data_monsters_x,x                                   // 1839: bd e8 29
    adc #$03                                                // 183c: 69 03
    lsr                                                     // 183e: 4a
    lsr                                                     // 183f: 4a
    tax                                                     // 1840: aa
    jsr map_read                                            // 1841: 20 1a 11
    cmp #obj_rock                                           // 1844: c9 0e
    beq kill_monster                                        // 1846: f0 23
    cmp #obj_egg                                            // 1848: c9 0f
    beq kill_monster                                        // 184a: f0 1f
    ldx zp_rock_type__puzzlepiece_offset                    // 184c: a6 6f
    lda data_monsters_y,x                                   // 184e: bd e9 29
    clc                                                     // 1851: 18
    adc #$03                                                // 1852: 69 03
    lsr                                                     // 1854: 4a
    lsr                                                     // 1855: 4a
    tay                                                     // 1856: a8
    lda data_monsters_x,x                                   // 1857: bd e8 29
    lsr                                                     // 185a: 4a
    lsr                                                     // 185b: 4a
    tax                                                     // 185c: aa
    jsr map_read                                            // 185d: 20 1a 11
    cmp #obj_rock                                           // 1860: c9 0e
    beq kill_monster                                        // 1862: f0 07
    cmp #obj_egg                                            // 1864: c9 0f
    beq kill_monster                                        // 1866: f0 03
    ldx zp_rock_type__puzzlepiece_offset                    // 1868: a6 6f
    rts                                                     // 186a: 60
// Referenced 4 times by $1866, $184a, $1862, $1846
kill_monster:
    ldx zp_rock_type__puzzlepiece_offset                    // 186b: a6 6f
    lda #$00                                                // 186d: a9 00
    sta data_monsters_alive,x                               // 186f: 9d ed 29
    lda #$10                                                // 1872: a9 10
    sta l0000                                               // 1874: 85 00
    lda #$01                                                // 1876: a9 01
    ldx #$05                                                // 1878: a2 05
    tay                                                     // 187a: a8
    jsr sound_play                                          // 187b: 20 69 0f
    jsr decrement_remaining_monsters                        // 187e: 20 84 25
    jmp erase_monster                                       // 1881: 4c 93 18
// Referenced 3 times by $17e8, $17fd, $17dd
draw_monster:
    pha                                                     // 1884: 48
    ldx zp_rock_type__puzzlepiece_offset                    // 1885: a6 6f
    lda data_monsters_y,x                                   // 1887: bd e9 29
    tay                                                     // 188a: a8
    lda data_monsters_x,x                                   // 188b: bd e8 29
    tax                                                     // 188e: aa
    pla                                                     // 188f: 68
    jmp draw_sprite                                         // 1890: 4c f5 0f
// Referenced 3 times by $1881, $17e3, $3396
erase_monster:
    ldx zp_rock_type__puzzlepiece_offset                    // 1893: a6 6f
    lda data_monsters_y,x                                   // 1895: bd e9 29
    tay                                                     // 1898: a8
    lda data_monsters_x,x                                   // 1899: bd e8 29
    tax                                                     // 189c: aa
    lda #$00                                                // 189d: a9 00
    jmp erase_sprite                                        // 189f: 4c 76 10
// Referenced 2 times by $18b3, $18ac
move_moster_done:
    jmp move_monster_applymovement                          // 18a2: 4c 3f 19
// Referenced 1 time by $33b8
move_monster:
    ldx zp_rock_type__puzzlepiece_offset                    // 18a5: a6 6f
    lda data_monsters_x,x                                   // 18a7: bd e8 29
    and #$03                                                // 18aa: 29 03
    bne move_moster_done                                    // 18ac: d0 f4
    lda data_monsters_y,x                                   // 18ae: bd e9 29
    and #$03                                                // 18b1: 29 03
    bne move_moster_done                                    // 18b3: d0 ed
    lda data_monsters_x,x                                   // 18b5: bd e8 29
    lsr                                                     // 18b8: 4a
    lsr                                                     // 18b9: 4a
    sta zp_temp_x                                           // 18ba: 85 70
    lda data_monsters_y,x                                   // 18bc: bd e9 29
    lsr                                                     // 18bf: 4a
    lsr                                                     // 18c0: 4a
    sta zp_temp_y                                           // 18c1: 85 71
    ldx zp_temp_x                                           // 18c3: a6 70
    ldy zp_temp_y                                           // 18c5: a4 71
    dey                                                     // 18c7: 88
    jsr map_read                                            // 18c8: 20 1a 11
    and #$7f                                                // 18cb: 29 7f
    sta l0072                                               // 18cd: 85 72
    ldx zp_temp_x                                           // 18cf: a6 70
    ldy zp_temp_y                                           // 18d1: a4 71
    inx                                                     // 18d3: e8
    jsr map_read                                            // 18d4: 20 1a 11
    and #$7f                                                // 18d7: 29 7f
    sta l0073                                               // 18d9: 85 73
    ldx zp_temp_x                                           // 18db: a6 70
    ldy zp_temp_y                                           // 18dd: a4 71
    iny                                                     // 18df: c8
    jsr map_read                                            // 18e0: 20 1a 11
    and #$7f                                                // 18e3: 29 7f
    sta zp_drawscreen_x                                     // 18e5: 85 74
    ldx zp_temp_x                                           // 18e7: a6 70
    ldy zp_temp_y                                           // 18e9: a4 71
    dex                                                     // 18eb: ca
    jsr map_read                                            // 18ec: 20 1a 11
    and #$7f                                                // 18ef: 29 7f
    sta zp_drawscreen_y                                     // 18f1: 85 75
    ldx zp_rock_type__puzzlepiece_offset                    // 18f3: a6 6f
    lda #$00                                                // 18f5: a9 00
    sta data_monsters_vel_x,x                               // 18f7: 9d ea 29
    sta data_monsters_vel_y,x                               // 18fa: 9d eb 29
    ldy #$00                                                // 18fd: a0 00
    jsr random                                              // 18ff: 20 59 0f
    bpl move_monster_maybe_updown                           // 1902: 10 1f
    lda zp_temp_x                                           // 1904: a5 70
    cmp repton_x                                            // 1906: cd f8 0b
    bcs move_monster_ifclear_left                           // 1909: b0 0a
    lda l0073                                               // 190b: a5 73
    cmp #$06                                                // 190d: c9 06
    bcs move_monster_maybe_updown                           // 190f: b0 12
    iny                                                     // 1911: c8
    jmp move_monster_leftright                              // 1912: 4c 1c 19
// Referenced 1 time by $1909
move_monster_ifclear_left:
    lda zp_drawscreen_y                                     // 1915: a5 75
    cmp #$06                                                // 1917: c9 06
    bcs move_monster_maybe_updown                           // 1919: b0 08
    dey                                                     // 191b: 88
// Referenced 1 time by $1912
move_monster_leftright:
    tya                                                     // 191c: 98
    sta data_monsters_vel_x,x                               // 191d: 9d ea 29
    jmp move_monster_applymovement                          // 1920: 4c 3f 19
// Referenced 3 times by $1919, $1902, $190f
move_monster_maybe_updown:
    lda zp_temp_y                                           // 1923: a5 71
    cmp repton_y                                            // 1925: cd f9 0b
    bcs move_monster_ifclear_up                             // 1928: b0 0a
    lda zp_drawscreen_x                                     // 192a: a5 74
    cmp #$06                                                // 192c: c9 06
    bcs move_monster_applymovement                          // 192e: b0 0f
    iny                                                     // 1930: c8
    jmp move_monster_updown                                 // 1931: 4c 3b 19
// Referenced 1 time by $1928
move_monster_ifclear_up:
    lda l0072                                               // 1934: a5 72
    cmp #$06                                                // 1936: c9 06
    bcs move_monster_applymovement                          // 1938: b0 05
    dey                                                     // 193a: 88
// Referenced 1 time by $1931
move_monster_updown:
    tya                                                     // 193b: 98
    sta data_monsters_vel_y,x                               // 193c: 9d eb 29
// Referenced 4 times by $1938, $1920, $18a2, $192e
move_monster_applymovement:
    lda data_monsters_x,x                                   // 193f: bd e8 29
    clc                                                     // 1942: 18
    adc data_monsters_vel_x,x                               // 1943: 7d ea 29
    sta data_monsters_x,x                                   // 1946: 9d e8 29
    lda data_monsters_y,x                                   // 1949: bd e9 29
    clc                                                     // 194c: 18
    adc data_monsters_vel_y,x                               // 194d: 7d eb 29
    sta data_monsters_y,x                                   // 1950: 9d e9 29
    rts                                                     // 1953: 60
// Referenced 2 times by $1982, $197b
rock_move_end:
    rts                                                     // 1954: 60
// Referenced 1 time by $16cf
rock_move:
    sta zp_rock_type__puzzlepiece_offset                    // 1955: 85 6f
// Read map square west
    ldy #$00                                                // 1957: a0 00
    lda (zp_rock_addr),y                                    // 1959: b1 62
    sta zp_rock_w__print_bcd_lo                             // 195b: 85 68
// Read map square east
    iny                                                     // 195d: c8
    iny                                                     // 195e: c8
    lda (zp_rock_addr),y                                    // 195f: b1 62
    sta zp_rock_e__print_bcd_mid                            // 1961: 85 69
// Read map square southwest
    ldy #$20 // ' '                                         // 1963: a0 20
    lda (zp_rock_addr),y                                    // 1965: b1 62
    sta zp_rock_sw__print_bcd_hi                            // 1967: 85 6a
// Read map square south
    iny                                                     // 1969: c8
    lda (zp_rock_addr),y                                    // 196a: b1 62
    sta zp_rock_s                                           // 196c: 85 6c
// Read map square southeast
    iny                                                     // 196e: c8
    lda (zp_rock_addr),y                                    // 196f: b1 62
    sta zp_rock_se__suppressleadingzerosflag                // 1971: 85 6b
    ldx zp_rock_s                                           // 1973: a6 6c
    cpx #obj_firstnonempty                                  // 1975: e0 03
    bcc rock_fall_down                                      // 1977: 90 43
    cpx #$1c                                                // 1979: e0 1c
    bcs rock_move_end                                       // 197b: b0 d7
    lda lut_curvedness,x                                    // 197d: bd 2e 0e
    cmp #$01                                                // 1980: c9 01
    beq rock_move_end                                       // 1982: f0 d0
    sta zp_rock_curvedness__transporters_ptr                // 1984: 85 6e
    cmp #$02                                                // 1986: c9 02
    beq rock_move_dont_fall_left                            // 1988: f0 03
    jsr rock_fall_left                                      // 198a: 20 97 19
// Referenced 1 time by $1988
rock_move_dont_fall_left:
    lda zp_rock_curvedness__transporters_ptr                // 198d: a5 6e
    cmp #$00                                                // 198f: c9 00
    beq rock_move_dont_fall_right                           // 1991: f0 03
    jsr rock_fall_right                                     // 1993: 20 dc 19
// Referenced 1 time by $1991
rock_move_dont_fall_right:
    rts                                                     // 1996: 60
// Referenced 1 time by $198a
rock_fall_left:
    lda zp_rock_w__print_bcd_lo                             // 1997: a5 68
    cmp #obj_firstnonempty                                  // 1999: c9 03
    bcs rock_fall_not                                       // 199b: b0 1e
    lda zp_rock_sw__print_bcd_hi                            // 199d: a5 6a
    cmp #obj_firstnonempty                                  // 199f: c9 03
    bcs rock_fall_not                                       // 19a1: b0 18
    lda zp_rock_x                                           // 19a3: a5 60
    beq rock_fall_not                                       // 19a5: f0 14
    ldx zp_rock_x                                           // 19a7: a6 60
    ldy zp_rock_y                                           // 19a9: a4 61
    lda #obj_empty                                          // 19ab: a9 02
    jsr map_write                                           // 19ad: 20 7d 11
// The rock doesn't actually fall here, strangely it just moves left
    ldx zp_rock_x                                           // 19b0: a6 60
    ldy zp_rock_y                                           // 19b2: a4 61
    dex                                                     // 19b4: ca
    lda zp_rock_type__puzzlepiece_offset                    // 19b5: a5 6f
    jsr rock_fall_move_and_set_curvedleft                   // 19b7: 20 55 21
    rts                                                     // 19ba: 60
// Referenced 6 times by $19e0, $19a1, $19a5, $19e6, $19ec, $199b
rock_fall_not:
    rts                                                     // 19bb: 60
// Referenced 1 time by $1977
rock_fall_down:
    ldx zp_rock_x                                           // 19bc: a6 60
    ldy zp_rock_y                                           // 19be: a4 61
    lda #obj_empty                                          // 19c0: a9 02
    jsr map_write                                           // 19c2: 20 7d 11
    ldx zp_rock_x                                           // 19c5: a6 60
    ldy zp_rock_y                                           // 19c7: a4 61
    iny                                                     // 19c9: c8
    lda zp_rock_type__puzzlepiece_offset                    // 19ca: a5 6f
    jsr map_write                                           // 19cc: 20 7d 11
// Read whatever is now under the rock
    ldy #$41 // 'A'                                         // 19cf: a0 41
    lda (zp_rock_addr),y                                    // 19d1: b1 62
    sta zp_rock_thinghit                                    // 19d3: 85 65
    lda zp_rock_x                                           // 19d5: a5 60
    sta zp_rock_thinghit_x                                  // 19d7: 85 66
    jmp rock_moved                                          // 19d9: 4c 12 1a
// Referenced 1 time by $1993
rock_fall_right:
    lda zp_rock_e__print_bcd_mid                            // 19dc: a5 69
    cmp #obj_firstnonempty                                  // 19de: c9 03
    bcs rock_fall_not                                       // 19e0: b0 d9
    lda zp_rock_se__suppressleadingzerosflag                // 19e2: a5 6b
    cmp #obj_firstnonempty                                  // 19e4: c9 03
    bcs rock_fall_not                                       // 19e6: b0 d3
    lda zp_rock_x                                           // 19e8: a5 60
    cmp #$1f                                                // 19ea: c9 1f
    beq rock_fall_not                                       // 19ec: f0 cd
    ldx zp_rock_x                                           // 19ee: a6 60
    ldy zp_rock_y                                           // 19f0: a4 61
    lda #obj_empty                                          // 19f2: a9 02
    jsr map_write                                           // 19f4: 20 7d 11
    ldx zp_rock_x                                           // 19f7: a6 60
    inx                                                     // 19f9: e8
    ldy zp_rock_y                                           // 19fa: a4 61
    iny                                                     // 19fc: c8
    lda zp_rock_type__puzzlepiece_offset                    // 19fd: a5 6f
    jsr map_write                                           // 19ff: 20 7d 11
// Read whatever is now under the rock
    ldy #$42 // 'B'                                         // 1a02: a0 42
    lda (zp_rock_addr),y                                    // 1a04: b1 62
    sta zp_rock_thinghit                                    // 1a06: 85 65
    ldx zp_rock_x                                           // 1a08: a6 60
    inx                                                     // 1a0a: e8
    stx zp_rock_thinghit_x                                  // 1a0b: 86 66
    nop                                                     // 1a0d: ea
    nop                                                     // 1a0e: ea
    nop                                                     // 1a0f: ea
    nop                                                     // 1a10: ea
    nop                                                     // 1a11: ea
// Referenced 1 time by $19d9
rock_moved:
    lda zp_rock_y                                           // 1a12: a5 61
    cmp #$1e                                                // 1a14: c9 1e
    beq rock_moved_no_death                                 // 1a16: f0 14
    lda #$10                                                // 1a18: a9 10
    sta l0000                                               // 1a1a: 85 00
    lda #$f8                                                // 1a1c: a9 f8
    ldx #$04                                                // 1a1e: a2 04
    ldy #$03                                                // 1a20: a0 03
    jsr sound_play                                          // 1a22: 20 69 0f
    lda zp_rock_thinghit                                    // 1a25: a5 65
    bpl rock_moved_no_death                                 // 1a27: 10 03
    jmp death                                               // 1a29: 4c ee 1b
// Referenced 2 times by $1a16, $1a27
rock_moved_no_death:
    lda zp_rock_type__puzzlepiece_offset                    // 1a2c: a5 6f
    cmp #obj_egg                                            // 1a2e: c9 0f
    bne rock_moved_no_egg_crack                             // 1a30: d0 0e
    lda zp_rock_thinghit                                    // 1a32: a5 65
    cmp #obj_firstnonempty                                  // 1a34: c9 03
    bcc rock_moved_no_egg_crack                             // 1a36: 90 08
    ldx zp_rock_thinghit_x                                  // 1a38: a6 66
    ldy zp_rock_y                                           // 1a3a: a4 61
    iny                                                     // 1a3c: c8
    jsr spawn_monster                                       // 1a3d: 20 7c 17
// Referenced 2 times by $1a30, $1a36
rock_moved_no_egg_crack:
    rts                                                     // 1a40: 60
// Referenced 6 times by $1a85, $1f45, $1afe, $1d19, $1b3d, $1abe
repton_storeposition:
    lda zp_screen_topleft_x                                 // 1a41: a5 8c
    clc                                                     // 1a43: 18
    adc #$0e                                                // 1a44: 69 0e
    sta repton_last_x                                       // 1a46: 8d fa 0b
    lda zp_screen_topleft_y                                 // 1a49: a5 8d
    clc                                                     // 1a4b: 18
    adc #$0e                                                // 1a4c: 69 0e
    sta repton_last_y                                       // 1a4e: 8d fb 0b
    rts                                                     // 1a51: 60
// Referenced 6 times by $1f48, $1ad1, $1b56, $1b17, $1a98, $1d1c
repton_erase_and_draw:
    ldx repton_last_x                                       // 1a52: ae fa 0b
    ldy repton_last_y                                       // 1a55: ac fb 0b
    lda repton_animframe                                    // 1a58: ad fd 0b
// Redundant?
    ldx repton_last_x                                       // 1a5b: ae fa 0b
    ldy repton_last_y                                       // 1a5e: ac fb 0b
    lda repton_animframe                                    // 1a61: ad fd 0b
    jsr erase_sprite                                        // 1a64: 20 76 10
    lda zp_screen_topleft_x                                 // 1a67: a5 8c
    clc                                                     // 1a69: 18
    adc #$0e                                                // 1a6a: 69 0e
    tax                                                     // 1a6c: aa
    lda zp_screen_topleft_y                                 // 1a6d: a5 8d
    clc                                                     // 1a6f: 18
    adc #$0e                                                // 1a70: 69 0e
    tay                                                     // 1a72: a8
    lda repton_animframe                                    // 1a73: ad fd 0b
    jmp draw_sprite                                         // 1a76: 4c f5 0f
// Referenced 1 time by $1e2f
repton_move_up:
    lda zp_screen_topleft_y                                 // 1a79: a5 8d
    lsr                                                     // 1a7b: 4a
    lsr                                                     // 1a7c: 4a
    and #$01                                                // 1a7d: 29 01
    clc                                                     // 1a7f: 18
    adc #$15                                                // 1a80: 69 15
    sta repton_animframe                                    // 1a82: 8d fd 0b
    jsr repton_storeposition                                // 1a85: 20 41 1a
    dec zp_screen_topleft_y                                 // 1a88: c6 8d
    lda zp_screenaddr+1                                     // 1a8a: a5 8f
    sec                                                     // 1a8c: 38
    sbc #$01                                                // 1a8d: e9 01
    and #$7f                                                // 1a8f: 29 7f
    ora #>screen_base // '`'                                // 1a91: 09 60
    sta zp_screenaddr+1                                     // 1a93: 85 8f
    jsr scroll                                              // 1a95: 20 a5 10
    jsr repton_erase_and_draw                               // 1a98: 20 52 1a
    lda #$1f                                                // 1a9b: a9 1f
    sta zp_drawscreen_counter                               // 1a9d: 85 76
// Referenced 1 time by $1aaf
repton_move_up_draw_top_strip_loop:
    lda zp_screen_topleft_x                                 // 1a9f: a5 8c
    clc                                                     // 1aa1: 18
    adc zp_drawscreen_counter                               // 1aa2: 65 76
    tax                                                     // 1aa4: aa
    ldy zp_screen_topleft_y                                 // 1aa5: a4 8d
    jsr lookup_subtile_image_data                           // 1aa7: 20 d1 10
    jsr draw_subtile_at_coords                              // 1aaa: 20 ba 11
    dec zp_drawscreen_counter                               // 1aad: c6 76
    bpl repton_move_up_draw_top_strip_loop                  // 1aaf: 10 ee
    rts                                                     // 1ab1: 60
// Referenced 1 time by $1e35
repton_move_down:
    lda zp_screen_topleft_y                                 // 1ab2: a5 8d
    lsr                                                     // 1ab4: 4a
    lsr                                                     // 1ab5: 4a
    and #$01                                                // 1ab6: 29 01
    clc                                                     // 1ab8: 18
    adc #$15                                                // 1ab9: 69 15
    sta repton_animframe                                    // 1abb: 8d fd 0b
    jsr repton_storeposition                                // 1abe: 20 41 1a
    inc zp_screen_topleft_y                                 // 1ac1: e6 8d
    lda zp_screenaddr+1                                     // 1ac3: a5 8f
    clc                                                     // 1ac5: 18
    adc #$01                                                // 1ac6: 69 01
    and #$7f                                                // 1ac8: 29 7f
    ora #>screen_base // '`'                                // 1aca: 09 60
    sta zp_screenaddr+1                                     // 1acc: 85 8f
    jsr scroll                                              // 1ace: 20 a5 10
    jsr repton_erase_and_draw                               // 1ad1: 20 52 1a
    lda #$1f                                                // 1ad4: a9 1f
    sta zp_drawscreen_counter                               // 1ad6: 85 76
    lda zp_screen_topleft_y                                 // 1ad8: a5 8d
    clc                                                     // 1ada: 18
    adc #$1f                                                // 1adb: 69 1f
    sta zp_drawscreen_y                                     // 1add: 85 75
// Referenced 1 time by $1aef
repton_move_down_draw_bot_strip_loop:
    lda zp_screen_topleft_x                                 // 1adf: a5 8c
    clc                                                     // 1ae1: 18
    adc zp_drawscreen_counter                               // 1ae2: 65 76
    tax                                                     // 1ae4: aa
    ldy zp_drawscreen_y                                     // 1ae5: a4 75
    jsr lookup_subtile_image_data                           // 1ae7: 20 d1 10
    jsr draw_subtile_at_coords                              // 1aea: 20 ba 11
    dec zp_drawscreen_counter                               // 1aed: c6 76
    bpl repton_move_down_draw_bot_strip_loop                // 1aef: 10 ee
    rts                                                     // 1af1: 60
// Referenced 1 time by $1e1f
repton_move_left:
    lda zp_screen_topleft_x                                 // 1af2: a5 8c
    lsr                                                     // 1af4: 4a
    and #$07                                                // 1af5: 29 07
    tax                                                     // 1af7: aa
    lda lut_reptonanim_left,x                               // 1af8: bd 02 0e
    sta repton_animframe                                    // 1afb: 8d fd 0b
    jsr repton_storeposition                                // 1afe: 20 41 1a
    dec zp_screen_topleft_x                                 // 1b01: c6 8c
    lda zp_screenaddr                                       // 1b03: a5 8e
    sec                                                     // 1b05: 38
    sbc #$08                                                // 1b06: e9 08
    sta zp_screenaddr                                       // 1b08: 85 8e
    lda zp_screenaddr+1                                     // 1b0a: a5 8f
    sbc #$00                                                // 1b0c: e9 00
    and #$7f                                                // 1b0e: 29 7f
    ora #>screen_base // '`'                                // 1b10: 09 60
    sta zp_screenaddr+1                                     // 1b12: 85 8f
    jsr scroll                                              // 1b14: 20 a5 10
    jsr repton_erase_and_draw                               // 1b17: 20 52 1a
    lda #$1f                                                // 1b1a: a9 1f
    sta zp_drawscreen_counter                               // 1b1c: 85 76
// Referenced 1 time by $1b2e
repton_move_left_draw_left_strip_loop:
    lda zp_screen_topleft_y                                 // 1b1e: a5 8d
    clc                                                     // 1b20: 18
    adc zp_drawscreen_counter                               // 1b21: 65 76
    tay                                                     // 1b23: a8
    ldx zp_screen_topleft_x                                 // 1b24: a6 8c
    jsr lookup_subtile_image_data                           // 1b26: 20 d1 10
    jsr draw_subtile_at_coords                              // 1b29: 20 ba 11
    dec zp_drawscreen_counter                               // 1b2c: c6 76
    bpl repton_move_left_draw_left_strip_loop               // 1b2e: 10 ee
    rts                                                     // 1b30: 60
// Referenced 1 time by $1e25
repton_move_right:
    lda zp_screen_topleft_x                                 // 1b31: a5 8c
    lsr                                                     // 1b33: 4a
    and #$07                                                // 1b34: 29 07
    tax                                                     // 1b36: aa
    lda lut_reptonanim_right,x                              // 1b37: bd 0a 0e
    sta repton_animframe                                    // 1b3a: 8d fd 0b
    jsr repton_storeposition                                // 1b3d: 20 41 1a
    inc zp_screen_topleft_x                                 // 1b40: e6 8c
    lda zp_screenaddr                                       // 1b42: a5 8e
    clc                                                     // 1b44: 18
    adc #$08                                                // 1b45: 69 08
    sta zp_screenaddr                                       // 1b47: 85 8e
    lda zp_screenaddr+1                                     // 1b49: a5 8f
    adc #$00                                                // 1b4b: 69 00
    and #$7f                                                // 1b4d: 29 7f
    ora #>screen_base // '`'                                // 1b4f: 09 60
    sta zp_screenaddr+1                                     // 1b51: 85 8f
    jsr scroll                                              // 1b53: 20 a5 10
    jsr repton_erase_and_draw                               // 1b56: 20 52 1a
    lda #$1f                                                // 1b59: a9 1f
    sta zp_drawscreen_counter                               // 1b5b: 85 76
    lda zp_screen_topleft_x                                 // 1b5d: a5 8c
    clc                                                     // 1b5f: 18
    adc #$1f                                                // 1b60: 69 1f
    sta zp_drawscreen_x                                     // 1b62: 85 74
// Referenced 1 time by $1b74
repton_move_right_draw_right_strip_loop:
    lda zp_screen_topleft_y                                 // 1b64: a5 8d
    clc                                                     // 1b66: 18
    adc zp_drawscreen_counter                               // 1b67: 65 76
    tay                                                     // 1b69: a8
    ldx zp_drawscreen_x                                     // 1b6a: a6 74
    jsr lookup_subtile_image_data                           // 1b6c: 20 d1 10
    jsr draw_subtile_at_coords                              // 1b6f: 20 ba 11
    dec zp_drawscreen_counter                               // 1b72: c6 76
    bpl repton_move_right_draw_right_strip_loop             // 1b74: 10 ee
    rts                                                     // 1b76: 60
// Referenced 1 time by $23f2
random_clear:
// Do 14 passes over the screen
    lda #$0e                                                // 1b77: a9 0e
    sta l0072                                               // 1b79: 85 72
// Referenced 1 time by $1ba2
random_clear_loop1:
// Loop over the whole screen once per pass
    lda #<screen_base                                       // 1b7b: a9 00
    sta zp_temp_x                                           // 1b7d: 85 70
    lda #>screen_base // '`'                                // 1b7f: a9 60
    sta zp_temp_y                                           // 1b81: 85 71
// Referenced 1 time by $1b9e
random_clear_loop2:
// Generate a random OS ROM address, avoiding SHEILA etc
    jsr random                                              // 1b83: 20 59 0f
    and #$f0                                                // 1b86: 29 f0
    ora #$e0                                                // 1b88: 09 e0
    sta zp_drawscreen_x                                     // 1b8a: 85 74
    jsr random                                              // 1b8c: 20 59 0f
    sta l0073                                               // 1b8f: 85 73
    ldy #$00                                                // 1b91: a0 00
// Referenced 1 time by $1b9a
random_clear_loop3:
// AND each screen memory byte with a correspondng byte from OS ROM
    lda (zp_temp_x),y                                       // 1b93: b1 70
    and (l0073),y                                           // 1b95: 31 73
    sta (zp_temp_x),y                                       // 1b97: 91 70
    iny                                                     // 1b99: c8
// After 256 bytes, generate a new random ROM address
    bne random_clear_loop3                                  // 1b9a: d0 f7
    inc zp_temp_y                                           // 1b9c: e6 71
    bpl random_clear_loop2                                  // 1b9e: 10 e3
    dec l0072                                               // 1ba0: c6 72
    bne random_clear_loop1                                  // 1ba2: d0 d7
// Referenced 1 time by $1beb
clearscreen:
    lda #$11                                                // 1ba4: a9 11
    jsr oswrch                                              // 1ba6: 20 ee ff
    lda #$80                                                // 1ba9: a9 80
    jsr oswrch                                              // 1bab: 20 ee ff
    lda #$0c                                                // 1bae: a9 0c
    jsr disable_event                                       // 1bb0: 20 5a 0d
    lda #$ff                                                // 1bb3: a9 ff
    sta zp_textcolour                                       // 1bb5: 85 82
    lda #$00                                                // 1bb7: a9 00
    sta zp_textpos_x                                        // 1bb9: 85 80
    sta zp_textpos_y                                        // 1bbb: 85 81
    sta zp_screenaddr                                       // 1bbd: 85 8e
    lda #>screen_base // '`'                                // 1bbf: a9 60
    sta zp_screenaddr+1                                     // 1bc1: 85 8f
    rts                                                     // 1bc3: 60
// Referenced 5 times by $272a, $25b3, $25d6, $26d6, $1c77
dissolve:
    lda #$08                                                // 1bc4: a9 08
    sta l0072                                               // 1bc6: 85 72
// Referenced 1 time by $1be9
dissolve_loop0:
    lda #<screen_base                                       // 1bc8: a9 00
    sta zp_temp_x                                           // 1bca: 85 70
    lda #>screen_base // '`'                                // 1bcc: a9 60
    sta zp_temp_y                                           // 1bce: 85 71
// Referenced 1 time by $1be2
dissolve_loop1:
    ldy #$00                                                // 1bd0: a0 00
// Referenced 1 time by $1bde
dissolve_loop2:
    lda (zp_temp_x),y                                       // 1bd2: b1 70
    asl                                                     // 1bd4: 0a
    sta (zp_temp_x),y                                       // 1bd5: 91 70
    iny                                                     // 1bd7: c8
    lda (zp_temp_x),y                                       // 1bd8: b1 70
    lsr                                                     // 1bda: 4a
    sta (zp_temp_x),y                                       // 1bdb: 91 70
    iny                                                     // 1bdd: c8
    bne dissolve_loop2                                      // 1bde: d0 f2
    inc zp_temp_y                                           // 1be0: e6 71
    bpl dissolve_loop1                                      // 1be2: 10 ec
    jsr vsync                                               // 1be4: 20 c9 0e
    dec l0072                                               // 1be7: c6 72
    bne dissolve_loop0                                      // 1be9: d0 dd
    jmp clearscreen                                         // 1beb: 4c a4 1b
// Referenced 6 times by $1743, $1823, $1ee9, $1a29, $0ff1, $1fd6
death:
    ldx #$ff                                                // 1bee: a2 ff
    txs                                                     // 1bf0: 9a
    lda #$00                                                // 1bf1: a9 00
    sta l0077                                               // 1bf3: 85 77
// Referenced 1 time by $1c48
death_loop:
    ldx l0077                                               // 1bf5: a6 77
    lda lut_reptonanim_death,x                              // 1bf7: bd 12 0e
    sta repton_animframe                                    // 1bfa: 8d fd 0b
    lda lut_somethingtodowithdeathanims,x                   // 1bfd: bd 1e 0e
    sta zp_drawscreen_counter                               // 1c00: 85 76
    lda zp_screen_topleft_x                                 // 1c02: a5 8c
    clc                                                     // 1c04: 18
    adc zp_drawscreen_counter                               // 1c05: 65 76
    tax                                                     // 1c07: aa
    lda zp_screen_topleft_y                                 // 1c08: a5 8d
    clc                                                     // 1c0a: 18
    adc zp_drawscreen_counter                               // 1c0b: 65 76
    tay                                                     // 1c0d: a8
    lda repton_animframe                                    // 1c0e: ad fd 0b
    jsr draw_sprite                                         // 1c11: 20 f5 0f
    jsr vsync                                               // 1c14: 20 c9 0e
    jsr vsync                                               // 1c17: 20 c9 0e
    jsr vsync                                               // 1c1a: 20 c9 0e
    jsr vsync                                               // 1c1d: 20 c9 0e
    lda #$10                                                // 1c20: a9 10
    sta l0000                                               // 1c22: 85 00
    lda #$f1                                                // 1c24: a9 f1
    clc                                                     // 1c26: 18
    adc l0077                                               // 1c27: 65 77
    ldx #$06                                                // 1c29: a2 06
    ldy #$08                                                // 1c2b: a0 08
    jsr sound_play                                          // 1c2d: 20 69 0f
    lda zp_screen_topleft_x                                 // 1c30: a5 8c
    clc                                                     // 1c32: 18
    adc zp_drawscreen_counter                               // 1c33: 65 76
    tax                                                     // 1c35: aa
    lda zp_screen_topleft_y                                 // 1c36: a5 8d
    clc                                                     // 1c38: 18
    adc zp_drawscreen_counter                               // 1c39: 65 76
    tay                                                     // 1c3b: a8
    lda repton_animframe                                    // 1c3c: ad fd 0b
    jsr erase_sprite                                        // 1c3f: 20 76 10
    inc l0077                                               // 1c42: e6 77
    lda l0077                                               // 1c44: a5 77
    cmp #$0c                                                // 1c46: c9 0c
    bne death_loop                                          // 1c48: d0 ab
    ldx #$1e                                                // 1c4a: a2 1e
// Referenced 1 time by $1c50
death_delayloop:
    jsr vsync                                               // 1c4c: 20 c9 0e
    dex                                                     // 1c4f: ca
    bpl death_delayloop                                     // 1c50: 10 fa
    ldx #$00                                                // 1c52: a2 00
// Referenced 1 time by $1c75
death_removereptonloop:
    lda mapdata1,x                                          // 1c54: bd 00 04
    and #$7f                                                // 1c57: 29 7f
    sta mapdata1,x                                          // 1c59: 9d 00 04
    lda mapdata2,x                                          // 1c5c: bd 00 05
    and #$7f                                                // 1c5f: 29 7f
    sta mapdata2,x                                          // 1c61: 9d 00 05
    lda mapdata3,x                                          // 1c64: bd 00 06
    and #$7f                                                // 1c67: 29 7f
    sta mapdata3,x                                          // 1c69: 9d 00 06
    lda mapdata4,x                                          // 1c6c: bd 00 07
    and #$7f                                                // 1c6f: 29 7f
    sta mapdata4,x                                          // 1c71: 9d 00 07
    inx                                                     // 1c74: e8
    bne death_removereptonloop                              // 1c75: d0 dd
    jsr dissolve                                            // 1c77: 20 c4 1b
    dec zp_lives                                            // 1c7a: c6 8a
    bne death_not_end_of_game                               // 1c7c: d0 03
    jmp end_of_game_screen                                  // 1c7e: 4c b3 26
// Referenced 1 time by $1c7c
death_not_end_of_game:
    jmp spawn_repton                                        // 1c81: 4c df 1c
// Referenced 1 time by $08ba
start2:
    nop                                                     // 1c84: ea
    nop                                                     // 1c85: ea
    nop                                                     // 1c86: ea
    ldx #<data_envelope                                     // 1c87: a2 b3
    ldy #>data_envelope                                     // 1c89: a0 0e
    lda #$08                                                // 1c8b: a9 08
    jsr osword                                              // 1c8d: 20 f1 ff
    lda #$01                                                // 1c90: a9 01
    sta zp_soundon                                          // 1c92: 85 83
// Referenced 1 time by $272d
newgame1:
    lda #$00                                                // 1c94: a9 00
    sta zp_current_level                                    // 1c96: 85 8b
    sta zp_score_bcd                                        // 1c98: 85 85
    sta zp_score_bcd+1                                      // 1c9a: 85 86
    sta zp_score_bcd+2                                      // 1c9c: 85 87
    sta zp_screenaddr                                       // 1c9e: 85 8e
    lda #>screen_base // '`'                                // 1ca0: a9 60
    sta zp_screenaddr+1                                     // 1ca2: 85 8f
// Referenced 1 time by $25d9
newgame2:
    lda #$03                                                // 1ca4: a9 03
    sta zp_lives                                            // 1ca6: 85 8a
    lda #$ff                                                // 1ca8: a9 ff
    ldx #$10                                                // 1caa: a2 10
// Referenced 1 time by $1cb0
clear_gamestate_loop:
    sta data_gamestate,x                                    // 1cac: 9d 00 0b
    inx                                                     // 1caf: e8
    bne clear_gamestate_loop                                // 1cb0: d0 fa
    jsr setup_monsters_diamonds_earth_counters              // 1cb2: 20 42 25
    nop                                                     // 1cb5: ea
// Referenced 1 time by $1ccf
reset_transporters_puzzlepieces_etc:
// Clear top bits of 2840-293f
    lda data_transporters,x                                 // 1cb6: bd 40 28
    and #$7f                                                // 1cb9: 29 7f
    sta data_transporters,x                                 // 1cbb: 9d 40 28
// Clear top bits of 2940-2a3f (overruns spirit data, monster data, and puzzle pieces)
    lda l2940,x                                             // 1cbe: bd 40 29
    and #$7f                                                // 1cc1: 29 7f
    sta l2940,x                                             // 1cc3: 9d 40 29
// Clear top bits of 29a0-2a9f (including remaining puzzle pieces)
    lda l29a0,x                                             // 1cc6: bd a0 29
    and #$7f                                                // 1cc9: 29 7f
    sta l29a0,x                                             // 1ccb: 9d a0 29
    inx                                                     // 1cce: e8
    bne reset_transporters_puzzlepieces_etc                 // 1ccf: d0 e5
    lda #$10                                                // 1cd1: a9 10
    sta l0088                                               // 1cd3: 85 88
    lda #$07                                                // 1cd5: a9 07
    sta l0089                                               // 1cd7: 85 89
    jsr unpack_level                                        // 1cd9: 20 26 12
    jsr init_spirits                                        // 1cdc: 20 1a 13
// Referenced 1 time by $1c81
spawn_repton:
    lda #$32 // '2'                                         // 1cdf: a9 32
    jsr vdu19                                               // 1ce1: 20 9f 0f
    lda zp_current_level                                    // 1ce4: a5 8b
    and #$03                                                // 1ce6: 29 03
    tax                                                     // 1ce8: aa
    lda lut_level_palettes,x                                // 1ce9: bd c5 0e
    jsr vdu19                                               // 1cec: 20 9f 0f
    lda #$00                                                // 1cef: a9 00
    jsr additional_palette_setup                            // 1cf1: 20 82 33
    lda l0088                                               // 1cf4: a5 88
    asl                                                     // 1cf6: 0a
    asl                                                     // 1cf7: 0a
    sec                                                     // 1cf8: 38
    sbc #$0e                                                // 1cf9: e9 0e
    sta zp_screen_topleft_x                                 // 1cfb: 85 8c
    lda l0089                                               // 1cfd: a5 89
    asl                                                     // 1cff: 0a
    asl                                                     // 1d00: 0a
    sec                                                     // 1d01: 38
    sbc #$0e                                                // 1d02: e9 0e
    sta zp_screen_topleft_y                                 // 1d04: 85 8d
    lda #$00                                                // 1d06: a9 00
    sta repton_moving_x                                     // 1d08: 8d fe 0b
    sta repton_moving_y                                     // 1d0b: 8d ff 0b
    jsr status_screen                                       // 1d0e: 20 d3 22
// Referenced 1 time by $242f
reenter_after_spawn:
    jsr reenter_game                                        // 1d11: 20 dc 13
    lda #sprite_repton_stationary                           // 1d14: a9 13
    sta repton_animframe                                    // 1d16: 8d fd 0b
    jsr repton_storeposition                                // 1d19: 20 41 1a
    jsr repton_erase_and_draw                               // 1d1c: 20 52 1a
    lda zp_screen_topleft_x                                 // 1d1f: a5 8c
    clc                                                     // 1d21: 18
    adc #$0e                                                // 1d22: 69 0e
    lsr                                                     // 1d24: 4a
    lsr                                                     // 1d25: 4a
    sta repton_x                                            // 1d26: 8d f8 0b
    lda zp_screen_topleft_y                                 // 1d29: a5 8d
    clc                                                     // 1d2b: 18
    adc #$0e                                                // 1d2c: 69 0e
    lsr                                                     // 1d2e: 4a
    lsr                                                     // 1d2f: 4a
    sta repton_y                                            // 1d30: 8d f9 0b
// Referenced 1 time by $1f53
repton_move:
    lda zp_screen_topleft_x                                 // 1d33: a5 8c
    clc                                                     // 1d35: 18
    adc #$02                                                // 1d36: 69 02
    and #$03                                                // 1d38: 29 03
    bne repton_alreadymoving                                // 1d3a: d0 09
    lda zp_screen_topleft_y                                 // 1d3c: a5 8d
    clc                                                     // 1d3e: 18
    adc #$02                                                // 1d3f: 69 02
    and #$03                                                // 1d41: 29 03
    beq repton_check_for_new_updown                         // 1d43: f0 03
// Referenced 2 times by $1d3a, $1d9a
repton_alreadymoving:
    jmp repton_check_move_leftright                         // 1d45: 4c 18 1e
// Referenced 1 time by $1d43
repton_check_for_new_updown:
    lda #$00                                                // 1d48: a9 00
    sta repton_moving_x                                     // 1d4a: 8d fe 0b
    sta repton_moving_y                                     // 1d4d: 8d ff 0b
    ldx repton_x                                            // 1d50: ae f8 0b
    ldy repton_y                                            // 1d53: ac f9 0b
    dey                                                     // 1d56: 88
    jsr map_read                                            // 1d57: 20 1a 11
    sta l0072                                               // 1d5a: 85 72
    ldx repton_x                                            // 1d5c: ae f8 0b
    ldy repton_y                                            // 1d5f: ac f9 0b
    iny                                                     // 1d62: c8
    jsr map_read                                            // 1d63: 20 1a 11
    sta l0073                                               // 1d66: 85 73
    lda #keycode_star                                       // 1d68: a9 b7
    jsr kbd_test                                            // 1d6a: 20 95 0f
    beq check_for_down                                      // 1d6d: f0 14
    lda repton_y                                            // 1d6f: ad f9 0b
    cmp #$3f // '?'                                         // 1d72: c9 3f
    beq check_for_down                                      // 1d74: f0 0d
    lda l0072                                               // 1d76: a5 72
    cmp #obj_firstpuzzlepiece // ' '                        // 1d78: c9 20
    bcs up_pressed                                          // 1d7a: b0 04
    cmp #obj_cage                                           // 1d7c: c9 0c
    bcs check_for_down                                      // 1d7e: b0 03
// Referenced 1 time by $1d7a
up_pressed:
    inc repton_moving_y                                     // 1d80: ee ff 0b
// Referenced 3 times by $1d74, $1d6d, $1d7e
check_for_down:
    lda #keycode_question                                   // 1d83: a9 97
    jsr kbd_test                                            // 1d85: 20 95 0f
    beq repton_check_for_new_leftright                      // 1d88: f0 0d
    lda l0073                                               // 1d8a: a5 73
    cmp #obj_firstpuzzlepiece // ' '                        // 1d8c: c9 20
    bcs down_pressed                                        // 1d8e: b0 04
    cmp #obj_cage                                           // 1d90: c9 0c
    bcs repton_check_for_new_leftright                      // 1d92: b0 03
// Referenced 1 time by $1d8e
down_pressed:
    dec repton_moving_y                                     // 1d94: ce ff 0b
// Referenced 2 times by $1d88, $1d92
repton_check_for_new_leftright:
    lda repton_moving_y                                     // 1d97: ad ff 0b
    bne repton_alreadymoving                                // 1d9a: d0 a9
    ldx repton_x                                            // 1d9c: ae f8 0b
    ldy repton_y                                            // 1d9f: ac f9 0b
    dex                                                     // 1da2: ca
    dex                                                     // 1da3: ca
    jsr map_read                                            // 1da4: 20 1a 11
    sta l0072                                               // 1da7: 85 72
    ldx repton_x                                            // 1da9: ae f8 0b
    ldy repton_y                                            // 1dac: ac f9 0b
    dex                                                     // 1daf: ca
    jsr map_read                                            // 1db0: 20 1a 11
    sta l0073                                               // 1db3: 85 73
    ldx repton_x                                            // 1db5: ae f8 0b
    ldy repton_y                                            // 1db8: ac f9 0b
    inx                                                     // 1dbb: e8
    jsr map_read                                            // 1dbc: 20 1a 11
    sta zp_drawscreen_x                                     // 1dbf: 85 74
    ldx repton_x                                            // 1dc1: ae f8 0b
    ldy repton_y                                            // 1dc4: ac f9 0b
    inx                                                     // 1dc7: e8
    inx                                                     // 1dc8: e8
    jsr map_read                                            // 1dc9: 20 1a 11
    sta zp_drawscreen_y                                     // 1dcc: 85 75
    lda #keycode_z                                          // 1dce: a9 9e
    jsr kbd_test                                            // 1dd0: 20 95 0f
    beq check_for_right                                     // 1dd3: f0 1e
    lda l0073                                               // 1dd5: a5 73
    cmp #obj_firstpuzzlepiece // ' '                        // 1dd7: c9 20
    bcs left_pressed                                        // 1dd9: b0 15
    cmp #obj_cage                                           // 1ddb: c9 0c
    bcc left_pressed                                        // 1ddd: 90 11
    cmp #obj_wall                                           // 1ddf: c9 10
    bcs check_for_right                                     // 1de1: b0 10
    cmp #obj_rock                                           // 1de3: c9 0e
    bcc check_for_right                                     // 1de5: 90 0c
    lda l0072                                               // 1de7: a5 72
    cmp #obj_firstnonempty                                  // 1de9: c9 03
    bcs check_for_right                                     // 1deb: b0 06
    jsr push_left                                           // 1ded: 20 2b 15
// Referenced 2 times by $1dd9, $1ddd
left_pressed:
    inc repton_moving_x                                     // 1df0: ee fe 0b
// Referenced 4 times by $1de1, $1dd3, $1de5, $1deb
check_for_right:
    lda #keycode_x                                          // 1df3: a9 bd
    jsr kbd_test                                            // 1df5: 20 95 0f
    beq repton_check_move_leftright                         // 1df8: f0 1e
    lda zp_drawscreen_x                                     // 1dfa: a5 74
    cmp #obj_firstpuzzlepiece // ' '                        // 1dfc: c9 20
    bcs right_pressed                                       // 1dfe: b0 15
    cmp #obj_cage                                           // 1e00: c9 0c
    bcc right_pressed                                       // 1e02: 90 11
    cmp #obj_wall                                           // 1e04: c9 10
    bcs repton_check_move_leftright                         // 1e06: b0 10
    cmp #obj_rock                                           // 1e08: c9 0e
    bcc repton_check_move_leftright                         // 1e0a: 90 0c
    lda zp_drawscreen_y                                     // 1e0c: a5 75
    cmp #obj_firstnonempty                                  // 1e0e: c9 03
    bcs repton_check_move_leftright                         // 1e10: b0 06
    jsr push_right                                          // 1e12: 20 44 15
// Referenced 2 times by $1e02, $1dfe
right_pressed:
    dec repton_moving_x                                     // 1e15: ce fe 0b
// Referenced 5 times by $1d45, $1e06, $1e0a, $1e10, $1df8
repton_check_move_leftright:
    lda repton_moving_x                                     // 1e18: ad fe 0b
    beq repton_check_move_updown                            // 1e1b: f0 0b
    bmi repton_call_move_right                              // 1e1d: 30 06
    jsr repton_move_left                                    // 1e1f: 20 f2 1a
    jmp repton_check_move_updown                            // 1e22: 4c 28 1e
// Referenced 1 time by $1e1d
repton_call_move_right:
    jsr repton_move_right                                   // 1e25: 20 31 1b
// Referenced 2 times by $1e22, $1e1b
repton_check_move_updown:
    lda repton_moving_y                                     // 1e28: ad ff 0b
    beq repton_postmove                                     // 1e2b: f0 0b
    bmi repton_call_move_down                               // 1e2d: 30 06
    jsr repton_move_up                                      // 1e2f: 20 79 1a
    jmp repton_postmove                                     // 1e32: 4c 38 1e
// Referenced 1 time by $1e2d
repton_call_move_down:
    jsr repton_move_down                                    // 1e35: 20 b2 1a
// Referenced 2 times by $1e32, $1e2b
repton_postmove:
    lda zp_screen_topleft_x                                 // 1e38: a5 8c
    clc                                                     // 1e3a: 18
    adc #$0e                                                // 1e3b: 69 0e
    lsr                                                     // 1e3d: 4a
    lsr                                                     // 1e3e: 4a
    sta repton_x                                            // 1e3f: 8d f8 0b
    lda zp_screen_topleft_y                                 // 1e42: a5 8d
    clc                                                     // 1e44: 18
    adc #$0e                                                // 1e45: 69 0e
    lsr                                                     // 1e47: 4a
    lsr                                                     // 1e48: 4a
    sta repton_y                                            // 1e49: 8d f9 0b
// Mark Repton's location with X rounded up
    lda zp_screen_topleft_x                                 // 1e4c: a5 8c
    clc                                                     // 1e4e: 18
    adc #$11                                                // 1e4f: 69 11
    lsr                                                     // 1e51: 4a
    lsr                                                     // 1e52: 4a
    tax                                                     // 1e53: aa
    lda zp_screen_topleft_y                                 // 1e54: a5 8d
    clc                                                     // 1e56: 18
    adc #$0e                                                // 1e57: 69 0e
    lsr                                                     // 1e59: 4a
    lsr                                                     // 1e5a: 4a
    tay                                                     // 1e5b: a8
    jsr map_read                                            // 1e5c: 20 1a 11
    ora #$80                                                // 1e5f: 09 80
    ldy #$00                                                // 1e61: a0 00
    sta (zp_ptr),y                                          // 1e63: 91 0a
// Mark Repton's location with Y rounded up
    lda zp_screen_topleft_x                                 // 1e65: a5 8c
    clc                                                     // 1e67: 18
    adc #$0e                                                // 1e68: 69 0e
    lsr                                                     // 1e6a: 4a
    lsr                                                     // 1e6b: 4a
    tax                                                     // 1e6c: aa
    lda zp_screen_topleft_y                                 // 1e6d: a5 8d
    clc                                                     // 1e6f: 18
    adc #$11                                                // 1e70: 69 11
    lsr                                                     // 1e72: 4a
    lsr                                                     // 1e73: 4a
    tay                                                     // 1e74: a8
    jsr map_read                                            // 1e75: 20 1a 11
    ora #$80                                                // 1e78: 09 80
    ldy #$00                                                // 1e7a: a0 00
    sta (zp_ptr),y                                          // 1e7c: 91 0a
    jsr move_monsters                                       // 1e7e: 20 c1 17
    jsr scan_rocks                                          // 1e81: 20 b3 16
    jsr update_spirits                                      // 1e84: 20 a0 1f
    jsr update_meteors                                      // 1e87: 20 f0 16
// Unmark Repton's location with X rounded up
    lda zp_screen_topleft_x                                 // 1e8a: a5 8c
    clc                                                     // 1e8c: 18
    adc #$11                                                // 1e8d: 69 11
    lsr                                                     // 1e8f: 4a
    lsr                                                     // 1e90: 4a
    tax                                                     // 1e91: aa
    lda zp_screen_topleft_y                                 // 1e92: a5 8d
    clc                                                     // 1e94: 18
    adc #$0e                                                // 1e95: 69 0e
    lsr                                                     // 1e97: 4a
    lsr                                                     // 1e98: 4a
    tay                                                     // 1e99: a8
    jsr map_read                                            // 1e9a: 20 1a 11
    and #$7f                                                // 1e9d: 29 7f
    ldy #$00                                                // 1e9f: a0 00
    sta (zp_ptr),y                                          // 1ea1: 91 0a
// Unmark Repton's location with Y rounded up
    lda zp_screen_topleft_x                                 // 1ea3: a5 8c
    clc                                                     // 1ea5: 18
    adc #$0e                                                // 1ea6: 69 0e
    lsr                                                     // 1ea8: 4a
    lsr                                                     // 1ea9: 4a
    tax                                                     // 1eaa: aa
    lda zp_screen_topleft_y                                 // 1eab: a5 8d
    clc                                                     // 1ead: 18
    adc #$11                                                // 1eae: 69 11
    lsr                                                     // 1eb0: 4a
    lsr                                                     // 1eb1: 4a
    tay                                                     // 1eb2: a8
    jsr map_read                                            // 1eb3: 20 1a 11
    and #$7f                                                // 1eb6: 29 7f
    ldy #$00                                                // 1eb8: a0 00
    sta (zp_ptr),y                                          // 1eba: 91 0a
// Is Repton moving?  If so, skip static object hit checks
    lda zp_screen_topleft_x                                 // 1ebc: a5 8c
    clc                                                     // 1ebe: 18
    adc #$02                                                // 1ebf: 69 02
    and #$03                                                // 1ec1: 29 03
    bne after_hit_checks                                    // 1ec3: d0 50
    lda zp_screen_topleft_y                                 // 1ec5: a5 8d
    clc                                                     // 1ec7: 18
    adc #$02                                                // 1ec8: 69 02
    and #$03                                                // 1eca: 29 03
    bne after_hit_checks                                    // 1ecc: d0 47
    ldx repton_x                                            // 1ece: ae f8 0b
    ldy repton_y                                            // 1ed1: ac f9 0b
    jsr collect                                             // 1ed4: 20 01 0d
    cmp #obj_diamond                                        // 1ed7: c9 06
    bne check_hit_key                                       // 1ed9: d0 03
    jmp collect_diamond                                     // 1edb: 4c 5d 15
// Referenced 1 time by $1ed9
check_hit_key:
    cmp #obj_key                                            // 1ede: c9 07
    bne check_hit_skull                                     // 1ee0: d0 03
    jmp collect_key                                         // 1ee2: 4c 76 15
// Referenced 1 time by $1ee0
check_hit_skull:
    cmp #obj_skull                                          // 1ee5: c9 08
    bne check_hit_endsquare                                 // 1ee7: d0 03
    jmp death                                               // 1ee9: 4c ee 1b
// Referenced 1 time by $1ee7
check_hit_endsquare:
    cmp #obj_spirit                                         // 1eec: c9 09
    bne check_hit_status                                    // 1eee: d0 03
    jmp check_for_victory                                   // 1ef0: 4c 93 25
// Referenced 1 time by $1eee
check_hit_status:
    cmp #obj_statustrigger                                  // 1ef3: c9 0a
    bne check_hit_transporter                               // 1ef5: d0 03
    jmp statustrigger                                       // 1ef7: 4c e8 23
// Referenced 1 time by $1ef5
check_hit_transporter:
    cmp #obj_transporter                                    // 1efa: c9 0b
    bne check_hit_puzzlepiece                               // 1efc: d0 03
    jmp enter_transporter                                   // 1efe: 4c b4 15
// Referenced 1 time by $1efc
check_hit_puzzlepiece:
    cmp #obj_firstpuzzlepiece // ' '                        // 1f01: c9 20
    bcc check_hit_earth                                     // 1f03: 90 03
    jmp collect_puzzlepiece                                 // 1f05: 4c 3e 16
// Referenced 1 time by $1f03
check_hit_earth:
    cmp #obj_firstnonempty                                  // 1f08: c9 03
    bcc after_hit_checks                                    // 1f0a: 90 09
    lda #obj_empty                                          // 1f0c: a9 02
    ldy #$00                                                // 1f0e: a0 00
    sta (zp_ptr),y                                          // 1f10: 91 0a
    jsr decrement_remaining_earth                           // 1f12: 20 5c 25
// Referenced 9 times by $1ec3, $1f0a, $1ecc, $2590, $15b1, $16b0, $1573, $163b, $23fd
after_hit_checks:
    lda repton_moving_x                                     // 1f15: ad fe 0b
    ora repton_moving_y                                     // 1f18: 0d ff 0b
    bne repton_is_moving                                    // 1f1b: d0 20
    jsr vsync                                               // 1f1d: 20 c9 0e
    lda l0bfc                                               // 1f20: ad fc 0b
    bmi repton_is_bored                                     // 1f23: 30 06
    inc l0bfc                                               // 1f25: ee fc 0b
    jmp repton_stationary                                   // 1f28: 4c 45 1f
// Referenced 1 time by $1f23
repton_is_bored:
    lda l007e                                               // 1f2b: a5 7e
    lsr                                                     // 1f2d: 4a
    lsr                                                     // 1f2e: 4a
    lsr                                                     // 1f2f: 4a
    lsr                                                     // 1f30: 4a
    and #$03                                                // 1f31: 29 03
    tax                                                     // 1f33: aa
    lda lut_reptonanim_bored,x                              // 1f34: bd 2a 0e
    sta repton_animframe                                    // 1f37: 8d fd 0b
    jmp repton_stationary                                   // 1f3a: 4c 45 1f
// Referenced 1 time by $1f1b
repton_is_moving:
    lda #$00                                                // 1f3d: a9 00
    sta l0bfc                                               // 1f3f: 8d fc 0b
    jmp after_movement_checks                               // 1f42: 4c 4b 1f
// Referenced 2 times by $1f28, $1f3a
repton_stationary:
    jsr repton_storeposition                                // 1f45: 20 41 1a
    jsr repton_erase_and_draw                               // 1f48: 20 52 1a
// Referenced 1 time by $1f42
after_movement_checks:
    jsr check_audio_keys                                    // 1f4b: 20 d3 0f
    jsr check_escape_ingame                                 // 1f4e: 20 ea 0f
    inc l007e                                               // 1f51: e6 7e
    jmp repton_move                                         // 1f53: 4c 33 1d
    .byt $4c, $15, $1f, $4c, $15, $1f, $60                  // 1f56: L..L..`
// Referenced 1 time by $1339
place_spirit2:
    nop                                                     // 1f5d: ea
    nop                                                     // 1f5e: ea
    jmp place_spirit                                        // 1f5f: 4c 81 08
// Referenced 1 time by $088a
allocate_spirit:
    ldx #$00                                                // 1f62: a2 00
// Referenced 1 time by $1f8c
find_free_spirit_loop:
    lda data_spirit_alive,x                                 // 1f64: bd cb 29
    bmi find_free_spirit_loop_next                          // 1f67: 30 1c
    lda zp_temp_x                                           // 1f69: a5 70
    asl                                                     // 1f6b: 0a
    asl                                                     // 1f6c: 0a
    sta data_spirit_x,x                                     // 1f6d: 9d c8 29
    lda zp_temp_y                                           // 1f70: a5 71
    asl                                                     // 1f72: 0a
    asl                                                     // 1f73: 0a
    sta data_spirit_y,x                                     // 1f74: 9d c9 29
    jsr init_spirit_direction                               // 1f77: 20 e1 20
    nop                                                     // 1f7a: ea
    nop                                                     // 1f7b: ea
    nop                                                     // 1f7c: ea
    nop                                                     // 1f7d: ea
    nop                                                     // 1f7e: ea
    lda #$80                                                // 1f7f: a9 80
    sta data_spirit_alive,x                                 // 1f81: 9d cb 29
    rts                                                     // 1f84: 60
// Referenced 1 time by $1f67
find_free_spirit_loop_next:
    txa                                                     // 1f85: 8a
    clc                                                     // 1f86: 18
    adc #$04                                                // 1f87: 69 04
    tax                                                     // 1f89: aa
    cpx #$20 // ' '                                         // 1f8a: e0 20
    bne find_free_spirit_loop                               // 1f8c: d0 d6
    rts                                                     // 1f8e: 60
lut_spirit_animframes:
    .byt $0a, $0b, $0c, $0d, $0d, $0c, $0b, $0a             // 1f8f: ........
lut_spirit_dir_to_dx:
    .byt $00, $01, $00                                      // 1f97: ...
lut_spirit_dir_to_dy:
    .byt $ff, $00, $01, $00, $00, $00                       // 1f9a: ......
// Referenced 1 time by $1e84
update_spirits:
    lda #$00                                                // 1fa0: a9 00
    sta zp_rock_type__puzzlepiece_offset                    // 1fa2: 85 6f
// Referenced 1 time by $1fb7
update_spirits_loop:
    ldx zp_rock_type__puzzlepiece_offset                    // 1fa4: a6 6f
    lda data_spirit_alive,x                                 // 1fa6: bd cb 29
    bpl update_spirits_next                                 // 1fa9: 10 03
    jsr spirit_check_hit_repton                             // 1fab: 20 ba 1f
// Referenced 1 time by $1fa9
update_spirits_next:
    lda zp_rock_type__puzzlepiece_offset                    // 1fae: a5 6f
    clc                                                     // 1fb0: 18
    adc #$04                                                // 1fb1: 69 04
    sta zp_rock_type__puzzlepiece_offset                    // 1fb3: 85 6f
    cmp #$20 // ' '                                         // 1fb5: c9 20
    bne update_spirits_loop                                 // 1fb7: d0 eb
    rts                                                     // 1fb9: 60
// Referenced 1 time by $1fab
spirit_check_hit_repton:
    lda data_spirit_x,x                                     // 1fba: bd c8 29
    sec                                                     // 1fbd: 38
    sbc zp_screen_topleft_x                                 // 1fbe: e5 8c
    cmp #$0c                                                // 1fc0: c9 0c
    bcc spirit_move                                         // 1fc2: 90 15
    cmp #$12                                                // 1fc4: c9 12
    bcs spirit_move                                         // 1fc6: b0 11
    lda data_spirit_y,x                                     // 1fc8: bd c9 29
    sec                                                     // 1fcb: 38
    sbc zp_screen_topleft_y                                 // 1fcc: e5 8d
    cmp #$0c                                                // 1fce: c9 0c
    bcc spirit_move                                         // 1fd0: 90 07
    cmp #$12                                                // 1fd2: c9 12
    bcs spirit_move                                         // 1fd4: b0 03
    jmp death                                               // 1fd6: 4c ee 1b
// Referenced 4 times by $1fd0, $1fc2, $1fd4, $1fc6
spirit_move:
    lda data_spirit_y,x                                     // 1fd9: bd c9 29
    tay                                                     // 1fdc: a8
    lda data_spirit_x,x                                     // 1fdd: bd c8 29
    tax                                                     // 1fe0: aa
    iny                                                     // 1fe1: c8
    inx                                                     // 1fe2: e8
    lda #$0a                                                // 1fe3: a9 0a
    jsr erase_sprite                                        // 1fe5: 20 76 10
    ldx zp_rock_type__puzzlepiece_offset                    // 1fe8: a6 6f
    lda data_spirit_dir,x                                   // 1fea: bd ca 29
    tay                                                     // 1fed: a8
    lda data_spirit_x,x                                     // 1fee: bd c8 29
    clc                                                     // 1ff1: 18
    adc lut_spirit_dir_to_dx,y                              // 1ff2: 79 97 1f
    sta data_spirit_x,x                                     // 1ff5: 9d c8 29
    lda data_spirit_y,x                                     // 1ff8: bd c9 29
    clc                                                     // 1ffb: 18
    adc lut_spirit_dir_to_dy,y                              // 1ffc: 79 9a 1f
    sta data_spirit_y,x                                     // 1fff: 9d c9 29
    lda l007e                                               // 2002: a5 7e
    nop                                                     // 2004: ea
    and #$07                                                // 2005: 29 07
    tay                                                     // 2007: a8
    lda lut_spirit_animframes,y                             // 2008: b9 8f 1f
    pha                                                     // 200b: 48
    lda data_spirit_y,x                                     // 200c: bd c9 29
    tay                                                     // 200f: a8
    lda data_spirit_x,x                                     // 2010: bd c8 29
    tax                                                     // 2013: aa
    inx                                                     // 2014: e8
    iny                                                     // 2015: c8
    pla                                                     // 2016: 68
    jsr draw_sprite                                         // 2017: 20 f5 0f
    ldx zp_rock_type__puzzlepiece_offset                    // 201a: a6 6f
    lda data_spirit_x,x                                     // 201c: bd c8 29
    and #$03                                                // 201f: 29 03
    bne spirit_move_rts                                     // 2021: d0 0a
    lda data_spirit_y,x                                     // 2023: bd c9 29
    and #$03                                                // 2026: 29 03
    bne spirit_move_rts                                     // 2028: d0 03
    jmp spirit_check_cage                                   // 202a: 4c 2e 20
// Referenced 2 times by $2028, $2021
spirit_move_rts:
    rts                                                     // 202d: 60
// Referenced 1 time by $202a
spirit_check_cage:
    lda data_spirit_x,x                                     // 202e: bd c8 29
    lsr                                                     // 2031: 4a
    lsr                                                     // 2032: 4a
    sta zp_rock_x                                           // 2033: 85 60
    lda data_spirit_y,x                                     // 2035: bd c9 29
    lsr                                                     // 2038: 4a
    lsr                                                     // 2039: 4a
    sta zp_rock_y                                           // 203a: 85 61
    tay                                                     // 203c: a8
    ldx zp_rock_x                                           // 203d: a6 60
    jsr map_read                                            // 203f: 20 1a 11
    cmp #obj_cage                                           // 2042: c9 0c
    bne spirit_update_direction                             // 2044: d0 1c
    lda #obj_diamond                                        // 2046: a9 06
    ldx zp_rock_x                                           // 2048: a6 60
    ldy zp_rock_y                                           // 204a: a4 61
    jsr map_write                                           // 204c: 20 7d 11
    lda #$01                                                // 204f: a9 01
    sta l0000                                               // 2051: 85 00
    ldx #$64 // 'd'                                         // 2053: a2 64
    ldy #$01                                                // 2055: a0 01
    jsr sound_play                                          // 2057: 20 69 0f
    ldx zp_rock_type__puzzlepiece_offset                    // 205a: a6 6f
    lda #$00                                                // 205c: a9 00
    sta data_spirit_alive,x                                 // 205e: 9d cb 29
    rts                                                     // 2061: 60
// Referenced 1 time by $2044
spirit_update_direction:
    ldx zp_rock_type__puzzlepiece_offset                    // 2062: a6 6f
    lda #$00                                                // 2064: a9 00
    sta zp_rock_w__print_bcd_lo                             // 2066: 85 68
// Referenced 1 time by $2094
spirit_update_direction_loop:
    ldy zp_rock_w__print_bcd_lo                             // 2068: a4 68
    lda zp_rock_y                                           // 206a: a5 61
    clc                                                     // 206c: 18
    adc lut_spirit_dir_to_dy,y                              // 206d: 79 9a 1f
    pha                                                     // 2070: 48
    lda zp_rock_x                                           // 2071: a5 60
    clc                                                     // 2073: 18
    adc lut_spirit_dir_to_dx,y                              // 2074: 79 97 1f
    tax                                                     // 2077: aa
    pla                                                     // 2078: 68
    tay                                                     // 2079: a8
    jsr map_read                                            // 207a: 20 1a 11
    and #$7f                                                // 207d: 29 7f
    tax                                                     // 207f: aa
    ldy zp_rock_w__print_bcd_lo                             // 2080: a4 68
    lda #$01                                                // 2082: a9 01
    cpx #obj_wall                                           // 2084: e0 10
    bcs spirit_update_direction_blocked                     // 2086: b0 03
    lda lut_spirit_obj_solidness,x                          // 2088: bd d1 20
// Referenced 1 time by $2086
spirit_update_direction_blocked:
    .byt $99, <(l0064), >(l0064) ; sta+2 l0064,y            // 208b: 99 64 00
    inc zp_rock_w__print_bcd_lo                             // 208e: e6 68
    lda zp_rock_w__print_bcd_lo                             // 2090: a5 68
    cmp #$04                                                // 2092: c9 04
    bne spirit_update_direction_loop                        // 2094: d0 d2
// So now 64-67 are set to whether each direction is blocked
    ldx zp_rock_type__puzzlepiece_offset                    // 2096: a6 6f
// If all directions were blocked, give up
    lda l0064                                               // 2098: a5 64
    and zp_rock_thinghit                                    // 209a: 25 65
    and zp_rock_thinghit_x                                  // 209c: 25 66
    and l0067                                               // 209e: 25 67
    beq spirit_update_direction_try_turnleft                // 20a0: f0 06
    lda #$04                                                // 20a2: a9 04
    sta data_spirit_dir,x                                   // 20a4: 9d ca 29
    rts                                                     // 20a7: 60
// Referenced 1 time by $20a0
spirit_update_direction_try_turnleft:
    lda data_spirit_dir,x                                   // 20a8: bd ca 29
    sec                                                     // 20ab: 38
    sbc #$01                                                // 20ac: e9 01
    and #$03                                                // 20ae: 29 03
    tay                                                     // 20b0: a8
    .byt $b9, <(l0064), >(l0064) ; lda+2 l0064,y            // 20b1: b9 64 00
    bne spirit_update_direction_try_straight                // 20b4: d0 05
    tya                                                     // 20b6: 98
    sta data_spirit_dir,x                                   // 20b7: 9d ca 29
    rts                                                     // 20ba: 60
// Referenced 1 time by $20b4
spirit_update_direction_try_straight:
    lda data_spirit_dir,x                                   // 20bb: bd ca 29
// Referenced 1 time by $20cd
spirit_update_direction_straight_right_back_loop:
    tay                                                     // 20be: a8
    .byt $b9, <(l0064), >(l0064) ; lda+2 l0064,y            // 20bf: b9 64 00
    beq spirit_update_direction_nochange                    // 20c2: f0 0c
// Turn right and try again
    tya                                                     // 20c4: 98
    clc                                                     // 20c5: 18
    adc #$01                                                // 20c6: 69 01
    and #$03                                                // 20c8: 29 03
    sta data_spirit_dir,x                                   // 20ca: 9d ca 29
    jmp spirit_update_direction_straight_right_back_loop    // 20cd: 4c be 20
// Referenced 1 time by $20c2
spirit_update_direction_nochange:
    rts                                                     // 20d0: 60
lut_spirit_obj_solidness:
    .byt $00, $00, $00, $00, $00, $00, $01, $00             // 20d1: ........
    .byt $01, $01, $01, $01, $00, $01, $01, $01             // 20d9: ........
// Referenced 1 time by $1f77
init_spirit_direction:
    lda data_spirit_x,x                                     // 20e1: bd c8 29
    lsr                                                     // 20e4: 4a
    lsr                                                     // 20e5: 4a
    sta zp_rock_x                                           // 20e6: 85 60
    lda data_spirit_y,x                                     // 20e8: bd c9 29
    lsr                                                     // 20eb: 4a
    lsr                                                     // 20ec: 4a
    sta zp_rock_y                                           // 20ed: 85 61
    stx zp_rock_type__puzzlepiece_offset                    // 20ef: 86 6f
    ldx zp_rock_type__puzzlepiece_offset                    // 20f1: a6 6f
    lda #$00                                                // 20f3: a9 00
    sta zp_rock_w__print_bcd_lo                             // 20f5: 85 68
// Referenced 1 time by $2123
init_spirit_direction_loop:
    ldy zp_rock_w__print_bcd_lo                             // 20f7: a4 68
    lda zp_rock_y                                           // 20f9: a5 61
    clc                                                     // 20fb: 18
    adc lut_spirit_dir_to_dy,y                              // 20fc: 79 9a 1f
    pha                                                     // 20ff: 48
    lda zp_rock_x                                           // 2100: a5 60
    clc                                                     // 2102: 18
    adc lut_spirit_dir_to_dx,y                              // 2103: 79 97 1f
    tax                                                     // 2106: aa
    pla                                                     // 2107: 68
    tay                                                     // 2108: a8
    jsr map_read                                            // 2109: 20 1a 11
    and #$7f                                                // 210c: 29 7f
    tax                                                     // 210e: aa
    ldy zp_rock_w__print_bcd_lo                             // 210f: a4 68
    lda #$01                                                // 2111: a9 01
    cpx #obj_wall                                           // 2113: e0 10
    bcs init_spirit_direction_blocked                       // 2115: b0 03
    lda lut_spirit_obj_solidness,x                          // 2117: bd d1 20
// Referenced 1 time by $2115
init_spirit_direction_blocked:
    .byt $99, <(l0064), >(l0064) ; sta+2 l0064,y            // 211a: 99 64 00
    inc zp_rock_w__print_bcd_lo                             // 211d: e6 68
    lda zp_rock_w__print_bcd_lo                             // 211f: a5 68
    cmp #$04                                                // 2121: c9 04
    bne init_spirit_direction_loop                          // 2123: d0 d2
    ldx zp_rock_type__puzzlepiece_offset                    // 2125: a6 6f
    lda #$00                                                // 2127: a9 00
    sta zp_transporters_count                               // 2129: 85 6d
    sta zp_rock_curvedness__transporters_ptr                // 212b: 85 6e
// Referenced 1 time by $214d
init_spirit_direction_loop2:
    ldy zp_rock_curvedness__transporters_ptr                // 212d: a4 6e
    .byt $b9, <(l0064), >(l0064) ; lda+2 l0064,y            // 212f: b9 64 00
    beq init_spirit_direction_loop2_notblocked              // 2132: f0 07
    lda #$80                                                // 2134: a9 80
    sta zp_transporters_count                               // 2136: 85 6d
    jmp init_spirit_direction_loop2_nextdir                 // 2138: 4c 47 21
// Referenced 1 time by $2132
init_spirit_direction_loop2_notblocked:
    lda zp_transporters_count                               // 213b: a5 6d
    bpl init_spirit_direction_loop2_nextdir                 // 213d: 10 08
    lda zp_rock_curvedness__transporters_ptr                // 213f: a5 6e
    sta data_spirit_dir,x                                   // 2141: 9d ca 29
    jmp init_spirit_direction_rts                           // 2144: 4c 54 21
// Referenced 2 times by $2138, $213d
init_spirit_direction_loop2_nextdir:
    inc zp_rock_curvedness__transporters_ptr                // 2147: e6 6e
    lda zp_rock_curvedness__transporters_ptr                // 2149: a5 6e
    cmp #$04                                                // 214b: c9 04
    bne init_spirit_direction_loop2                         // 214d: d0 de
    lda #$00                                                // 214f: a9 00
    sta data_spirit_dir,x                                   // 2151: 9d ca 29
// Referenced 1 time by $2144
init_spirit_direction_rts:
    rts                                                     // 2154: 60
// Referenced 1 time by $19b7
rock_fall_move_and_set_curvedleft:
    jsr map_write                                           // 2155: 20 7d 11
    lda #$00                                                // 2158: a9 00
    sta zp_rock_curvedness__transporters_ptr                // 215a: 85 6e
    rts                                                     // 215c: 60
// Referenced 10 times by $27c0, $21a1, $23c1, $23c9, $23ce, $21f1, $27b1, $23b3, $219c, $23bc
print_char:
    sta l0000                                               // 215d: 85 00
    cmp #$04                                                // 215f: c9 04
    bcs print_char2                                         // 2161: b0 07
    tax                                                     // 2163: aa
    lda lut_colour_masks,x                                  // 2164: bd c1 0e
    sta zp_textcolour                                       // 2167: 85 82
    rts                                                     // 2169: 60
// Referenced 1 time by $2161
print_char2:
    ldx l0000                                               // 216a: a6 00
    txa                                                     // 216c: 8a
    bpl print_char4                                         // 216d: 10 12
    and #$c0                                                // 216f: 29 c0
    cmp #$80                                                // 2171: c9 80
    beq print_char3                                         // 2173: f0 06
    txa                                                     // 2175: 8a
    and #$1f                                                // 2176: 29 1f
    sta zp_textpos_y                                        // 2178: 85 81
    rts                                                     // 217a: 60
// Referenced 1 time by $2173
print_char3:
    txa                                                     // 217b: 8a
    and #$1f                                                // 217c: 29 1f
    sta zp_textpos_x                                        // 217e: 85 80
    rts                                                     // 2180: 60
// Referenced 1 time by $216d
print_char4:
    txa                                                     // 2181: 8a
    jsr draw_character                                      // 2182: 20 f8 11
    inc zp_textpos_x                                        // 2185: e6 80
    lda zp_textpos_x                                        // 2187: a5 80
    and #$1f                                                // 2189: 29 1f
    sta zp_textpos_x                                        // 218b: 85 80
    bne print_char_rts                                      // 218d: d0 02
    inc zp_textpos_y                                        // 218f: e6 81
// Referenced 1 time by $218d
print_char_rts:
    rts                                                     // 2191: 60
// Referenced 5 times by $21b7, $21c7, $21ce, $21d7, $21be
print_bcd_digit:
    cmp #$00                                                // 2192: c9 00
    bne print_bcd_notzero                                   // 2194: d0 09
    ldx zp_rock_se__suppressleadingzerosflag                // 2196: a6 6b
    beq print_bcd_rts                                       // 2198: f0 0e
    lda #$30 // '0'                                         // 219a: a9 30
    jmp print_char                                          // 219c: 4c 5d 21
// Referenced 2 times by $2194, $21de
print_bcd_notzero:
    ora #$30 // '0'                                         // 219f: 09 30
    jsr print_char                                          // 21a1: 20 5d 21
    lda #$01                                                // 21a4: a9 01
    sta zp_rock_se__suppressleadingzerosflag                // 21a6: 85 6b
// Referenced 1 time by $2198
print_bcd_rts:
    rts                                                     // 21a8: 60
// Referenced 9 times by $23a3, $270a, $230b, $232d, $26f4, $22fa, $231c, $233d, $237a
print_bcd_from_69_6a:
    lda #$00                                                // 21a9: a9 00
    sta zp_rock_se__suppressleadingzerosflag                // 21ab: 85 6b
    stx zp_textpos_x                                        // 21ad: 86 80
    sty zp_textpos_y                                        // 21af: 84 81
    lda zp_rock_sw__print_bcd_hi                            // 21b1: a5 6a
    lsr                                                     // 21b3: 4a
    lsr                                                     // 21b4: 4a
    lsr                                                     // 21b5: 4a
    lsr                                                     // 21b6: 4a
    jsr print_bcd_digit                                     // 21b7: 20 92 21
    lda zp_rock_sw__print_bcd_hi                            // 21ba: a5 6a
    and #$0f                                                // 21bc: 29 0f
    jsr print_bcd_digit                                     // 21be: 20 92 21
    lda zp_rock_e__print_bcd_mid                            // 21c1: a5 69
    lsr                                                     // 21c3: 4a
    lsr                                                     // 21c4: 4a
    lsr                                                     // 21c5: 4a
    lsr                                                     // 21c6: 4a
    jsr print_bcd_digit                                     // 21c7: 20 92 21
    lda zp_rock_e__print_bcd_mid                            // 21ca: a5 69
    and #$0f                                                // 21cc: 29 0f
    jsr print_bcd_digit                                     // 21ce: 20 92 21
    lda zp_rock_w__print_bcd_lo                             // 21d1: a5 68
    lsr                                                     // 21d3: 4a
    lsr                                                     // 21d4: 4a
    lsr                                                     // 21d5: 4a
    lsr                                                     // 21d6: 4a
    jsr print_bcd_digit                                     // 21d7: 20 92 21
    lda zp_rock_w__print_bcd_lo                             // 21da: a5 68
    and #$0f                                                // 21dc: 29 0f
    jmp print_bcd_notzero                                   // 21de: 4c 9f 21
// Referenced 5 times by $26e1, $22e7, $25cc, $27f5, $271d
print_string:
    stx zp_ptr                                              // 21e1: 86 0a
    sty zp_ptr_hi                                           // 21e3: 84 0b
    lda #$00                                                // 21e5: a9 00
    sta zp_count                                            // 21e7: 85 0c
// Referenced 1 time by $21f6
print_string_loop:
    ldy zp_count                                            // 21e9: a4 0c
    lda (zp_ptr),y                                          // 21eb: b1 0a
    cmp #$0d                                                // 21ed: c9 0d
    beq print_string_rts                                    // 21ef: f0 08
    jsr print_char                                          // 21f1: 20 5d 21
    inc zp_count                                            // 21f4: e6 0c
    jmp print_string_loop                                   // 21f6: 4c e9 21
// Referenced 1 time by $21ef
print_string_rts:
    rts                                                     // 21f9: 60
// Referenced 4 times by $22d8, $26b5, $25b8, $25bd
print_banner:
    lda #<screen_base                                       // 21fa: a9 00
    sta zp_screenaddr                                       // 21fc: 85 8e
    lda #>screen_base // '`'                                // 21fe: a9 60
    sta zp_screenaddr+1                                     // 2200: 85 8f
    tya                                                     // 2202: 98
    clc                                                     // 2203: 18
    adc #>screen_base // '`'                                // 2204: 69 60
    sta l0001                                               // 2206: 85 01
    lda #<screen_base                                       // 2208: a9 00
    sta l0000                                               // 220a: 85 00
// This is probably a bug - this call target is misaligned.
// The effect is to corrupt A, X, Y, zp_ptr, and zp_ptr_hi.
    jsr bug_shouldnt_call_here                              // 220c: 20 f5 10
    nop                                                     // 220f: ea
    nop                                                     // 2210: ea
    lda #$00                                                // 2211: a9 00
    sta zp_tmp4                                             // 2213: 85 04
// Referenced 1 time by $2230
print_banner_loop:
    ldy zp_tmp4                                             // 2215: a4 04
    lda bannerdata,y                                        // 2217: b9 33 22
    jsr draw_subtile                                        // 221a: 20 d5 11
    lda l0000                                               // 221d: a5 00
    clc                                                     // 221f: 18
    adc #$08                                                // 2220: 69 08
    sta l0000                                               // 2222: 85 00
    lda l0001                                               // 2224: a5 01
    adc #$00                                                // 2226: 69 00
    sta l0001                                               // 2228: 85 01
    inc zp_tmp4                                             // 222a: e6 04
    lda zp_tmp4                                             // 222c: a5 04
    cmp #$a0                                                // 222e: c9 a0
    bne print_banner_loop                                   // 2230: d0 e3
    rts                                                     // 2232: 60
bannerdata:
    .byt $6b, $6a, $6a, $85, $6b, $6a, $6a, $6a             // 2233: kjj.kjjj
    .byt $6b, $6a, $6a, $85, $6b, $6a, $6a, $6a             // 223b: kjj.kjjj
    .byt $6b, $84, $6a, $85, $6b, $6a, $6a, $85             // 2243: k.j.kjj.
    .byt $6b, $84, $6a, $85, $6b, $6b, $6b, $6b             // 224b: k.j.kkkk
    .byt $6b, $6a, $6b, $6a, $6b, $6a, $6b, $6b             // 2253: kjkjkjkk
    .byt $6b, $6a, $6b, $6a, $6b, $6b, $6a, $6b             // 225b: kjkjkkjk
    .byt $6b, $6a, $6b, $6a, $6b, $6a, $6b, $6a             // 2263: kjkjkjkj
    .byt $6b, $6b, $6b, $6a, $6b, $6b, $6b, $6b             // 226b: kkkjkkkk
    .byt $6b, $6a, $6a, $87, $6b, $6a, $6a, $6b             // 2273: kjj.kjjk
    .byt $6b, $6a, $6a, $87, $6b, $6b, $6a, $6b             // 227b: kjj.kkjk
    .byt $6b, $6a, $6b, $6a, $6b, $6a, $6b, $6a             // 2283: kjkjkjkj
    .byt $6b, $84, $6a, $87, $6b, $6b, $6b, $6b             // 228b: k.j.kkkk
    .byt $6b, $6a, $86, $85, $6b, $6a, $6b, $6b             // 2293: kj..kjkk
    .byt $6b, $6a, $6b, $6b, $6b, $6b, $6a, $6b             // 229b: kjkkkkjk
    .byt $6b, $6a, $6b, $6a, $6b, $6a, $6b, $6a             // 22a3: kjkjkjkj
    .byt $6b, $6a, $6b, $6b, $6b, $6b, $6b, $6b             // 22ab: kjkkkkkk
    .byt $6b, $6a, $6b, $6a, $6b, $6a, $6a, $6a             // 22b3: kjkjkjjj
    .byt $6b, $6a, $6b, $6b, $6b, $6b, $6a, $6b             // 22bb: kjkkkkjk
    .byt $6b, $86, $6a, $87, $6b, $6a, $6b, $6a             // 22c3: k.j.kjkj
    .byt $6b, $6a, $6a, $6a, $6b, $6b, $6b, $6b             // 22cb: kjjjkkkk
// Referenced 2 times by $23f5, $1d0e
status_screen:
    nop                                                     // 22d3: ea
    nop                                                     // 22d4: ea
    nop                                                     // 22d5: ea
    ldy #$01                                                // 22d6: a0 01
    jsr print_banner                                        // 22d8: 20 fa 21
    lda #$07                                                // 22db: a9 07
    sta zp_textpos_y                                        // 22dd: 85 81
    lda #$05                                                // 22df: a9 05
    sta zp_textpos_x                                        // 22e1: 85 80
    ldx #<string_status_screen // '2'                       // 22e3: a2 32
    ldy #>string_status_screen // '$'                       // 22e5: a0 24
    jsr print_string                                        // 22e7: 20 e1 21
    ldx #$0f                                                // 22ea: a2 0f
    ldy #$0b                                                // 22ec: a0 0b
    lda zp_score_bcd                                        // 22ee: a5 85
    sta zp_rock_w__print_bcd_lo                             // 22f0: 85 68
    lda zp_score_bcd+1                                      // 22f2: a5 86
    sta zp_rock_e__print_bcd_mid                            // 22f4: 85 69
    lda zp_score_bcd+2                                      // 22f6: a5 87
    sta zp_rock_sw__print_bcd_hi                            // 22f8: 85 6a
    jsr print_bcd_from_69_6a                                // 22fa: 20 a9 21
    ldx #$0f                                                // 22fd: a2 0f
    ldy #$0d                                                // 22ff: a0 0d
    lda #$00                                                // 2301: a9 00
    sta zp_rock_e__print_bcd_mid                            // 2303: 85 69
    sta zp_rock_sw__print_bcd_hi                            // 2305: 85 6a
    lda zp_lives                                            // 2307: a5 8a
    sta zp_rock_w__print_bcd_lo                             // 2309: 85 68
    jsr print_bcd_from_69_6a                                // 230b: 20 a9 21
    ldx #$0f                                                // 230e: a2 0f
    ldy #$15                                                // 2310: a0 15
    lda remaining_earth_bcd                                 // 2312: ad e3 0b
    sta zp_rock_w__print_bcd_lo                             // 2315: 85 68
    lda remaining_earth_bcd_hi                              // 2317: ad e4 0b
    sta zp_rock_e__print_bcd_mid                            // 231a: 85 69
    jsr print_bcd_from_69_6a                                // 231c: 20 a9 21
    ldx #$0f                                                // 231f: a2 0f
    ldy #$17                                                // 2321: a0 17
    lda remaining_diamonds_bcd                              // 2323: ad e1 0b
    sta zp_rock_w__print_bcd_lo                             // 2326: 85 68
    lda remaining_diamonds_bcd_hi                           // 2328: ad e2 0b
    sta zp_rock_e__print_bcd_mid                            // 232b: 85 69
    jsr print_bcd_from_69_6a                                // 232d: 20 a9 21
    ldx #$0f                                                // 2330: a2 0f
    ldy #$19                                                // 2332: a0 19
    lda remaining_monsters                                  // 2334: ad e0 0b
    sta zp_rock_w__print_bcd_lo                             // 2337: 85 68
    lda #$00                                                // 2339: a9 00
    sta zp_rock_e__print_bcd_mid                            // 233b: 85 69
    jsr print_bcd_from_69_6a                                // 233d: 20 a9 21
// Count the remaining transporters
    lda #<data_transporters // '@'                          // 2340: a9 40
    sta l0000                                               // 2342: 85 00
    lda #>data_transporters // '('                          // 2344: a9 28
    sta l0001                                               // 2346: 85 01
    lda #total_transporters_bcd // 'd'                      // 2348: a9 64
    sta l0002                                               // 234a: 85 02
// Referenced 2 times by $2370, $236a
count_remaining_transporters_loop:
    ldy #$00                                                // 234c: a0 00
    lda (l0000),y                                           // 234e: b1 00
    bpl transporter_not_taken                               // 2350: 10 09
    sed                                                     // 2352: f8
    lda l0002                                               // 2353: a5 02
    sec                                                     // 2355: 38
    sbc #$01                                                // 2356: e9 01
    sta l0002                                               // 2358: 85 02
    cld                                                     // 235a: d8
// Referenced 1 time by $2350
transporter_not_taken:
    lda l0000                                               // 235b: a5 00
    clc                                                     // 235d: 18
    adc #$01                                                // 235e: 69 01
    sta l0000                                               // 2360: 85 00
    lda l0001                                               // 2362: a5 01
    adc #$00                                                // 2364: 69 00
    sta l0001                                               // 2366: 85 01
    cmp #>data_transporters_end // ')'                      // 2368: c9 29
    bne count_remaining_transporters_loop                   // 236a: d0 e0
    lda l0000                                               // 236c: a5 00
    cmp #<data_transporters_end                             // 236e: c9 c0
    bne count_remaining_transporters_loop                   // 2370: d0 da
// Report the number remaining and update remaining_transporters_bcd
    lda l0002                                               // 2372: a5 02
    sta zp_rock_w__print_bcd_lo                             // 2374: 85 68
    ldx #$0f                                                // 2376: a2 0f
    ldy #$11                                                // 2378: a0 11
    jsr print_bcd_from_69_6a                                // 237a: 20 a9 21
    lda zp_rock_w__print_bcd_lo                             // 237d: a5 68
    sta remaining_transporters_bcd                          // 237f: 8d e6 0b
// Count remaining puzzle pieces
    lda #total_puzzlepieces_bcd // 'B'                      // 2382: a9 42
    sta l0002                                               // 2384: 85 02
    ldy #$00                                                // 2386: a0 00
// Referenced 1 time by $2399
count_remaining_puzzlepieces_loop:
    lda data_puzzlepieces_level,y                           // 2388: b9 f8 29
    bpl puzzlepieces_not_taken                              // 238b: 10 09
    sed                                                     // 238d: f8
    lda l0002                                               // 238e: a5 02
    sec                                                     // 2390: 38
    sbc #$01                                                // 2391: e9 01
    sta l0002                                               // 2393: 85 02
    cld                                                     // 2395: d8
// Referenced 1 time by $238b
puzzlepieces_not_taken:
    iny                                                     // 2396: c8
    cpy #42*4                                               // 2397: c0 a8
    bne count_remaining_puzzlepieces_loop                   // 2399: d0 ed
// Report the number remaining and update remaining_puzzlepieces_bcd
    lda l0002                                               // 239b: a5 02
    sta zp_rock_w__print_bcd_lo                             // 239d: 85 68
    ldx #$0f                                                // 239f: a2 0f
    ldy #$13                                                // 23a1: a0 13
    jsr print_bcd_from_69_6a                                // 23a3: 20 a9 21
    lda zp_rock_w__print_bcd_lo                             // 23a6: a5 68
    sta remaining_puzzlepieces_bcd                          // 23a8: 8d e5 0b
// Referenced 1 time by $23e3
print_sound_state:
    lda #$0f                                                // 23ab: a9 0f
    sta zp_textpos_x                                        // 23ad: 85 80
    sta zp_textpos_y                                        // 23af: 85 81
    lda #$4f // 'O'                                         // 23b1: a9 4f
    jsr print_char                                          // 23b3: 20 5d 21
    lda zp_soundon                                          // 23b6: a5 83
    bne print_sound_state_on                                // 23b8: d0 0d
    lda #$46 // 'F'                                         // 23ba: a9 46
    jsr print_char                                          // 23bc: 20 5d 21
    lda #$46 // 'F'                                         // 23bf: a9 46
    jsr print_char                                          // 23c1: 20 5d 21
    jmp status_check_for_escape                             // 23c4: 4c d1 23
// Referenced 1 time by $23b8
print_sound_state_on:
    lda #$4e // 'N'                                         // 23c7: a9 4e
    jsr print_char                                          // 23c9: 20 5d 21
    lda #$20 // ' '                                         // 23cc: a9 20
    jsr print_char                                          // 23ce: 20 5d 21
// Referenced 1 time by $23c4
status_check_for_escape:
    jsr check_audio_keys                                    // 23d1: 20 d3 0f
    lda #keycode_escape                                     // 23d4: a9 8f
    jsr kbd_test                                            // 23d6: 20 95 0f
    beq status_check_for_space                              // 23d9: f0 03
    jmp escape_quit_game                                    // 23db: 4c d6 26
// Referenced 1 time by $23d9
status_check_for_space:
    lda #keycode_space                                      // 23de: a9 9d
    jsr kbd_test                                            // 23e0: 20 95 0f
    beq print_sound_state                                   // 23e3: f0 c6
    jmp update_skulls                                       // 23e5: 4c fb 24
// Referenced 1 time by $1ef7
statustrigger:
    lda #$01                                                // 23e8: a9 01
    sta repton_moving_y                                     // 23ea: 8d ff 0b
    lda #$00                                                // 23ed: a9 00
    sta repton_moving_x                                     // 23ef: 8d fe 0b
    jsr random_clear                                        // 23f2: 20 77 1b
    jsr status_screen                                       // 23f5: 20 d3 22
    dec zp_screen_topleft_y                                 // 23f8: c6 8d
    jsr reenter_game                                        // 23fa: 20 dc 13
    jmp after_hit_checks                                    // 23fd: 4c 15 1f
// Referenced 2 times by $1623, $33b5
after_transporter:
// Restore colour 3 to green
    lda #$32 // '2'                                         // 2400: a9 32
    jsr vdu19                                               // 2402: 20 9f 0f
    lda zp_current_level                                    // 2405: a5 8b
    and #$03                                                // 2407: 29 03
    tax                                                     // 2409: aa
// Depending on low bits of level, colour 1 or 3 changes
    lda lut_level_palettes,x                                // 240a: bd c5 0e
    jsr vdu19                                               // 240d: 20 9f 0f
// There's some additional palette setup too sometimes
    lda #$00                                                // 2410: a9 00
    jsr additional_palette_setup                            // 2412: 20 82 33
    lda l0088                                               // 2415: a5 88
    asl                                                     // 2417: 0a
    asl                                                     // 2418: 0a
    sec                                                     // 2419: 38
    sbc #$0e                                                // 241a: e9 0e
    sta zp_screen_topleft_x                                 // 241c: 85 8c
    lda l0089                                               // 241e: a5 89
    asl                                                     // 2420: 0a
    asl                                                     // 2421: 0a
    sec                                                     // 2422: 38
    sbc #$0e                                                // 2423: e9 0e
    sta zp_screen_topleft_y                                 // 2425: 85 8d
    lda #$00                                                // 2427: a9 00
    sta repton_moving_x                                     // 2429: 8d fe 0b
    sta repton_moving_y                                     // 242c: 8d ff 0b
    jmp reenter_after_spawn                                 // 242f: 4c 11 1d
string_status_screen:
    .byt $03                                                // 2432: .
    .byt "Written by Tim Tyler"                             // 2433: 57 72 69 ...
    .byt $80, $c8                                           // 2447: ..
    .byt "for Superior Software LTD 1985."                  // 2449: 66 6f 72 ...
    .byt $87, $cb, $01                                      // 2468: ...
    .byt "Score :"                                          // 246b: 53 63 6f ...
    .byt $87, $cd                                           // 2472: ..
    .byt "Lives :"                                          // 2474: 4c 69 76 ...
    .byt $87, $cf                                           // 247b: ..
    .byt "Sound :"                                          // 247d: 53 6f 75 ...
    .byt $80, $d1                                           // 2484: ..
    .byt "Transporters :"                                   // 2486: 54 72 61 ...
    .byt $86, $d3                                           // 2494: ..
    .byt "Puzzle :"                                         // 2496: 50 75 7a ...
    .byt $87, $d5                                           // 249e: ..
    .byt "Earth :"                                          // 24a0: 45 61 72 ...
    .byt $84, $d7                                           // 24a7: ..
    .byt "Diamonds :"                                       // 24a9: 44 69 61 ...
    .byt $84, $d9                                           // 24b3: ..
    .byt "Monsters :"                                       // 24b5: 4d 6f 6e ...
    .byt $82, $dc                                           // 24bf: ..
    .byt "Press "                                           // 24c1: 50 72 65 ...
    .byt $02                                                // 24c7: .
    .byt "ESCAPE "                                          // 24c8: 45 53 43 ...
    .byt $01                                                // 24cf: .
    .byt "to end game."                                     // 24d0: 74 6f 20 ...
    .byt $82, $de                                           // 24dc: ..
    .byt "Press "                                           // 24de: 50 72 65 ...
    .byt $02                                                // 24e4: .
    .byt "SPACE "                                           // 24e5: 53 50 41 ...
    .byt $01                                                // 24eb: .
    .byt "to play game."                                    // 24ec: 74 6f 20 ...
    .byt $02, $0d                                           // 24f9: ..
// Referenced 1 time by $23e5
update_skulls:
    lda zp_current_level                                    // 24fb: a5 8b
    bne update_skulls_done                                  // 24fd: d0 42
update_skulls_monsters:
    lda remaining_monsters                                  // 24ff: ad e0 0b
    bne update_skulls_diamonds                              // 2502: d0 06
    sta mapdata1_skulls_monsters1                           // 2504: 8d 21 04
    sta mapdata1_skulls_monsters2                           // 2507: 8d a1 04
// Referenced 1 time by $2502
update_skulls_diamonds:
    lda remaining_diamonds_bcd                              // 250a: ad e1 0b
    ora remaining_diamonds_bcd_hi                           // 250d: 0d e2 0b
    bne update_skulls_earth                                 // 2510: d0 06
    sta mapdata1_skulls_diamonds1                           // 2512: 8d 23 04
    sta mapdata1_skulls_diamonds2                           // 2515: 8d a3 04
// Referenced 1 time by $2510
update_skulls_earth:
    lda remaining_earth_bcd                                 // 2518: ad e3 0b
    ora remaining_earth_bcd_hi                              // 251b: 0d e4 0b
    bne update_skulls_transporters                          // 251e: d0 06
    sta mapdata1_skulls_earth1                              // 2520: 8d 25 04
    sta mapdata1_skulls_earth2                              // 2523: 8d a5 04
// Referenced 1 time by $251e
update_skulls_transporters:
    lda remaining_transporters_bcd                          // 2526: ad e6 0b
    bne update_skulls_puzzlepieces                          // 2529: d0 06
    sta mapdata1_skulls_transporters1                       // 252b: 8d 29 04
    sta mapdata1_skulls_transporters2                       // 252e: 8d a9 04
// Referenced 1 time by $2529
update_skulls_puzzlepieces:
    jsr check_remaining_puzzlepieces                        // 2531: 20 a8 08
    bne update_skulls_done2                                 // 2534: d0 06
    sta mapdata1_skulls_puzzlepieces1                       // 2536: 8d 27 04
    sta mapdata1_skulls_puzzlepieces2                       // 2539: 8d a7 04
// Referenced 1 time by $2534
update_skulls_done2:
    nop                                                     // 253c: ea
    nop                                                     // 253d: ea
    nop                                                     // 253e: ea
    nop                                                     // 253f: ea
    nop                                                     // 2540: ea
// Referenced 1 time by $24fd
update_skulls_done:
    rts                                                     // 2541: 60
// Referenced 1 time by $1cb2
setup_monsters_diamonds_earth_counters:
    lda #$18                                                // 2542: a9 18
    sta remaining_monsters                                  // 2544: 8d e0 0b
    lda #$34 // '4'                                         // 2547: a9 34
    sta remaining_diamonds_bcd                              // 2549: 8d e1 0b
    lda #$16                                                // 254c: a9 16
    sta remaining_diamonds_bcd_hi                           // 254e: 8d e2 0b
    lda #$44 // 'D'                                         // 2551: a9 44
    sta remaining_earth_bcd                                 // 2553: 8d e3 0b
    lda #$47 // 'G'                                         // 2556: a9 47
    sta remaining_earth_bcd_hi                              // 2558: 8d e4 0b
    rts                                                     // 255b: 60
// Referenced 1 time by $1f12
decrement_remaining_earth:
    sed                                                     // 255c: f8
    sec                                                     // 255d: 38
    lda remaining_earth_bcd                                 // 255e: ad e3 0b
    sbc #$01                                                // 2561: e9 01
    sta remaining_earth_bcd                                 // 2563: 8d e3 0b
    lda remaining_earth_bcd_hi                              // 2566: ad e4 0b
    sbc #$00                                                // 2569: e9 00
    sta remaining_earth_bcd_hi                              // 256b: 8d e4 0b
    cld                                                     // 256e: d8
    rts                                                     // 256f: 60
// Referenced 1 time by $1570
decrement_remaining_diamonds:
    sed                                                     // 2570: f8
    sec                                                     // 2571: 38
    lda remaining_diamonds_bcd                              // 2572: ad e1 0b
    sbc #$01                                                // 2575: e9 01
    sta remaining_diamonds_bcd                              // 2577: 8d e1 0b
    lda remaining_diamonds_bcd_hi                           // 257a: ad e2 0b
    sbc #$00                                                // 257d: e9 00
    sta remaining_diamonds_bcd_hi                           // 257f: 8d e2 0b
    cld                                                     // 2582: d8
    rts                                                     // 2583: 60
// Referenced 1 time by $187e
decrement_remaining_monsters:
    sed                                                     // 2584: f8
    sec                                                     // 2585: 38
    lda remaining_monsters                                  // 2586: ad e0 0b
    sbc #$01                                                // 2589: e9 01
    sta remaining_monsters                                  // 258b: 8d e0 0b
    cld                                                     // 258e: d8
    rts                                                     // 258f: 60
// Referenced 1 time by $2599
not_victory:
    jmp after_hit_checks                                    // 2590: 4c 15 1f
// Referenced 1 time by $1ef0
check_for_victory:
    lda remaining_puzzlepieces_bcd                          // 2593: ad e5 0b
    ora remaining_transporters_bcd                          // 2596: 0d e6 0b
    bne not_victory                                         // 2599: d0 f5
    ldx #$00                                                // 259b: a2 00
    txa                                                     // 259d: 8a
// Referenced 1 time by $25a2
victory_clearmapdata1_loop:
    sta mapdata1,x                                          // 259e: 9d 00 04
    inx                                                     // 25a1: e8
    bne victory_clearmapdata1_loop                          // 25a2: d0 fa
    lda #$00                                                // 25a4: a9 00
    sta zp_screen_topleft_x                                 // 25a6: 85 8c
    sta zp_screen_topleft_y                                 // 25a8: 85 8d
    jsr transporter_effect                                  // 25aa: 20 55 14
    jsr reenter_game                                        // 25ad: 20 dc 13
    jsr transporter_effect                                  // 25b0: 20 55 14
    jsr dissolve                                            // 25b3: 20 c4 1b
    ldy #$01                                                // 25b6: a0 01
    jsr print_banner                                        // 25b8: 20 fa 21
    ldy #$1a                                                // 25bb: a0 1a
    jsr print_banner                                        // 25bd: 20 fa 21
    lda #$07                                                // 25c0: a9 07
    sta zp_textpos_x                                        // 25c2: 85 80
    lda #$07                                                // 25c4: a9 07
    sta zp_textpos_y                                        // 25c6: 85 81
    ldx #<string_congratulations                            // 25c8: a2 dc
    ldy #>string_congratulations // '%'                     // 25ca: a0 25
    jsr print_string                                        // 25cc: 20 e1 21
// Referenced 1 time by $25d4
press_space_for_new_game:
    lda #keycode_space                                      // 25cf: a9 9d
    jsr kbd_test                                            // 25d1: 20 95 0f
    beq press_space_for_new_game                            // 25d4: f0 f9
    jsr dissolve                                            // 25d6: 20 c4 1b
    jmp newgame2                                            // 25d9: 4c a4 1c
string_congratulations:
    .byt $02                                                // 25dc: .
    .byt "Congratulations!"                                 // 25dd: 43 6f 6e ...
    .byt $83, $c9                                           // 25ed: ..
    .byt "You have completed REPTON2."                      // 25ef: 59 6f 75 ...
    .byt $01, $80, $cc                                      // 260a: ...
    .byt "Send a photograph of this screen"                 // 260d: 53 65 6e ...
    .byt $ce                                                // 262d: .
    .byt "to SUPERIOR SOFTWARE to enter"                    // 262e: 74 6f 20 ...
    .byt $80, $d0                                           // 264b: ..
    .byt "their competition."                               // 264d: 74 68 65 ...
    .byt $03, $86, $d5                                      // 265f: ...
    .byt "Now try again."                                   // 2662: 4e 6f 77 ...
    .byt $0d, $00, $00, $00, $00, $00, $00, $00             // 2670: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 2678: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 2680: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 2688: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 2690: ........
    .byt $00, $00, $00, $00                                 // 2698: ....
highscore_bcd:
    .byt $00, $10, $00                                      // 269c: ...
highscore_name:
    .byt "Superior Software"                                // 269f: 53 75 70 ...
    .byt $0d, $0d, $0d                                      // 26b0: ...
// Referenced 2 times by $26d9, $1c7e
end_of_game_screen:
    ldy #$04                                                // 26b3: a0 04
    jsr print_banner                                        // 26b5: 20 fa 21
    lda zp_score_bcd+2                                      // 26b8: a5 87
    cmp highscore_bcd+2                                     // 26ba: cd 9e 26
    bcc score_less_than_highscore                           // 26bd: 90 1d
    bne score_greater_than_highscore                        // 26bf: d0 12
    lda zp_score_bcd+1                                      // 26c1: a5 86
    cmp highscore_bcd+1                                     // 26c3: cd 9d 26
    bcc score_less_than_highscore                           // 26c6: 90 14
    bne score_greater_than_highscore                        // 26c8: d0 09
    lda zp_score_bcd                                        // 26ca: a5 85
    cmp highscore_bcd                                       // 26cc: cd 9c 26
    bcc score_less_than_highscore                           // 26cf: 90 0b
    beq score_less_than_highscore                           // 26d1: f0 09
// Referenced 2 times by $26c8, $26bf
score_greater_than_highscore:
    jsr new_highscore                                       // 26d3: 20 75 27
// Referenced 1 time by $23db
escape_quit_game:
    jsr dissolve                                            // 26d6: 20 c4 1b
    jmp end_of_game_screen                                  // 26d9: 4c b3 26
// Referenced 4 times by $26d1, $26bd, $26c6, $26cf
score_less_than_highscore:
    nop                                                     // 26dc: ea
    ldx #<string_end_of_game_screen // '0'                  // 26dd: a2 30
    ldy #>string_end_of_game_screen // '''                  // 26df: a0 27
    jsr print_string                                        // 26e1: 20 e1 21
    ldx #$0c                                                // 26e4: a2 0c
    ldy #$0d                                                // 26e6: a0 0d
    lda zp_score_bcd                                        // 26e8: a5 85
    sta zp_rock_w__print_bcd_lo                             // 26ea: 85 68
    lda zp_score_bcd+1                                      // 26ec: a5 86
    sta zp_rock_e__print_bcd_mid                            // 26ee: 85 69
    lda zp_score_bcd+2                                      // 26f0: a5 87
    sta zp_rock_sw__print_bcd_hi                            // 26f2: 85 6a
    jsr print_bcd_from_69_6a                                // 26f4: 20 a9 21
    ldx #$0b                                                // 26f7: a2 0b
    ldy #$13                                                // 26f9: a0 13
    lda highscore_bcd                                       // 26fb: ad 9c 26
    sta zp_rock_w__print_bcd_lo                             // 26fe: 85 68
    lda highscore_bcd+1                                     // 2700: ad 9d 26
    sta zp_rock_e__print_bcd_mid                            // 2703: 85 69
    lda highscore_bcd+2                                     // 2705: ad 9e 26
    sta zp_rock_sw__print_bcd_hi                            // 2708: 85 6a
    jsr print_bcd_from_69_6a                                // 270a: 20 a9 21
    lda #$0f                                                // 270d: a9 0f
    sta zp_textcolour                                       // 270f: 85 82
    lda #$06                                                // 2711: a9 06
    sta zp_textpos_x                                        // 2713: 85 80
    lda #$17                                                // 2715: a9 17
    sta zp_textpos_y                                        // 2717: 85 81
    ldx #<highscore_name                                    // 2719: a2 9f
    ldy #>highscore_name // '&'                             // 271b: a0 26
    jsr print_string                                        // 271d: 20 e1 21
// Referenced 1 time by $2728
end_of_game_wait_for_space:
    jsr check_audio_keys                                    // 2720: 20 d3 0f
    lda #keycode_space                                      // 2723: a9 9d
    jsr kbd_test                                            // 2725: 20 95 0f
    beq end_of_game_wait_for_space                          // 2728: f0 f6
    jsr dissolve                                            // 272a: 20 c4 1b
    jmp newgame1                                            // 272d: 4c 94 1c
string_end_of_game_screen:
    .byt $01, $89, $cb                                      // 2730: ...
    .byt "Last score"                                       // 2733: 4c 61 73 ...
    .byt $85, $d1                                           // 273d: ..
    .byt "Highest score so far"                             // 273f: 48 69 67 ...
    .byt $8d, $d5, $42, $79, $82, $dc                       // 2753: ..By..
    .byt "Press "                                           // 2759: 50 72 65 ...
    .byt $02                                                // 275f: .
    .byt "SPACE BAR "                                       // 2760: 53 50 41 ...
    .byt $01                                                // 276a: .
    .byt "to play."                                         // 276b: 74 6f 20 ...
    .byt $02, $0d                                           // 2773: ..
// Referenced 1 time by $26d3
new_highscore:
    ldx #<string_enter_your_name                            // 2775: a2 d7
    ldy #>string_enter_your_name // '''                     // 2777: a0 27
    jsr print_string_flush_buffers                          // 2779: 20 f5 27
    lda zp_score_bcd                                        // 277c: a5 85
    sta highscore_bcd                                       // 277e: 8d 9c 26
    lda zp_score_bcd+1                                      // 2781: a5 86
    sta highscore_bcd+1                                     // 2783: 8d 9d 26
    lda zp_score_bcd+2                                      // 2786: a5 87
    sta highscore_bcd+2                                     // 2788: 8d 9e 26
    lda #$00                                                // 278b: a9 00
    sta zp_rock_x                                           // 278d: 85 60
// Referenced 5 times by $27a1, $27c5, $27a9, $27b6, $27bb
new_highscore_read_name_loop:
// Clear escape condition
    lda #$7c // '|'                                         // 278f: a9 7c
    jsr osbyte                                              // 2791: 20 f4 ff
    jsr osrdch                                              // 2794: 20 e0 ff
    nop                                                     // 2797: ea
    nop                                                     // 2798: ea
    ldx zp_rock_x                                           // 2799: a6 60
    cmp #$0d                                                // 279b: c9 0d
    beq new_highscore_read_name_done                        // 279d: f0 29
    cmp #$20 // ' '                                         // 279f: c9 20
    bcc new_highscore_read_name_loop                        // 27a1: 90 ec
    cmp #$7f                                                // 27a3: c9 7f
    bne new_highscore_read_name_addchar                     // 27a5: d0 12
    lda zp_rock_x                                           // 27a7: a5 60
    beq new_highscore_read_name_loop                        // 27a9: f0 e4
    dec zp_rock_x                                           // 27ab: c6 60
    dec zp_textpos_x                                        // 27ad: c6 80
    lda #$20 // ' '                                         // 27af: a9 20
    jsr print_char                                          // 27b1: 20 5d 21
    dec zp_textpos_x                                        // 27b4: c6 80
    jmp new_highscore_read_name_loop                        // 27b6: 4c 8f 27
// Referenced 1 time by $27a5
new_highscore_read_name_addchar:
    cpx #$13                                                // 27b9: e0 13
    beq new_highscore_read_name_loop                        // 27bb: f0 d2
    sta highscore_name,x                                    // 27bd: 9d 9f 26
    jsr print_char                                          // 27c0: 20 5d 21
    inc zp_rock_x                                           // 27c3: e6 60
    jmp new_highscore_read_name_loop                        // 27c5: 4c 8f 27
// Referenced 1 time by $279d
new_highscore_read_name_done:
    ldy zp_rock_x                                           // 27c8: a4 60
// Referenced 1 time by $27d0
new_highscore_pad_name_loop:
    sta highscore_name,y                                    // 27ca: 99 9f 26
    iny                                                     // 27cd: c8
    cpy #$14                                                // 27ce: c0 14
    bne new_highscore_pad_name_loop                         // 27d0: d0 f8
    lda #$0d                                                // 27d2: a9 0d
    jmp oswrch                                              // 27d4: 4c ee ff
string_enter_your_name:
    .byt $03, $82, $cd                                      // 27d7: ...
    .byt "Please enter your name:"                          // 27da: 50 6c 65 ...
    .byt $02, $86, $d0, $0d                                 // 27f1: ....
// Referenced 1 time by $2779
print_string_flush_buffers:
    jsr print_string                                        // 27f5: 20 e1 21
    lda #$0f                                                // 27f8: a9 0f
    ldx #$00                                                // 27fa: a2 00
    jmp osbyte                                              // 27fc: 4c f4 ff
    .byt $ea                                                // 27ff: .
// Each level consists of four 32x8 strips.  Positive values refer to entries in data_levelstrip_xx
// For a negative value, clear the top bit and fill the level strip with that object
//     e.g. &98 => fill with object &18 which is a type of wall
data_level_strip_indices:
data_level_00_strips:
    .byt $00, $01, $02, $80                                 // 2800: ....
data_level_01_strips:
    .byt $03, $04, $05, $06                                 // 2804: ....
data_level_02_strips:
    .byt $07, $08, $98, $09                                 // 2808: ....
data_level_03_strips:
    .byt $0a, $0b, $0c, $0a                                 // 280c: ....
data_level_04_strips:
    .byt $0d, $0e, $0f, $9e                                 // 2810: ....
data_level_05_strips:
    .byt $10, $11, $88, $88                                 // 2814: ....
data_level_06_strips:
    .byt $12, $13, $14, $15                                 // 2818: ....
data_level_07_strips:
    .byt $16, $17, $18, $0a                                 // 281c: ....
data_level_08_strips:
    .byt $19, $1a, $1b, $99                                 // 2820: ....
data_level_09_strips:
    .byt $88, $1c, $1d, $1e                                 // 2824: ....
data_level_0a_strips:
    .byt $1f, $20, $21, $99                                 // 2828: . !.
data_level_0b_strips:
    .byt $22, $23, $99, $24                                 // 282c: "#.$
data_level_0c_strips:
    .byt $25, $26, $27, $9e                                 // 2830: %&'.
data_level_0d_strips:
    .byt $28, $29, $2a, $88                                 // 2834: ()*.
data_level_0e_strips:
    .byt $2b, $2c, $2d, $9e                                 // 2838: +,-.
data_level_0f_strips:
    .byt $2e, $86, $86, $2f                                 // 283c: .../
// Six bytes per transporter - level, x, y, target level, target x, target y.  This is constant data except that the top bit of 'level' gets set when the transporter is collected.  This is then cleared next time a new game is started, along with all the top bits of this block and the next few blocks (spirits, monsters, puzzle pieces).
data_transporters:
data_transporter_00:
    .byt $00, $00, $08, $0d, $1e, $17                       // 2840: ......
data_transporter_01:
    .byt $00, $00, $12, $0b, $11, $18                       // 2846: ......
data_transporter_02:
    .byt $00, $00, $15, $02, $00, $1e                       // 284c: ......
data_transporter_03:
    .byt $00, $02, $08, $08, $04, $0f                       // 2852: ......
data_transporter_04:
    .byt $00, $03, $10, $05, $00, $00                       // 2858: ......
data_transporter_05:
    .byt $00, $05, $10, $02, $00, $01                       // 285e: ......
data_transporter_06:
    .byt $00, $0e, $02, $0b, $07, $01                       // 2864: ......
data_transporter_07:
    .byt $00, $0e, $15, $09, $10, $14                       // 286a: ......
data_transporter_08:
    .byt $00, $0f, $01, $0a, $01, $04                       // 2870: ......
data_transporter_09:
    .byt $00, $15, $04, $0c, $00, $00                       // 2876: ......
data_transporter_0a:
    .byt $00, $15, $07, $04, $0f, $13                       // 287c: ......
data_transporter_0b:
    .byt $00, $15, $08, $04, $0c, $0d                       // 2882: ......
data_transporter_0c:
    .byt $00, $15, $0e, $06, $08, $05                       // 2888: ......
data_transporter_0d:
    .byt $00, $16, $06, $04, $0c, $0f                       // 288e: ......
data_transporter_0e:
    .byt $00, $16, $07, $04, $12, $17                       // 2894: ......
data_transporter_0f:
    .byt $00, $16, $0e, $07, $09, $0f                       // 289a: ......
data_transporter_10:
    .byt $00, $1a, $16, $07, $14, $06                       // 28a0: ......
data_transporter_11:
    .byt $00, $1f, $05, $01, $02, $0c                       // 28a6: ......
data_transporter_12:
    .byt $00, $1c, $11, $01, $14, $09                       // 28ac: ......
data_transporter_13:
    .byt $00, $1c, $16, $03, $00, $00                       // 28b2: ......
data_transporter_14:
    .byt $00, $1e, $13, $00, $10, $17                       // 28b8: ......
data_transporter_15:
    .byt $00, $1e, $15, $07, $00, $18                       // 28be: ......
data_transporter_16:
    .byt $01, $18, $1d, $00, $10, $04                       // 28c4: ......
data_transporter_17:
    .byt $01, $11, $10, $00, $08, $06                       // 28ca: ......
data_transporter_18:
    .byt $02, $16, $1f, $02, $18, $1f                       // 28d0: ......
data_transporter_19:
    .byt $02, $18, $18, $02, $16, $18                       // 28d6: ......
data_transporter_1a:
    .byt $02, $10, $18, $02, $05, $0c                       // 28dc: ......
data_transporter_1b:
    .byt $02, $01, $0e, $00, $00, $15                       // 28e2: ......
data_transporter_1c:
    .byt $02, $0c, $0f, $00, $05, $17                       // 28e8: ......
data_transporter_1d:
    .byt $03, $1f, $00, $03, $0f, $06                       // 28ee: ......
data_transporter_1e:
    .byt $03, $0f, $07, $03, $00, $12                       // 28f4: ......
data_transporter_1f:
    .byt $03, $1f, $0b, $03, $0f, $1e                       // 28fa: ......
data_transporter_20:
    .byt $03, $0f, $1f, $03, $1f, $18                       // 2900: ......
data_transporter_21:
    .byt $03, $00, $18, $00, $00, $06                       // 2906: ......
data_transporter_22:
    .byt $04, $16, $17, $00, $00, $18                       // 290c: ......
data_transporter_23:
    .byt $04, $11, $15, $00, $07, $06                       // 2912: ......
data_transporter_24:
    .byt $04, $0e, $11, $00, $0d, $06                       // 2918: ......
data_transporter_25:
    .byt $04, $0c, $0c, $04, $01, $11                       // 291e: ......
data_transporter_26:
    .byt $04, $1a, $02, $00, $08, $13                       // 2924: ......
data_transporter_27:
    .byt $05, $1d, $0d, $00, $1d, $06                       // 292a: ......
data_transporter_28:
    .byt $06, $15, $16, $00, $1e, $16                       // 2930: ......
data_transporter_29:
    .byt $07, $1e, $16, $00, $19, $0d                       // 2936: ......
data_transporter_2a:
l2940 = data_transporter_2a+4
    .byt $07, $13, $06, $00, $17, $11                       // 293c: ......
data_transporter_2b:
    .byt $07, $1f, $18, $00, $1b, $13                       // 2942: ......
data_transporter_2c:
    .byt $08, $1a, $01, $00, $1e, $12                       // 2948: ......
data_transporter_2d:
    .byt $09, $1f, $08, $00, $06, $08                       // 294e: ......
data_transporter_2e:
    .byt $0a, $0b, $06, $00, $06, $0a                       // 2954: ......
data_transporter_2f:
    .byt $0b, $00, $00, $00, $12, $10                       // 295a: ......
data_transporter_30:
    .byt $0b, $0d, $1f, $00, $12, $12                       // 2960: ......
data_transporter_31:
    .byt $0c, $10, $07, $00, $12, $0e                       // 2966: ......
data_transporter_32:
    .byt $0d, $03, $01, $0e, $00, $00                       // 296c: ......
data_transporter_33:
    .byt $0e, $12, $0d, $0f, $00, $00                       // 2972: ......
data_transporter_34:
    .byt $0f, $16, $1e, $00, $0f, $1f                       // 2978: ......
data_transporter_35:
    .byt $0f, $03, $1f, $0f, $03, $1f                       // 297e: ......
data_transporter_36:
    .byt $0f, $05, $1f, $0f, $05, $1f                       // 2984: ......
data_transporter_37:
    .byt $0f, $07, $1f, $0f, $07, $1f                       // 298a: ......
data_transporter_38:
    .byt $0f, $09, $1f, $0f, $09, $1f                       // 2990: ......
data_transporter_39:
    .byt $0f, $0b, $1f, $0f, $0b, $1f                       // 2996: ......
data_transporter_3a:
l29a0 = data_transporter_3a+4
    .byt $0f, $0d, $1f, $0f, $0d, $1f                       // 299c: ......
data_transporter_3b:
    .byt $0f, $0f, $1f, $0f, $0f, $1f                       // 29a2: ......
data_transporter_3c:
    .byt $0f, $11, $1f, $0f, $11, $1f                       // 29a8: ......
data_transporter_3d:
    .byt $0f, $13, $1f, $0f, $13, $1f                       // 29ae: ......
data_transporter_3e:
    .byt $0f, $15, $1f, $0f, $15, $1f                       // 29b4: ......
data_transporter_3f:
    .byt $0f, $17, $1f, $0f, $17, $1f                       // 29ba: ......
data_transporters_end:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29c0: ........
// Each spirit gets four bytes - its x,y position, the direction it's moving in, and whether or not it is alive.  This is variable data.
data_spirit_x:
data_spirit_y = data_spirit_x+1
data_spirit_dir = data_spirit_x+2
data_spirit_alive = data_spirit_x+3
    .byt $79, $00, $00, $00, $00, $00, $00, $00             // 29c8: y.......
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29d0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29d8: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29e0: ........
// There appear to be 8 bytes per monster, storing the x,y position, x,y velocity, a timer to track the cracked egg and initial stationary period, and a flag to say whether the monster is alive.  The last two bytes for each monster appear to be unused.  This is variable data.
data_monsters_x:
data_monsters_y = data_monsters_x+1
data_monsters_vel_x = data_monsters_x+2
data_monsters_vel_y = data_monsters_x+3
data_monsters_spawntimer = data_monsters_x+4
data_monsters_alive = data_monsters_x+5
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29e8: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 29f0: ........
// Each puzzle pieces has four bytes - the level it appears in, its x,y location in that level, and its position within the assembled puzzle at the bottom of map 0.  Most of this is constant data, but the top bit of 'level' is variable - it gets set when the piece is collected.
data_puzzlepieces_level:
data_puzzlepieces_x = data_puzzlepieces_level+1
data_puzzlepieces_y = data_puzzlepieces_level+2
data_puzzlepieces_pos = data_puzzlepieces_level+3
    .byt $01, $02, $06, $02, $01, $10, $14, $03             // 29f8: ........
    .byt $01, $02, $17, $04, $02, $02, $0c, $05             // 2a00: ........
    .byt $02, $03, $0f, $06, $02, $06, $1c, $07             // 2a08: ........
    .byt $03, $04, $0f, $08, $03, $06, $0f, $09             // 2a10: ........
    .byt $03, $04, $11, $0a, $03, $06, $11, $0b             // 2a18: ........
    .byt $03, $15, $07, $0c, $03, $07, $0d, $0d             // 2a20: ........
    .byt $04, $12, $06, $12, $04, $0e, $0e, $13             // 2a28: ........
    .byt $04, $11, $12, $14, $04, $14, $16, $15             // 2a30: ........
    .byt $04, $0b, $13, $16, $04, $0a, $16, $17             // 2a38: ........
    .byt $07, $1e, $10, $18, $08, $08, $02, $19             // 2a40: ........
    .byt $08, $09, $06, $1a, $08, $08, $0a, $1b             // 2a48: ........
    .byt $09, $09, $13, $1c, $09, $0b, $13, $1d             // 2a50: ........
    .byt $0a, $01, $07, $22, $0a, $15, $16, $23             // 2a58: ..."...#
    .byt $0a, $13, $13, $24, $0a, $02, $11, $25             // 2a60: ...$...%
    .byt $0a, $16, $0d, $26, $0a, $17, $10, $28             // 2a68: ...&...(
    .byt $0a, $1d, $11, $29, $0a, $16, $01, $2a             // 2a70: ...)...*
    .byt $0b, $0e, $02, $2b, $0c, $10, $04, $2c             // 2a78: ...+...,
    .byt $0f, $06, $1d, $2d, $0f, $1e, $1f, $47             // 2a80: ...-...G
    .byt $00, $01, $03, $65, $00, $03, $03, $66             // 2a88: ...e...f
    .byt $00, $05, $03, $67, $00, $07, $03, $68             // 2a90: ...g...h
    .byt $00, $09, $03, $69, $00, $0b, $03, $6a             // 2a98: ...i...j
// For each tile (indexed by the 'obj_*' constants) there are 16 subtiles arranged in a 4x4 grid.  Each gets one index here, which indexes into data_tilegraphics_tiles.
data_tilegraphics_indices:
data_tile00_empty:
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2aa0: kkkkkkkk
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2aa8: kkkkkkkk
data_tile01_empty:
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2ab0: kkkkkkkk
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2ab8: kkkkkkkk
data_tile02_empty:
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2ac0: kkkkkkkk
    .byt $6b, $6b, $6b, $6b, $6b, $6b, $6b, $6b             // 2ac8: kkkkkkkk
data_tile03_earth:
    .byt $00, $78, $79, $81, $7b, $7e, $7f, $7b             // 2ad0: .xy.{~.{
    .byt $7a, $7c, $7d, $7a, $02, $78, $79, $83             // 2ad8: z|}z.xy.
data_tile04_earth:
    .byt $83, $78, $79, $80, $7b, $80, $7c, $7b             // 2ae0: .xy.{.|{
    .byt $7a, $7f, $81, $7a, $82, $78, $79, $81             // 2ae8: z..z.xy.
data_tile05_earth:
    .byt $82, $78, $79, $83, $7b, $7d, $83, $7b             // 2af0: .xy.{}.{
    .byt $7a, $82, $7e, $7a, $81, $78, $79, $80             // 2af8: z.~z.xy.
data_tile06_diamond:
    .byt $6b, $16, $17, $6b, $16, $18, $19, $17             // 2b00: k..k....
    .byt $1a, $19, $18, $1b, $6b, $1a, $1b, $6b             // 2b08: ....k..k
data_tile07_key:
    .byt $60, $61, $60, $61, $62, $5f, $5f, $63             // 2b10: `a`ab__c
    .byt $60, $5f, $5f, $61, $62, $63, $62, $63             // 2b18: `__abcbc
data_tile08_skull:
    .byt $20, $21, $22, $23, $48, $49, $4a, $4b             // 2b20:  !"#HIJK
    .byt $70, $71, $72, $73, $98, $99, $9a, $9b             // 2b28: pqrs....
data_tile09_spirit:
    .byt $b1, $b2, $b2, $b5, $b3, $60, $61, $b1             // 2b30: .....`a.
    .byt $b3, $62, $63, $b2, $b2, $b1, $b1, $b4             // 2b38: .bc.....
data_tile0a_statustrigger:
    .byt $6b, $60, $61, $6b, $60, $b0, $b0, $61             // 2b40: k`ak`..a
    .byt $62, $b0, $b0, $63, $6b, $62, $63, $6b             // 2b48: b..ckbck
data_tile0b_transporter:
    .byt $08, $09, $09, $0a, $0b, $08, $0a, $0c             // 2b50: ........
    .byt $0b, $0d, $0f, $0c, $0d, $0e, $0e, $0f             // 2b58: ........
data_tile0c_cage:
    .byt $64, $64, $64, $65, $66, $66, $66, $69             // 2b60: dddefffi
    .byt $66, $66, $66, $66, $67, $67, $67, $68             // 2b68: ffffgggh
data_tile0d_safe:
    .byt $11, $11, $11, $11, $13, $15, $15, $11             // 2b70: ........
    .byt $12, $15, $14, $10, $10, $10, $10, $10             // 2b78: ........
data_tile0e_rock:
    .byt $1c, $1d, $1e, $1f, $44, $45, $46, $47             // 2b80: ....DEFG
    .byt $6c, $6d, $6e, $6f, $94, $95, $96, $97             // 2b88: lmno....
data_tile0f_egg:
    .byt $54, $55, $56, $57, $5c, $5d, $5d, $5e             // 2b90: TUVW\]]^
    .byt $5d, $5d, $5d, $5d, $58, $59, $5a, $5b             // 2b98: ]]]]XYZ[
data_tile10_wall:
    .byt $30, $30, $31, $39, $3c, $3d, $3e, $37             // 2ba0: 0019<=>7
    .byt $3f, $3c, $3f, $37, $3e, $3d, $3c, $36             // 2ba8: ?<?7>=<6
data_tile11_wall:
    .byt $38, $31, $31, $30, $32, $3c, $3d, $3f             // 2bb0: 81102<=?
    .byt $33, $3e, $3c, $3d, $32, $3c, $3e, $3f             // 2bb8: 3><=2<>?
data_tile12_wall:
    .byt $33, $3c, $3c, $3d, $33, $3e, $3f, $3e             // 2bc0: 3<<=3>?>
    .byt $32, $3f, $3c, $3f, $3a, $34, $35, $34             // 2bc8: 2?<?:454
data_tile13_wall:
    .byt $3f, $3e, $3c, $36, $3d, $3c, $3f, $37             // 2bd0: ?><6=<?7
    .byt $3f, $3e, $3c, $36, $34, $35, $35, $3b             // 2bd8: ?><6455;
data_tile14_wall:
    .byt $33, $3c, $3c, $3d, $32, $3f, $3e, $3c             // 2be0: 3<<=2?><
    .byt $33, $3d, $3f, $3e, $33, $3e, $3e, $3c             // 2be8: 3=?>3>><
data_tile15_wall:
    .byt $3c, $3d, $3f, $36, $3e, $3f, $3d, $37             // 2bf0: <=?6>?=7
    .byt $3c, $3e, $3c, $37, $3f, $3e, $3e, $36             // 2bf8: <><7?>>6
data_tile16_wall:
    .byt $30, $30, $30, $31, $3c, $3e, $3c, $3f             // 2c00: 0001<><?
    .byt $3d, $3f, $3e, $3e, $3e, $3c, $3d, $3f             // 2c08: =?>>><=?
data_tile17_wall:
    .byt $3d, $3f, $3f, $3e, $3e, $3d, $3f, $3d             // 2c10: =??>>=?=
    .byt $3c, $3f, $3e, $3c, $34, $34, $35, $34             // 2c18: <?><4454
data_tile18_wall:
    .byt $3c, $3d, $3e, $3f, $3e, $3d, $3c, $3d             // 2c20: <=>?>=<=
    .byt $3f, $3e, $3f, $3c, $3e, $3c, $3d, $3f             // 2c28: ?>?<><=?
data_tile19_wall:
    .byt $40, $41, $40, $41, $42, $43, $42, $43             // 2c30: @A@ABCBC
    .byt $40, $41, $40, $41, $42, $43, $42, $43             // 2c38: @A@ABCBC
data_tile1a_wall:
    .byt $84, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c40: .jjjjjjj
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c48: jjjjjjjj
data_tile1b_wall:
    .byt $6a, $6a, $6a, $85, $6a, $6a, $6a, $6a             // 2c50: jjj.jjjj
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c58: jjjjjjjj
data_tile1c_wall:
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c60: jjjjjjjj
    .byt $6a, $6a, $6a, $6a, $86, $6a, $6a, $6a             // 2c68: jjjj.jjj
data_tile1d_wall:
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c70: jjjjjjjj
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $87             // 2c78: jjjjjjj.
data_tile1e_wall:
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c80: jjjjjjjj
    .byt $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a             // 2c88: jjjjjjjj
data_tile1f_wall:
    .byt $50, $51, $50, $51, $52, $53, $53, $52             // 2c90: PQPQRSSR
    .byt $3c, $3d, $3d, $3f, $3e, $3f, $3e, $3c             // 2c98: <==?>?><
data_tile20_puzzlepiece:
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2ca0: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2ca8: ........
data_tile21_puzzlepiece:
    .byt $ae, $a9, $af, $af, $ae, $ae, $a5, $af             // 2cb0: ........
    .byt $a1, $ae, $ae, $af, $af, $ae, $ae, $af             // 2cb8: ........
data_tile22_puzzlepiece:
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2cc0: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2cc8: ........
data_tile23_puzzlepiece:
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $af             // 2cd0: ........
    .byt $af, $af, $af, $af, $af, $af, $af, $af             // 2cd8: ........
data_tile24_puzzlepiece:
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2ce0: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2ce8: ........
data_tile25_puzzlepiece:
    .byt $ae, $a9, $af, $af, $ae, $ae, $a5, $af             // 2cf0: ........
    .byt $a1, $ae, $ae, $af, $af, $ae, $ae, $af             // 2cf8: ........
data_tile26_puzzlepiece:
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2d00: ........
    .byt $af, $af, $a8, $ae, $af, $af, $a8, $ae             // 2d08: ........
data_tile27_puzzlepiece:
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $af             // 2d10: ........
    .byt $a5, $af, $af, $af, $a5, $af, $af, $af             // 2d18: ........
data_tile28_puzzlepiece:
    .byt $af, $a3, $ad, $ae, $a3, $ae, $ae, $ae             // 2d20: ........
    .byt $ad, $ae, $aa, $af, $ae, $ae, $a0, $af             // 2d28: ........
data_tile29_puzzlepiece:
    .byt $ac, $a2, $af, $af, $ae, $ae, $a2, $af             // 2d30: ........
    .byt $ab, $ae, $ac, $af, $a1, $ae, $ae, $af             // 2d38: ........
data_tile2a_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $a5, $af             // 2d40: ........
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $a5             // 2d48: ........
data_tile2b_puzzlepiece:
    .byt $af, $ae, $ae, $af, $af, $ae, $ae, $af             // 2d50: ........
    .byt $af, $ae, $ae, $af, $af, $ae, $ae, $af             // 2d58: ........
data_tile2c_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $ae, $ae             // 2d60: ........
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $a4, $ae             // 2d68: ........
data_tile2d_puzzlepiece:
    .byt $a3, $ae, $ae, $af, $ae, $ae, $a5, $af             // 2d70: ........
    .byt $ae, $a4, $af, $af, $ae, $ac, $af, $af             // 2d78: ........
data_tile2e_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $ae, $ae             // 2d80: ........
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $af, $af             // 2d88: ........
data_tile2f_puzzlepiece:
    .byt $af, $af, $af, $af, $ae, $af, $af, $af             // 2d90: ........
    .byt $ae, $af, $af, $af, $af, $af, $af, $af             // 2d98: ........
data_tile30_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $ae, $ae             // 2da0: ........
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $af, $af             // 2da8: ........
data_tile31_puzzlepiece:
    .byt $a3, $ae, $ae, $af, $ae, $ae, $a5, $af             // 2db0: ........
    .byt $ae, $a4, $af, $af, $af, $af, $af, $af             // 2db8: ........
data_tile32_puzzlepiece:
    .byt $af, $af, $a8, $ae, $af, $af, $a8, $ae             // 2dc0: ........
    .byt $af, $af, $a8, $ae, $af, $af, $a8, $ae             // 2dc8: ........
data_tile33_puzzlepiece:
    .byt $a5, $af, $af, $af, $a5, $af, $af, $af             // 2dd0: ........
    .byt $a5, $af, $af, $af, $a5, $af, $af, $af             // 2dd8: ........
data_tile34_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2de0: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2de8: ........
data_tile35_puzzlepiece:
    .byt $af, $ae, $ae, $af, $af, $ae, $ae, $af             // 2df0: ........
    .byt $af, $ae, $ae, $af, $af, $ae, $ae, $af             // 2df8: ........
data_tile36_puzzlepiece:
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2e00: ........
    .byt $ae, $ae, $a8, $ae, $ae, $ae, $af, $ae             // 2e08: ........
data_tile37_puzzlepiece:
    .byt $af, $ae, $ae, $af, $a5, $ae, $ae, $af             // 2e10: ........
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $af             // 2e18: ........
data_tile38_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2e20: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2e28: ........
data_tile39_puzzlepiece:
    .byt $ab, $ae, $a5, $af, $a1, $ae, $ae, $af             // 2e30: ........
    .byt $af, $ae, $ae, $af, $af, $ae, $ae, $af             // 2e38: ........
data_tile3a_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2e40: ........
    .byt $ae, $ae, $ae, $ae, $ae, $ae, $ae, $ae             // 2e48: ........
data_tile3b_puzzlepiece:
    .byt $af, $af, $af, $af, $af, $af, $af, $af             // 2e50: ........
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $af             // 2e58: ........
data_tile3c_puzzlepiece:
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2e60: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2e68: ........
data_tile3d_puzzlepiece:
    .byt $af, $af, $a8, $ae, $af, $af, $a8, $ae             // 2e70: ........
    .byt $af, $af, $a8, $ae, $af, $af, $a8, $ae             // 2e78: ........
data_tile3e_puzzlepiece:
    .byt $a5, $af, $af, $af, $a5, $af, $af, $af             // 2e80: ........
    .byt $a5, $af, $af, $af, $a5, $af, $af, $af             // 2e88: ........
data_tile3f_puzzlepiece:
    .byt $ae, $ae, $a2, $af, $ab, $ae, $ac, $af             // 2e90: ........
    .byt $a1, $ae, $ae, $ae, $af, $a1, $ab, $ae             // 2e98: ........
data_tile40_puzzlepiece:
    .byt $a3, $ae, $ae, $af, $ad, $ae, $aa, $af             // 2ea0: ........
    .byt $ae, $ae, $a0, $af, $aa, $a0, $af, $af             // 2ea8: ........
data_tile41_puzzlepiece:
    .byt $ae, $ae, $af, $a8, $ae, $ae, $af, $af             // 2eb0: ........
    .byt $ae, $ae, $af, $af, $ae, $ae, $af, $af             // 2eb8: ........
data_tile42_puzzlepiece:
    .byt $ae, $ae, $ae, $af, $ae, $ae, $ae, $af             // 2ec0: ........
    .byt $a8, $ae, $ae, $af, $af, $ae, $ae, $af             // 2ec8: ........
data_tile43_puzzlepiece:
    .byt $a3, $a4, $a4, $a2, $af, $af, $a9, $a0             // 2ed0: ........
    .byt $a3, $a4, $af, $af, $a8, $a9, $a9, $a2             // 2ed8: ........
data_tile44_puzzlepiece:
    .byt $af, $a4, $aa, $a0, $af, $af, $a5, $af             // 2ee0: ........
    .byt $af, $af, $a5, $af, $af, $a4, $a4, $a0             // 2ee8: ........
data_tile45_puzzlepiece:
    .byt $a7, $a4, $a2, $af, $a6, $a9, $af, $af             // 2ef0: ........
    .byt $a2, $af, $a5, $af, $a1, $a4, $af, $af             // 2ef8: ........
data_tile46_puzzlepiece:
    .byt $af, $a8, $a4, $a4, $af, $a8, $a9, $af             // 2f00: ........
    .byt $af, $a8, $af, $af, $af, $a1, $a4, $a4             // 2f08: ........
data_tile47_puzzlepiece:
    .byt $a8, $af, $a8, $a8, $a8, $a6, $a8, $a8             // 2f10: ........
    .byt $a8, $af, $ab, $a8, $a1, $af, $a1, $a1             // 2f18: ........
data_tile48_puzzlepiece:
    .byt $a4, $a6, $a8, $a4, $af, $a8, $a8, $a9             // 2f20: ........
    .byt $af, $a8, $a8, $af, $a4, $a0, $a1, $a4             // 2f28: ........
data_tile49_puzzlepiece:
    .byt $a4, $a8, $a4, $a6, $af, $a8, $af, $a8             // 2f30: ........
    .byt $af, $a8, $af, $a8, $a4, $a1, $a4, $a0             // 2f38: ........
// This is the actual image data for the subtiles.  8 bytes per 4x8 subtile, in the usual BBC Micro 4-colour format.  I've labelled some of them, e.g. bits of sprites, but not all of them.
data_tilegraphics_tiles:
data_sprite0a_row0:
    .byt $00, $00, $02, $02, $0d, $07, $01, $0f             // 2f40: ........
    .byt $08, $0a, $0a, $0d, $0e, $0d, $0e, $08             // 2f48: ........
data_sprite0b_row0:
    .byt $00, $00, $00, $02, $01, $07, $01, $0f             // 2f50: ........
    .byt $00, $08, $0a, $04, $0a, $0c, $0b, $0c             // 2f58: ........
data_sprite0c_row0:
    .byt $00, $00, $00, $00, $01, $02, $01, $07             // 2f60: ........
    .byt $00, $00, $0a, $04, $08, $0e, $08, $0c             // 2f68: ........
data_sprite0d_row0:
    .byt $00, $00, $00, $00, $00, $02, $04, $05             // 2f70: ........
    .byt $00, $00, $00, $04, $08, $04, $08, $0c             // 2f78: ........
    .byt $f0, $f0, $f7, $f7, $c7, $c7, $c6, $c6             // 2f80: ........
    .byt $f0, $f0, $ff, $ff, $0f, $0f, $00, $00             // 2f88: ........
    .byt $f0, $f0, $fe, $fe, $3e, $3e, $36, $36             // 2f90: ....>>66
    .byt $c6, $c6, $c6, $c6, $c6, $c6, $c6, $c6             // 2f98: ........
    .byt $36, $36, $36, $36, $36, $36, $36, $36             // 2fa0: 66666666
    .byt $c6, $c6, $c7, $c7, $f7, $f7, $f0, $f0             // 2fa8: ........
    .byt $00, $00, $0f, $0f, $ff, $ff, $f0, $f0             // 2fb0: ........
    .byt $36, $36, $3e, $3e, $fe, $fe, $f0, $f0             // 2fb8: 66>>....
    .byt $af, $5f, $af, $5f, $af, $5d, $8d, $5f             // 2fc0: ._._.]._
    .byt $af, $5d, $8d, $5f, $af, $5f, $af, $5f             // 2fc8: .]._._._
    .byt $af, $5f, $af, $f1, $10, $10, $10, $f1             // 2fd0: ._......
    .byt $e1, $10, $10, $10, $e1, $5f, $af, $5f             // 2fd8: ....._._
    .byt $ab, $11, $40, $60, $60, $20, $88, $5d             // 2fe0: ..@`` .]
    .byt $af, $5f, $af, $5f, $af, $5f, $af, $5f             // 2fe8: ._._._._
    .byt $10, $10, $20, $20, $50, $50, $a0, $a0             // 2ff0: ..  PP..
    .byt $00, $00, $80, $80, $40, $40, $a0, $a0             // 2ff8: ....@@..
    .byt $50, $50, $a0, $a0, $10, $10, $a0, $a0             // 3000: PP......
    .byt $50, $50, $80, $80, $50, $50, $a0, $a0             // 3008: PP..PP..
    .byt $50, $50, $20, $20, $10, $10, $00, $00             // 3010: PP  ....
    .byt $40, $40, $80, $80, $00, $00, $00, $00             // 3018: @@......
    .byt $00, $00, $01, $13, $03, $37, $07, $05             // 3020: .....7..
    .byt $02, $0d, $4e, $2b, $0e, $7f, $0a, $06             // 3028: ..N+....
    .byt $4c, $07, $2a, $17, $08, $00, $2a, $0d             // 3030: L.*...*.
    .byt $00, $00, $08, $44, $0c, $0a, $02, $46             // 3038: ...D...F
    .byt $00, $10, $30, $30, $70, $70, $70, $70             // 3040: ..00pppp
    .byt $60, $f0, $f0, $f0, $f0, $f0, $f0, $f0             // 3048: `.......
    .byt $c0, $f0, $f0, $f0, $f0, $f0, $f0, $f0             // 3050: ........
    .byt $00, $00, $80, $80, $c0, $c0, $c0, $c0             // 3058: ........
data_sprite09_row0:
    .byt $00, $00, $00, $00, $10, $10, $10, $30             // 3060: .......0
    .byt $10, $50, $e0, $70, $b0, $d0, $e0, $d0             // 3068: .P.p....
    .byt $80, $e0, $f0, $70, $b0, $50, $e0, $d0             // 3070: ...p.P..
    .byt $00, $00, $00, $00, $80, $00, $80, $c0             // 3078: ........
data_sprite0a_row1:
    .byt $01, $07, $0b, $07, $0b, $05, $05, $01             // 3080: ........
    .byt $0f, $08, $0e, $0b, $04, $04, $00, $00             // 3088: ........
data_sprite0b_row1:
    .byt $03, $0d, $03, $05, $02, $05, $01, $00             // 3090: ........
    .byt $0f, $08, $0e, $08, $04, $00, $00, $00             // 3098: ........
data_sprite0c_row1:
    .byt $03, $01, $07, $01, $02, $05, $00, $00             // 30a0: ........
    .byt $0e, $08, $04, $08, $00, $00, $00, $00             // 30a8: ........
data_sprite0d_row1:
    .byt $03, $01, $02, $01, $02, $00, $00, $00             // 30b0: ........
    .byt $0a, $02, $04, $00, $00, $00, $00, $00             // 30b8: ........
    .byt $a0, $b4, $c1, $3c, $40, $07, $07, $07             // 30c0: ...<@...
    .byt $d0, $e1, $3c, $49, $00, $07, $07, $07             // 30c8: ..<I....
    .byt $e0, $d0, $61, $c1, $40, $21, $52, $c3             // 30d0: ..a.@!R.
    .byt $40, $e1, $50, $e1, $20, $61, $52, $c3             // 30d8: @.P. aR.
    .byt $00, $0d, $a5, $58, $60, $34, $d0, $80             // 30e0: ...X`4..
    .byt $00, $0d, $0d, $2d, $40, $43, $25, $d0             // 30e8: ...-@C%.
    .byt $70, $58, $a4, $3c, $50, $e0, $24, $52             // 30f0: pX.<P.$R
    .byt $50, $2c, $a4, $78, $10, $16, $60, $34             // 30f8: P,.x..`4
    .byt $10, $30, $50, $61, $c0, $87, $a5, $87             // 3100: .0Pa....
    .byt $80, $c0, $2c, $a4, $70, $96, $52, $16             // 3108: ..,.p.R.
    .byt $90, $a5, $c1, $a5, $60, $52, $30, $10             // 3110: ....`R0.
    .byt $50, $58, $94, $b4, $20, $60, $c0, $80             // 3118: PX.. `..
    .byt $00, $09, $0d, $0d, $00, $07, $07, $07             // 3120: ........
    .byt $00, $09, $05, $0d, $00, $07, $07, $07             // 3128: ........
    .byt $00, $05, $0d, $0c, $00, $07, $07, $03             // 3130: ........
    .byt $00, $0d, $0d, $0d, $00, $03, $07, $07             // 3138: ........
    .byt $70, $f0, $87, $84, $84, $84, $84, $84             // 3140: p.......
    .byt $80, $c0, $48, $68, $2c, $24, $24, $24             // 3148: ..Hh,$$$
    .byt $84, $84, $86, $c2, $43, $70, $30, $00             // 3150: ....Cp0.
    .byt $24, $24, $24, $24, $2c, $e0, $c0, $00             // 3158: $$$$,...
    .byt $05, $2e, $0f, $6f, $9f, $6e, $df, $6f             // 3160: ...o.n.o
    .byt $2a, $4f, $3f, $0b, $2f, $1b, $0f, $ef             // 3168: *O?./...
    .byt $6e, $33, $4d, $0a, $cc, $2f, $8a, $6f             // 3170: n3M../.o
    .byt $02, $cc, $77, $09, $45, $44, $5d, $11             // 3178: ..w.ED].
    .byt $f0, $f0, $f0, $f0, $c0, $b0, $a0, $e0             // 3180: ........
    .byt $f0, $f0, $f0, $30, $a0, $50, $24, $94             // 3188: ...0.P$.
    .byt $f0, $f0, $f0, $90, $a0, $50, $84, $24             // 3190: .....P.$
    .byt $e0, $e0, $e0, $e0, $60, $a0, $a0, $e0             // 3198: ....`...
data_sprite09_row1:
    .byt $30, $30, $70, $70, $20, $50, $60, $f0             // 31a0: 00pp P`.
    .byt $b0, $d0, $b0, $70, $f0, $f0, $f0, $70             // 31a8: ...p...p
    .byt $b0, $d0, $e0, $d0, $b0, $d0, $b0, $70             // 31b0: .......p
    .byt $c0, $c0, $e0, $e0, $e0, $e0, $e0, $d0             // 31b8: ........
    .byt $50, $f0, $f0, $a5, $96, $a5, $52, $16             // 31c0: P.....R.
    .byt $b0, $f0, $f0, $d2, $69, $2d, $5a, $16             // 31c8: ....i-Z.
    .byt $a0, $0d, $49, $0d, $00, $07, $07, $07             // 31d0: ..I.....
    .byt $a0, $58, $b4, $0d, $00, $07, $07, $07             // 31d8: .X......
    .byt $00, $00, $00, $00, $10, $10, $10, $30             // 31e0: .......0
    .byt $10, $70, $f0, $f0, $f0, $f0, $f0, $f0             // 31e8: .p......
    .byt $80, $e0, $f0, $f0, $f0, $f0, $f0, $f0             // 31f0: ........
    .byt $00, $00, $00, $00, $80, $80, $80, $c0             // 31f8: ........
    .byt $70, $70, $70, $70, $30, $30, $10, $00             // 3200: pppp00..
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $f0, $70             // 3208: .......p
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $f0, $e0             // 3210: ........
    .byt $e0, $e0, $e0, $e0, $c0, $c0, $80, $00             // 3218: ........
    .byt $30, $30, $70, $70, $70, $70, $70, $f0             // 3220: 00ppppp.
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f0             // 3228: ........
    .byt $c0, $c0, $e0, $e0, $e0, $e0, $f0, $f0             // 3230: ........
    .byt $18, $18, $24, $24, $42, $42, $81, $c5             // 3238: ..$$BB..
    .byt $00, $00, $01, $01, $12, $12, $34, $34             // 3240: ......44
    .byt $08, $08, $84, $84, $c2, $c2, $e1, $e1             // 3248: ........
    .byt $78, $78, $34, $34, $12, $12, $01, $01             // 3250: xx44....
    .byt $c2, $c2, $84, $84, $08, $08, $00, $00             // 3258: ........
    .byt $f0, $f0, $f0, $f0, $a0, $a0, $a0, $a0             // 3260: ........
    .byt $e0, $e0, $e0, $e0, $a0, $a0, $a0, $a0             // 3268: ........
    .byt $a0, $a0, $a0, $a0, $a0, $a0, $a0, $a0             // 3270: ........
    .byt $a0, $a0, $a0, $a0, $f0, $f0, $f0, $f0             // 3278: ........
    .byt $a0, $a0, $a0, $a0, $e0, $e0, $e0, $e0             // 3280: ........
    .byt $a0, $83, $87, $0f, $0f, $2c, $28, $a0             // 3288: .....,(.
    .byt $0f, $0f, $1e, $0f, $0f, $0f, $4b, $0f             // 3290: ......K.
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3298: ........
    .byt $5b, $4d, $2d, $9e, $4b, $1e, $2d, $16             // 32a0: [M-.K.-.
    .byt $02, $cd, $8b, $1d, $ab, $1f, $8e, $8f             // 32a8: ........
    .byt $06, $2f, $8e, $9f, $05, $1b, $2f, $9f             // 32b0: ./..../.
    .byt $3b, $4f, $15, $19, $07, $2f, $4f, $66             // 32b8: ;O.../Of
    .byt $70, $70, $f0, $d0, $50, $60, $60, $20             // 32c0: pp..P`` 
    .byt $50, $b0, $f0, $d0, $d0, $d0, $f0, $d0             // 32c8: P.......
    .byt $50, $b0, $f0, $70, $70, $60, $e0, $60             // 32d0: P..pp`.`
    .byt $c0, $c0, $e0, $60, $40, $c0, $c0, $80             // 32d8: ...`@...
data_sprite09_row2:
    .byt $f0, $f0, $f0, $f0, $e0, $d0, $b0, $70             // 32e0: .......p
    .byt $a0, $d0, $b0, $70, $f0, $70, $b0, $70             // 32e8: ...p.p.p
    .byt $b0, $d0, $a0, $70, $b0, $d0, $b0, $70             // 32f0: ...p...p
    .byt $b0, $70, $f0, $70, $b0, $d0, $e0, $d0             // 32f8: .p.p....
    .byt $08, $04, $04, $08, $00, $04, $00, $08             // 3300: ........
    .byt $00, $02, $03, $00, $02, $01, $02, $00             // 3308: ........
    .byt $00, $00, $00, $0a, $05, $0e, $03, $09             // 3310: ........
    .byt $09, $06, $0a, $0d, $02, $00, $00, $00             // 3318: ........
    .byt $00, $00, $00, $08, $00, $04, $00, $08             // 3320: ........
    .byt $00, $00, $00, $00, $03, $01, $02, $01             // 3328: ........
    .byt $00, $04, $00, $08, $04, $00, $00, $00             // 3330: ........
    .byt $01, $02, $02, $01, $02, $00, $00, $00             // 3338: ........
    .byt $0c, $05, $04, $0a, $01, $06, $0c, $0a             // 3340: ........
    .byt $09, $06, $08, $0a, $07, $01, $0a, $09             // 3348: ........
    .byt $04, $0a, $02, $09, $06, $02, $09, $02             // 3350: ........
    .byt $09, $0a, $0a, $01, $0b, $04, $04, $09             // 3358: ........
    .byt $00, $01, $12, $03, $07, $07, $43, $07             // 3360: ......C.
    .byt $00, $08, $0c, $0c, $0e, $0e, $4a, $0e             // 3368: ......J.
    .byt $07, $07, $16, $07, $03, $03, $01, $00             // 3370: ........
    .byt $0e, $0e, $0e, $0e, $0c, $0c, $08, $00             // 3378: ........
// Some code is embedded in the middle of data_tilegarphics_tiles
data_additional_palette_levels_0_1:
    .byt $14, $11                                           // 3380: ..
// Referenced 2 times by $1cf1, $2412
additional_palette_setup:
    sta l0bfc                                               // 3382: 8d fc 0b
    ldx zp_current_level                                    // 3385: a6 8b
    cpx #$02                                                // 3387: e0 02
    bcs additional_palette_setup_vdu19                      // 3389: b0 03
    lda data_additional_palette_levels_0_1,x                // 338b: bd 80 33
// Referenced 1 time by $3389
additional_palette_setup_vdu19:
    jmp vdu19                                               // 338e: 4c 9f 0f
// Referenced 1 time by $17ee
erase_current_monster:
    ldx zp_rock_type__puzzlepiece_offset                    // 3391: a6 6f
    nop                                                     // 3393: ea
    nop                                                     // 3394: ea
    nop                                                     // 3395: ea
    jmp erase_monster                                       // 3396: 4c 93 18
// Referenced 1 time by $1606
found_transporter_in_table:
    cmp zp_current_level                                    // 3399: c5 8b
    beq transporter_same_level                              // 339b: f0 06
    sta zp_current_level                                    // 339d: 85 8b
    iny                                                     // 339f: c8
    jmp take_transporter                                    // 33a0: 4c 09 16
// Referenced 1 time by $339b
transporter_same_level:
    iny                                                     // 33a3: c8
    lda (zp_rock_curvedness__transporters_ptr),y            // 33a4: b1 6e
    sta l0088                                               // 33a6: 85 88
    iny                                                     // 33a8: c8
    lda (zp_rock_curvedness__transporters_ptr),y            // 33a9: b1 6e
    sta l0089                                               // 33ab: 85 89
    ldy #$00                                                // 33ad: a0 00
    lda (zp_rock_curvedness__transporters_ptr),y            // 33af: b1 6e
    ora #$80                                                // 33b1: 09 80
    sta (zp_rock_curvedness__transporters_ptr),y            // 33b3: 91 6e
    jmp after_transporter                                   // 33b5: 4c 00 24
// Referenced 1 time by $17f1
move_monster2:
    jmp move_monster                                        // 33b8: 4c a5 18
// I think this is unused junk, it looks like a little bit of code and some string data, but it's not used as far as I can tell.
    .byt $4c, $32, $18, $ea, $ea, $ea, $ea, $ea             // 33bb: L2......
    .byt $ea, $ea, $60, $ea, $01, $8a, $ce                  // 33c3: ..`....
    .byt "Puzzle"                                           // 33ca: 50 75 7a ...
    .byt $02, $0d, $ea, $ea, $ea, $ea, $ea, $ea             // 33d0: ........
// More data_tilegraphics_tiles data
    .byt $c0, $c0, $00, $80, $80, $80, $80, $80             // 33d8: ........
    .byt $67, $25, $23, $12, $33, $01, $00, $00             // 33e0: g%#.3...
    .byt $4b, $4b, $a5, $0b, $5b, $1c, $0f, $03             // 33e8: KK..[...
    .byt $5f, $af, $1b, $45, $0f, $27, $4f, $0c             // 33f0: _..E.'O.
    .byt $0e, $06, $4e, $0c, $8c, $08, $00, $00             // 33f8: ..N.....
// The font characters kind of also function as tilegraphics tiles, or at least are embedded in that data block.  8 bytes each as usual - and this is just a zero-reference point, the actual characters don't really start until 3500 (space)
data_font:
    .byt $30, $30, $30, $10, $10, $00, $00, $00             // 3400: 000.....
    .byt $20, $00, $a0, $d0, $f0, $f0, $f0, $60             // 3408:  ......`
    .byt $90, $30, $b0, $70, $f0, $e0, $e0, $c0             // 3410: .0.p....
    .byt $80, $80, $80, $00, $00, $00, $00, $00             // 3418: ........
data_sprite09_row3:
    .byt $70, $70, $70, $70, $30, $30, $10, $00             // 3420: pppp00..
    .byt $a0, $d0, $e0, $f0, $e0, $d0, $b0, $70             // 3428: .......p
    .byt $f0, $d0, $a0, $70, $f0, $70, $b0, $c0             // 3430: ...p.p..
    .byt $a0, $60, $e0, $e0, $c0, $c0, $80, $00             // 3438: .`......
    .byt $c4, $c8, $c4, $c8, $00, $00, $00, $00             // 3440: ........
    .byt $31, $32, $31, $32, $00, $00, $00, $00             // 3448: 1212....
    .byt $00, $00, $00, $00, $c4, $c8, $c4, $c8             // 3450: ........
    .byt $00, $00, $00, $00, $31, $32, $31, $32             // 3458: ....1212
    .byt $f5, $fa, $f5, $fa, $00, $00, $00, $00             // 3460: ........
    .byt $c4, $c8, $c4, $c8, $c4, $c8, $c4, $c8             // 3468: ........
    .byt $c4, $c8, $c4, $c8, $31, $32, $31, $32             // 3470: ....1212
    .byt $31, $32, $31, $32, $c4, $c8, $c4, $c8             // 3478: 1212....
    .byt $31, $32, $31, $32, $31, $32, $31, $32             // 3480: 12121212
    .byt $00, $00, $00, $00, $f5, $fa, $f5, $fa             // 3488: ........
    .byt $f5, $fa, $f5, $fa, $c4, $c8, $c4, $c8             // 3490: ........
    .byt $f5, $fa, $f5, $fa, $31, $32, $31, $32             // 3498: ....1212
    .byt $c4, $c8, $c4, $c8, $f5, $fa, $f5, $fa             // 34a0: ........
    .byt $31, $32, $31, $32, $f5, $fa, $f5, $fa             // 34a8: 1212....
    .byt $f5, $fa, $f5, $fa, $f5, $fa, $f5, $fa             // 34b0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 34b8: ........
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f0             // 34c0: ........
    .byt $10, $10, $30, $30, $f0, $f0, $f0, $f0             // 34c8: ..00....
    .byt $f0, $f0, $f0, $f0, $30, $30, $10, $10             // 34d0: ....00..
    .byt $e0, $e0, $c0, $c0, $c0, $c0, $e0, $e0             // 34d8: ........
    .byt $e0, $e0, $c0, $c0, $00, $00, $00, $00             // 34e0: ........
    .byt $00, $00, $00, $00, $c0, $c0, $e0, $e0             // 34e8: ........
    .byt $10, $10, $30, $30, $30, $30, $10, $10             // 34f0: ..0000..
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 34f8: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3500: ........
    .byt $44, $44, $44, $44, $00, $44, $44, $00             // 3508: DDDD.DD.
    .byt $aa, $aa, $00, $00, $00, $00, $00, $00             // 3510: ........
    .byt $aa, $aa, $44, $aa, $44, $aa, $aa, $00             // 3518: ..D.D...
    .byt $44, $ee, $cc, $44, $66, $ee, $44, $00             // 3520: D..Df.D.
    .byt $aa, $aa, $22, $44, $88, $aa, $aa, $00             // 3528: .."D....
    .byt $44, $aa, $aa, $44, $aa, $cc, $aa, $00             // 3530: D..D....
    .byt $22, $22, $44, $00, $00, $00, $00, $00             // 3538: ""D.....
    .byt $22, $44, $44, $44, $44, $44, $22, $00             // 3540: "DDDDD".
    .byt $44, $22, $22, $22, $22, $22, $44, $00             // 3548: D"""""D.
    .byt $00, $aa, $44, $ee, $44, $aa, $00, $00             // 3550: ..D.D...
    .byt $00, $44, $44, $ee, $44, $44, $00, $00             // 3558: .DD.DD..
    .byt $00, $00, $00, $00, $00, $44, $44, $88             // 3560: .....DD.
    .byt $00, $00, $00, $ee, $00, $00, $00, $00             // 3568: ........
    .byt $00, $00, $00, $00, $00, $44, $44, $00             // 3570: .....DD.
    .byt $00, $22, $22, $44, $88, $88, $00, $00             // 3578: .""D....
    .byt $ee, $aa, $aa, $aa, $aa, $aa, $ee, $00             // 3580: ........
    .byt $44, $cc, $44, $44, $44, $44, $ee, $00             // 3588: D.DDDD..
    .byt $ee, $22, $22, $ee, $88, $88, $ee, $00             // 3590: ."".....
    .byt $ee, $22, $22, $66, $22, $22, $ee, $00             // 3598: .""f""..
    .byt $aa, $aa, $aa, $ee, $22, $22, $22, $00             // 35a0: ....""".
    .byt $ee, $88, $88, $ee, $22, $22, $ee, $00             // 35a8: ....""..
    .byt $ee, $88, $88, $ee, $aa, $aa, $ee, $00             // 35b0: ........
    .byt $ee, $22, $22, $22, $22, $22, $22, $00             // 35b8: ."""""".
    .byt $ee, $aa, $aa, $ee, $aa, $aa, $ee, $00             // 35c0: ........
    .byt $ee, $aa, $aa, $ee, $22, $22, $22, $00             // 35c8: ....""".
    .byt $00, $00, $44, $44, $00, $44, $44, $00             // 35d0: ..DD.DD.
    .byt $00, $00, $44, $44, $00, $44, $44, $88             // 35d8: ..DD.DD.
    .byt $00, $22, $44, $88, $44, $22, $00, $00             // 35e0: ."D.D"..
    .byt $00, $00, $ee, $00, $ee, $00, $00, $00             // 35e8: ........
    .byt $00, $88, $44, $22, $44, $88, $00, $00             // 35f0: ..D"D...
    .byt $ee, $aa, $22, $44, $00, $44, $44, $00             // 35f8: .."D.DD.
    .byt $44, $aa, $aa, $ee, $cc, $88, $66, $00             // 3600: D.....f.
    .byt $44, $aa, $aa, $ee, $aa, $aa, $aa, $00             // 3608: D.......
    .byt $cc, $aa, $aa, $cc, $aa, $aa, $cc, $00             // 3610: ........
    .byt $44, $aa, $88, $88, $88, $aa, $44, $00             // 3618: D.....D.
    .byt $cc, $aa, $aa, $aa, $aa, $aa, $cc, $00             // 3620: ........
    .byt $ee, $88, $88, $cc, $88, $88, $ee, $00             // 3628: ........
    .byt $ee, $88, $88, $cc, $88, $88, $88, $00             // 3630: ........
    .byt $44, $aa, $88, $88, $aa, $aa, $66, $00             // 3638: D.....f.
    .byt $aa, $aa, $aa, $ee, $aa, $aa, $aa, $00             // 3640: ........
    .byt $ee, $44, $44, $44, $44, $44, $ee, $00             // 3648: .DDDDD..
    .byt $ee, $44, $44, $44, $44, $44, $88, $00             // 3650: .DDDDD..
    .byt $88, $aa, $ee, $cc, $aa, $aa, $aa, $00             // 3658: ........
    .byt $88, $88, $88, $88, $88, $88, $ee, $00             // 3660: ........
    .byt $aa, $ee, $ee, $aa, $aa, $aa, $aa, $00             // 3668: ........
    .byt $aa, $aa, $ee, $ee, $ee, $aa, $aa, $00             // 3670: ........
    .byt $44, $aa, $aa, $aa, $aa, $aa, $44, $00             // 3678: D.....D.
    .byt $cc, $aa, $aa, $cc, $88, $88, $88, $00             // 3680: ........
    .byt $44, $aa, $aa, $aa, $aa, $cc, $aa, $00             // 3688: D.......
    .byt $cc, $aa, $aa, $cc, $aa, $aa, $aa, $00             // 3690: ........
    .byt $44, $aa, $88, $44, $22, $aa, $44, $00             // 3698: D..D".D.
    .byt $ee, $44, $44, $44, $44, $44, $44, $00             // 36a0: .DDDDDD.
    .byt $aa, $aa, $aa, $aa, $aa, $aa, $ee, $00             // 36a8: ........
    .byt $aa, $aa, $aa, $aa, $aa, $44, $44, $00             // 36b0: .....DD.
    .byt $aa, $aa, $aa, $aa, $ee, $ee, $aa, $00             // 36b8: ........
    .byt $aa, $aa, $44, $44, $44, $aa, $aa, $00             // 36c0: ..DDD...
    .byt $aa, $aa, $aa, $ee, $44, $44, $44, $00             // 36c8: ....DDD.
    .byt $ee, $22, $22, $44, $88, $88, $ee, $00             // 36d0: .""D....
    .byt $ee, $88, $88, $88, $88, $88, $ee, $00             // 36d8: ........
    .byt $00, $88, $88, $44, $22, $22, $00, $00             // 36e0: ...D""..
    .byt $ee, $22, $22, $22, $22, $22, $ee, $00             // 36e8: ."""""..
    .byt $44, $ee, $aa, $00, $00, $00, $00, $00             // 36f0: D.......
    .byt $00, $00, $00, $00, $00, $00, $00, $ff             // 36f8: ........
    .byt $66, $88, $88, $cc, $88, $88, $ee, $00             // 3700: f.......
    .byt $00, $00, $66, $aa, $aa, $aa, $66, $00             // 3708: ..f...f.
    .byt $88, $88, $cc, $aa, $aa, $aa, $cc, $00             // 3710: ........
    .byt $00, $00, $66, $88, $88, $88, $66, $00             // 3718: ..f...f.
    .byt $22, $22, $66, $aa, $aa, $aa, $66, $00             // 3720: ""f...f.
    .byt $00, $00, $44, $aa, $ee, $88, $66, $00             // 3728: ..D...f.
    .byt $66, $88, $88, $cc, $88, $88, $88, $00             // 3730: f.......
    .byt $00, $00, $66, $aa, $aa, $66, $22, $cc             // 3738: ..f..f".
    .byt $88, $88, $cc, $aa, $aa, $aa, $aa, $00             // 3740: ........
    .byt $00, $44, $00, $44, $44, $44, $22, $00             // 3748: .D.DDD".
    .byt $00, $44, $00, $44, $44, $44, $44, $88             // 3750: .D.DDDD.
    .byt $88, $88, $88, $aa, $cc, $aa, $aa, $00             // 3758: ........
    .byt $44, $44, $44, $44, $44, $44, $22, $00             // 3760: DDDDDD".
    .byt $00, $00, $aa, $ee, $ee, $aa, $aa, $00             // 3768: ........
    .byt $00, $00, $cc, $aa, $aa, $aa, $aa, $00             // 3770: ........
    .byt $00, $00, $44, $aa, $aa, $aa, $44, $00             // 3778: ..D...D.
    .byt $00, $00, $cc, $aa, $aa, $cc, $88, $88             // 3780: ........
    .byt $00, $00, $66, $aa, $aa, $66, $22, $33             // 3788: ..f..f"3
    .byt $00, $00, $66, $88, $88, $88, $88, $00             // 3790: ..f.....
    .byt $00, $00, $66, $88, $44, $22, $cc, $00             // 3798: ..f.D"..
    .byt $00, $88, $88, $cc, $88, $88, $44, $00             // 37a0: ......D.
    .byt $00, $00, $aa, $aa, $aa, $aa, $66, $00             // 37a8: ......f.
    .byt $00, $00, $aa, $aa, $aa, $44, $44, $00             // 37b0: .....DD.
    .byt $00, $00, $aa, $aa, $aa, $ee, $aa, $00             // 37b8: ........
    .byt $00, $00, $aa, $aa, $44, $aa, $aa, $00             // 37c0: ....D...
    .byt $00, $00, $aa, $aa, $aa, $66, $22, $cc             // 37c8: .....f".
    .byt $00, $00, $ee, $22, $44, $88, $ee, $00             // 37d0: ..."D...
    .byt $22, $44, $44, $88, $44, $44, $22, $00             // 37d8: "DD.DD".
    .byt $44, $44, $44, $00, $44, $44, $44, $00             // 37e0: DDD.DDD.
    .byt $88, $44, $44, $22, $44, $44, $88, $00             // 37e8: .DD"DD..
    .byt $22, $ee, $88, $00, $00, $00, $00, $00             // 37f0: ".......
    .byt $00, $20, $40, $f0, $40, $20, $00, $00             // 37f8: . @.@ ..
data_sprite12_row0:
    .byt $11, $33, $22, $22, $22, $33, $11, $00             // 3800: .3"""3..
    .byt $ff, $33, $b3, $b3, $77, $ff, $ff, $30             // 3808: .3..w..0
    .byt $00, $88, $cc, $cc, $cc, $88, $00, $00             // 3810: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3818: ........
data_sprite13_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3820: ........
    .byt $77, $dd, $a8, $a8, $dd, $76, $33, $10             // 3828: w....v3.
    .byt $ee, $bb, $51, $51, $bb, $e6, $cc, $80             // 3830: ..QQ....
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3838: ........
data_sprite14_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3840: ........
    .byt $00, $11, $33, $33, $33, $11, $00, $00             // 3848: ..333...
    .byt $ff, $cc, $dc, $dc, $ee, $ff, $ff, $c0             // 3850: ........
    .byt $88, $cc, $44, $44, $44, $cc, $88, $00             // 3858: ..DDD...
data_sprite0f_row0:
    .byt $66, $91, $00, $00, $00, $00, $11, $22             // 3860: f......"
    .byt $00, $20, $aa, $bb, $77, $55, $dd, $75             // 3868: . ..wU.u
    .byt $00, $40, $55, $dd, $ee, $aa, $bb, $ea             // 3870: .@U.....
    .byt $66, $98, $00, $00, $00, $00, $88, $44             // 3878: f......D
data_sprite10_row0:
    .byt $00, $00, $33, $44, $44, $80, $11, $22             // 3880: ..3DD.."
    .byt $00, $20, $aa, $bb, $77, $55, $dd, $75             // 3888: . ..wU.u
    .byt $00, $40, $55, $dd, $ee, $aa, $bb, $ea             // 3890: .@U.....
    .byt $66, $98, $00, $00, $00, $00, $88, $44             // 3898: f......D
data_sprite11_row0:
    .byt $66, $91, $00, $00, $00, $00, $11, $22             // 38a0: f......"
    .byt $00, $20, $aa, $bb, $77, $55, $dd, $75             // 38a8: . ..wU.u
    .byt $00, $40, $55, $dd, $ee, $aa, $bb, $ea             // 38b0: .@U.....
    .byt $00, $00, $cc, $22, $22, $10, $88, $44             // 38b8: ...""..D
data_sprite00_row0:
    .byt $00, $00, $00, $11, $22, $66, $00, $54             // 38c0: ...."f.T
    .byt $22, $aa, $01, $8a, $41, $1c, $83, $14             // 38c8: "...A...
    .byt $88, $8d, $66, $44, $54, $46, $40, $22             // 38d0: ..fDTF@"
    .byt $00, $00, $88, $04, $00, $aa, $11, $88             // 38d8: ........
data_sprite01_row0:
    .byt $00, $00, $00, $00, $00, $11, $00, $11             // 38e0: ........
    .byt $00, $00, $11, $02, $cd, $33, $8b, $14             // 38e8: .....3..
    .byt $00, $00, $66, $44, $55, $66, $44, $22             // 38f0: ..fDUfD"
    .byt $00, $00, $00, $00, $00, $88, $00, $cc             // 38f8: ........
data_sprite02_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $11             // 3900: ........
    .byt $00, $00, $00, $00, $01, $77, $8b, $15             // 3908: .....w..
    .byt $00, $00, $00, $00, $44, $66, $44, $22             // 3910: ....DfD"
    .byt $00, $00, $00, $00, $00, $00, $00, $88             // 3918: ........
data_sprite03_row0:
    .byt $01, $00, $05, $17, $03, $07, $5e, $12             // 3920: ......^.
    .byt $04, $0d, $4a, $8c, $85, $0e, $8c, $0f             // 3928: ..J.....
data_sprite04_row0:
    .byt $00, $00, $01, $15, $03, $25, $46, $01             // 3930: .....%F.
    .byt $00, $00, $40, $08, $84, $0a, $c8, $06             // 3938: ..@.....
data_sprite12_row1:
    .byt $00, $30, $30, $70, $60, $60, $e0, $c0             // 3940: .00p``..
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $70, $70             // 3948: ......pp
    .byt $c0, $f0, $f0, $f0, $d0, $d0, $90, $80             // 3950: ........
    .byt $00, $00, $00, $80, $80, $80, $c0, $c0             // 3958: ........
data_sprite13_row1:
    .byt $00, $10, $10, $30, $30, $30, $70, $60             // 3960: ...000p`
    .byt $70, $f0, $f0, $f0, $70, $70, $30, $30             // 3968: p...pp00
    .byt $e0, $f0, $f0, $f0, $e0, $e0, $c0, $c0             // 3970: ........
    .byt $00, $80, $80, $c0, $c0, $c0, $e0, $60             // 3978: .......`
data_sprite14_row1:
    .byt $00, $00, $00, $10, $10, $10, $30, $30             // 3980: ......00
    .byt $30, $f0, $f0, $f0, $b0, $b0, $90, $10             // 3988: 0.......
    .byt $f0, $f0, $f0, $f0, $f0, $f0, $e0, $e0             // 3990: ........
    .byt $00, $c0, $c0, $e0, $60, $60, $70, $30             // 3998: ....``p0
data_sprite0f_row1:
    .byt $11, $11, $00, $00, $00, $66, $ee, $ff             // 39a0: .....f..
    .byt $75, $55, $dd, $77, $75, $32, $11, $22             // 39a8: uU.wu2."
    .byt $ea, $aa, $bb, $ee, $ea, $c4, $88, $44             // 39b0: .......D
    .byt $88, $88, $00, $00, $00, $66, $77, $ff             // 39b8: .....fw.
data_sprite10_row1:
    .byt $11, $11, $00, $00, $00, $00, $22, $77             // 39c0: ......"w
    .byt $75, $55, $dd, $77, $75, $32, $11, $22             // 39c8: uU.wu2."
    .byt $ea, $aa, $bb, $ee, $ea, $c4, $88, $44             // 39d0: .......D
    .byt $88, $88, $00, $11, $33, $77, $77, $ee             // 39d8: ....3ww.
data_sprite11_row1:
    .byt $11, $11, $00, $88, $cc, $ee, $ee, $77             // 39e0: .......w
    .byt $75, $55, $dd, $77, $75, $32, $11, $22             // 39e8: uU.wu2."
    .byt $ea, $aa, $bb, $ee, $ea, $c4, $88, $44             // 39f0: .......D
    .byt $88, $88, $00, $00, $00, $00, $44, $ee             // 39f8: ......D.
data_sprite00_row1:
    .byt $46, $03, $01, $88, $05, $88, $14, $e9             // 3a00: F.......
    .byt $4b, $1a, $24, $5a, $a5, $0b, $5a, $27             // 3a08: K.$Z..Z'
    .byt $10, $85, $40, $24, $94, $0e, $b4, $5a             // 3a10: ..@$...Z
    .byt $aa, $d1, $22, $a2, $00, $00, $51, $2a             // 3a18: .."...Q*
data_sprite01_row1:
    .byt $02, $01, $01, $00, $05, $00, $15, $65             // 3a20: .......e
    .byt $cb, $1a, $37, $9e, $e4, $8b, $1e, $af             // 3a28: ..7.....
    .byt $11, $85, $ea, $2e, $b6, $0e, $3a, $5a             // 3a30: ......:Z
    .byt $88, $cc, $22, $a2, $44, $00, $44, $2a             // 3a38: ..".D.D*
data_sprite02_row1:
    .byt $00, $01, $01, $00, $23, $22, $11, $23             // 3a40: ....#".#
    .byt $cf, $1a, $37, $9e, $e4, $8b, $1e, $eb             // 3a48: ..7.....
    .byt $11, $85, $ea, $2e, $a7, $4a, $3b, $4b             // 3a50: .....J;K
    .byt $88, $cc, $00, $88, $44, $00, $44, $08             // 3a58: ....D.D.
data_sprite03_row1:
    .byt $25, $4f, $12, $0f, $25, $9b, $03, $04             // 3a60: %O..%...
    .byt $c8, $0f, $2e, $8c, $6a, $0c, $88, $08             // 3a68: ....j...
data_sprite04_row1:
    .byt $05, $47, $10, $01, $01, $13, $00, $00             // 3a70: .G......
    .byt $80, $2c, $04, $8c, $22, $00, $00, $00             // 3a78: .,.."...
data_sprite12_row2:
    .byt $84, $0c, $08, $00, $00, $00, $00, $00             // 3a80: ........
    .byt $30, $03, $07, $07, $07, $0e, $0c, $0c             // 3a88: 0.......
    .byt $0c, $0c, $0e, $0e, $0e, $06, $07, $07             // 3a90: ........
    .byt $48, $0c, $04, $00, $00, $00, $00, $00             // 3a98: H.......
data_sprite13_row2:
    .byt $42, $06, $04, $00, $00, $00, $00, $00             // 3aa0: B.......
    .byt $12, $03, $07, $07, $07, $0e, $0e, $0c             // 3aa8: ........
    .byt $84, $0c, $0e, $0e, $0e, $07, $07, $03             // 3ab0: ........
    .byt $24, $06, $02, $00, $00, $00, $00, $00             // 3ab8: $.......
data_sprite14_row2:
    .byt $21, $03, $02, $00, $00, $00, $00, $00             // 3ac0: !.......
    .byt $03, $03, $07, $07, $07, $06, $0e, $0e             // 3ac8: ........
    .byt $c0, $0c, $0e, $0e, $0e, $07, $03, $03             // 3ad0: ........
    .byt $12, $03, $01, $00, $00, $00, $00, $00             // 3ad8: ........
data_sprite0f_row2:
    .byt $dd, $99, $11, $11, $11, $33, $ee, $cc             // 3ae0: .....3..
    .byt $33, $22, $bb, $aa, $fd, $f8, $f8, $fc             // 3ae8: 3"......
    .byt $cc, $44, $dd, $55, $fb, $f1, $f1, $f3             // 3af0: .D.U....
    .byt $bb, $99, $88, $88, $88, $cc, $77, $33             // 3af8: ......w3
data_sprite10_row2:
    .byt $ff, $dd, $dd, $99, $11, $33, $66, $44             // 3b00: .....3fD
    .byt $33, $22, $bb, $aa, $fb, $f0, $f0, $f8             // 3b08: 3"......
    .byt $cc, $44, $dd, $55, $f7, $f3, $f3, $f7             // 3b10: .D.U....
    .byt $88, $88, $99, $bb, $bb, $ff, $44, $00             // 3b18: ......D.
data_sprite11_row2:
    .byt $11, $11, $99, $dd, $dd, $ff, $22, $00             // 3b20: ......".
    .byt $33, $22, $bb, $aa, $fe, $fc, $fc, $fe             // 3b28: 3"......
    .byt $cc, $44, $dd, $55, $fd, $f0, $f0, $f1             // 3b30: .D.U....
    .byt $ff, $bb, $bb, $99, $88, $cc, $66, $22             // 3b38: ......f"
data_sprite00_row2:
    .byt $88, $88, $0a, $d8, $01, $8e, $a8, $00             // 3b40: ........
    .byt $b6, $0b, $84, $5a, $0d, $b0, $09, $20             // 3b48: ...Z... 
    .byt $1c, $c6, $2c, $0d, $78, $0c, $b0, $0c             // 3b50: ..,.x...
    .byt $55, $11, $a2, $08, $37, $00, $40, $22             // 3b58: U...7.@"
data_sprite01_row2:
    .byt $33, $44, $46, $54, $01, $44, $00, $22             // 3b60: 3DFT.D."
    .byt $b6, $0e, $84, $4a, $8d, $b0, $09, $aa             // 3b68: ...J....
    .byt $3a, $c6, $2a, $0d, $78, $0c, $b1, $4c             // 3b70: :.*.x..L
    .byt $44, $00, $ee, $08, $26, $00, $44, $00             // 3b78: D...&.D.
data_sprite02_row2:
    .byt $33, $00, $02, $11, $01, $00, $00, $00             // 3b80: 3.......
    .byt $b4, $0e, $a4, $0a, $8d, $88, $09, $aa             // 3b88: ........
    .byt $3b, $c7, $2a, $0d, $7b, $0c, $bb, $4c             // 3b90: ;.*.{..L
    .byt $44, $00, $cc, $08, $00, $00, $00, $00             // 3b98: D.......
data_sprite05_row0:
    .byt $00, $00, $00, $00, $01, $20, $02, $01             // 3ba0: ..... ..
    .byt $00, $00, $00, $00, $80, $08, $c8, $04             // 3ba8: ........
data_sprite0e_row0:
    .byt $10, $30, $31, $61, $63, $e3, $c7, $c7             // 3bb0: .01ac...
    .byt $80, $c0, $68, $6c, $6c, $7c, $3e, $3e             // 3bb8: ..hll|>>
data_sprite12_row3:
    .byt $01, $01, $01, $01, $01, $03, $07, $0f             // 3bc0: ........
    .byt $0c, $08, $08, $08, $08, $08, $08, $00             // 3bc8: ........
    .byt $03, $03, $03, $01, $01, $01, $01, $00             // 3bd0: ........
    .byt $00, $08, $08, $08, $08, $0c, $0e, $0f             // 3bd8: ........
data_sprite13_row3:
    .byt $01, $01, $01, $01, $01, $03, $07, $0f             // 3be0: ........
    .byt $0c, $08, $08, $08, $08, $08, $08, $00             // 3be8: ........
    .byt $03, $01, $01, $01, $01, $01, $01, $00             // 3bf0: ........
    .byt $08, $08, $08, $08, $08, $0c, $0e, $0f             // 3bf8: ........
data_sprite14_row3:
    .byt $00, $01, $01, $01, $01, $03, $07, $0f             // 3c00: ........
    .byt $0c, $0c, $0c, $08, $08, $08, $08, $00             // 3c08: ........
    .byt $03, $01, $01, $01, $01, $01, $01, $00             // 3c10: ........
    .byt $08, $08, $08, $08, $08, $0c, $0e, $0f             // 3c18: ........
data_sprite0f_row3:
    .byt $88, $11, $11, $11, $33, $33, $77, $f5             // 3c20: ....33w.
    .byt $fc, $76, $76, $bb, $11, $11, $00, $80             // 3c28: .vv.....
    .byt $f3, $e6, $e6, $dd, $88, $88, $00, $10             // 3c30: ........
    .byt $11, $88, $88, $88, $cc, $cc, $ee, $fa             // 3c38: ........
data_sprite10_row3:
    .byt $cc, $dd, $11, $11, $33, $33, $77, $f5             // 3c40: ....33w.
    .byt $f8, $fc, $fc, $ff, $33, $33, $00, $80             // 3c48: ....33..
    .byt $f7, $cc, $98, $88, $00, $00, $00, $00             // 3c50: ........
    .byt $cc, $ee, $fa, $00, $00, $00, $00, $00             // 3c58: ........
data_sprite11_row3:
    .byt $33, $77, $f5, $00, $00, $00, $00, $00             // 3c60: 3w......
    .byt $fe, $33, $91, $11, $00, $00, $00, $00             // 3c68: .3......
    .byt $f1, $f3, $f3, $ff, $cc, $cc, $00, $10             // 3c70: ........
    .byt $33, $bb, $88, $88, $cc, $cc, $ee, $fa             // 3c78: 3.......
data_sprite00_row3:
    .byt $54, $00, $44, $11, $22, $11, $00, $00             // 3c80: T.D."...
    .byt $00, $29, $60, $01, $14, $77, $00, $22             // 3c88: .)`..w."
    .byt $01, $a1, $12, $80, $06, $4c, $00, $99             // 3c90: .....L..
    .byt $00, $44, $00, $00, $44, $88, $88, $00             // 3c98: .D..D...
data_sprite01_row3:
    .byt $11, $00, $00, $11, $00, $00, $00, $00             // 3ca0: ........
    .byt $00, $2b, $66, $01, $55, $00, $00, $00             // 3ca8: .+f.U...
    .byt $89, $aa, $9b, $88, $66, $00, $00, $00             // 3cb0: ....f...
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3cb8: ........
data_sprite02_row3:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3cc0: ........
    .byt $44, $23, $22, $00, $00, $00, $00, $00             // 3cc8: D#".....
    .byt $88, $aa, $88, $00, $00, $00, $00, $00             // 3cd0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3cd8: ........
data_sprite05_row1:
    .byt $00, $03, $10, $01, $00, $00, $00, $00             // 3ce0: ........
    .byt $80, $0c, $04, $88, $00, $00, $00, $00             // 3ce8: ........
data_sprite0e_row1:
    .byt $c7, $c7, $c7, $e3, $63, $73, $70, $30             // 3cf0: ....csp0
    .byt $7c, $e8, $c8, $e8, $ec, $e4, $e0, $40             // 3cf8: |......@
data_sprite15_row0:
    .byt $00, $08, $0c, $0c, $60, $60, $30, $30             // 3d00: ....``00
    .byt $77, $dd, $a8, $a8, $dd, $76, $33, $d0             // 3d08: w....v3.
    .byt $ee, $bb, $51, $51, $bb, $e6, $cc, $80             // 3d10: ..QQ....
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3d18: ........
data_sprite16_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3d20: ........
    .byt $77, $dd, $a8, $a8, $dd, $76, $33, $10             // 3d28: w....v3.
    .byt $ee, $bb, $51, $51, $bb, $e6, $cc, $b0             // 3d30: ..QQ....
    .byt $00, $01, $03, $03, $60, $60, $c0, $c0             // 3d38: ....``..
data_sprite17_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3d40: ........
    .byt $11, $33, $77, $77, $77, $33, $11, $00             // 3d48: .3www3..
    .byt $ff, $99, $a8, $a8, $cc, $ff, $ff, $e0             // 3d50: ........
    .byt $00, $88, $88, $88, $88, $88, $00, $00             // 3d58: ........
data_sprite18_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3d60: ........
    .byt $11, $33, $77, $77, $77, $33, $11, $00             // 3d68: .3www3..
    .byt $ff, $99, $a8, $a8, $cc, $ff, $ff, $e0             // 3d70: ........
    .byt $00, $88, $88, $88, $88, $88, $00, $00             // 3d78: ........
data_sprite19_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3d80: ........
    .byt $00, $11, $33, $33, $33, $11, $00, $00             // 3d88: ..333...
    .byt $ff, $cc, $dc, $dc, $ee, $ff, $ff, $e0             // 3d90: ........
    .byt $88, $cc, $44, $44, $44, $cc, $88, $00             // 3d98: ..DDD...
data_sprite1a_row0:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3da0: ........
    .byt $00, $11, $33, $77, $77, $77, $33, $11             // 3da8: ..3www3.
    .byt $00, $ff, $99, $a8, $a8, $cc, $ff, $ff             // 3db0: ........
    .byt $00, $00, $88, $88, $88, $88, $88, $00             // 3db8: ........
data_sprite1b_row0:
    .byt $00, $00, $11, $11, $11, $11, $11, $00             // 3dc0: ........
    .byt $00, $ff, $99, $51, $51, $33, $ff, $ff             // 3dc8: ...QQ3..
    .byt $00, $88, $cc, $ee, $ee, $ee, $cc, $88             // 3dd0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3dd8: ........
data_sprite1c_row0:
    .byt $11, $33, $22, $22, $22, $33, $11, $00             // 3de0: .3"""3..
    .byt $ff, $33, $b3, $b3, $77, $ff, $ff, $70             // 3de8: .3..w..p
    .byt $00, $88, $cc, $cc, $cc, $88, $00, $00             // 3df0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3df8: ........
data_sprite1d_row0:
    .byt $00, $11, $11, $11, $11, $11, $00, $00             // 3e00: ........
    .byt $ff, $99, $51, $51, $33, $ff, $ff, $70             // 3e08: ..QQ3..p
    .byt $88, $cc, $ee, $ee, $ee, $cc, $88, $00             // 3e10: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3e18: ........
data_sprite1e_row0:
    .byt $00, $11, $11, $11, $11, $11, $00, $00             // 3e20: ........
    .byt $ff, $99, $51, $51, $33, $ff, $ff, $70             // 3e28: ..QQ3..p
    .byt $88, $cc, $ee, $ee, $ee, $cc, $88, $00             // 3e30: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3e38: ........
data_sprite15_row1:
    .byt $10, $00, $00, $00, $00, $00, $00, $00             // 3e40: ........
    .byt $f0, $f0, $f0, $70, $70, $30, $30, $30             // 3e48: ...pp000
    .byt $e0, $f0, $f0, $f0, $e0, $e0, $c0, $c0             // 3e50: ........
    .byt $00, $80, $80, $c0, $e0, $60, $61, $03             // 3e58: .....`a.
data_sprite16_row1:
    .byt $00, $10, $10, $30, $70, $60, $68, $0c             // 3e60: ...0p`h.
    .byt $70, $f0, $f0, $f0, $70, $70, $30, $30             // 3e68: p...pp00
    .byt $f0, $f0, $f0, $e0, $e0, $c0, $c0, $c0             // 3e70: ........
    .byt $80, $00, $00, $00, $00, $00, $00, $00             // 3e78: ........
data_sprite17_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3e80: ........
    .byt $10, $10, $30, $30, $30, $30, $34, $34             // 3e88: ..000044
    .byt $d0, $d0, $60, $60, $b0, $b0, $d0, $e0             // 3e90: ..``....
    .byt $00, $00, $03, $c3, $c3, $c0, $00, $00             // 3e98: ........
data_sprite18_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3ea0: ........
    .byt $10, $10, $10, $30, $30, $30, $30, $30             // 3ea8: ...00000
    .byt $d0, $d0, $50, $60, $60, $60, $b0, $b0             // 3eb0: ..P```..
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3eb8: ........
data_sprite19_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3ec0: ........
    .byt $10, $10, $10, $20, $20, $20, $10, $10             // 3ec8: ...   ..
    .byt $d0, $d0, $d0, $d0, $d0, $d0, $b0, $b0             // 3ed0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3ed8: ........
data_sprite1a_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3ee0: ........
    .byt $10, $10, $30, $30, $60, $60, $1c, $1c             // 3ee8: ..00``..
    .byt $e0, $d0, $b0, $70, $e0, $e0, $e0, $e0             // 3ef0: ...p....
    .byt $00, $00, $03, $43, $c3, $c0, $00, $00             // 3ef8: ...C....
data_sprite1b_row1:
    .byt $00, $00, $0c, $2c, $3c, $30, $00, $00             // 3f00: ...,<0..
    .byt $70, $b0, $d0, $e0, $70, $70, $70, $70             // 3f08: p...pppp
    .byt $80, $80, $c0, $c0, $60, $60, $83, $83             // 3f10: ....``..
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f18: ........
data_sprite1c_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f20: ........
    .byt $b0, $b0, $b0, $b0, $b0, $b0, $d0, $d0             // 3f28: ........
    .byt $80, $80, $80, $40, $40, $40, $80, $80             // 3f30: ...@@@..
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f38: ........
data_sprite1d_row1:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f40: ........
    .byt $b0, $b0, $a0, $60, $60, $60, $d0, $d0             // 3f48: ...```..
    .byt $80, $80, $80, $c0, $c0, $c0, $c0, $c0             // 3f50: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f58: ........
data_sprite1e_row1:
    .byt $00, $00, $0c, $3c, $3c, $30, $00, $00             // 3f60: ...<<0..
    .byt $b0, $b0, $60, $60, $d0, $d0, $b0, $70             // 3f68: ..``...p
    .byt $80, $80, $c0, $c0, $c0, $c0, $c2, $c2             // 3f70: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3f78: ........
data_sprite15_row2:
    .byt $00, $01, $01, $01, $01, $03, $07, $0f             // 3f80: ........
    .byt $0f, $0f, $0f, $0f, $09, $08, $08, $00             // 3f88: ........
    .byt $c0, $0c, $0c, $0e, $0e, $07, $07, $03             // 3f90: ........
    .byt $03, $00, $00, $00, $00, $00, $00, $00             // 3f98: ........
data_sprite16_row2:
    .byt $0c, $00, $00, $00, $00, $00, $00, $00             // 3fa0: ........
    .byt $30, $03, $03, $07, $07, $0e, $0e, $0c             // 3fa8: 0.......
    .byt $0f, $0f, $0f, $0f, $09, $01, $01, $00             // 3fb0: ........
    .byt $00, $08, $08, $08, $08, $0c, $0e, $0f             // 3fb8: ........
data_sprite17_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3fc0: ........
    .byt $34, $03, $03, $03, $07, $07, $07, $0e             // 3fc8: 4.......
    .byt $e0, $0c, $0c, $0a, $0a, $07, $07, $03             // 3fd0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $08             // 3fd8: ........
data_sprite18_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3fe0: ........
    .byt $30, $03, $03, $03, $01, $01, $03, $07             // 3fe8: 0.......
    .byt $b0, $0b, $0b, $0c, $0c, $0c, $0a, $0a             // 3ff0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 3ff8: ........
data_sprite19_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4000: ........
    .byt $10, $01, $01, $02, $03, $01, $01, $05             // 4008: ........
    .byt $b0, $0b, $0b, $07, $0f, $0f, $0e, $0e             // 4010: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4018: ........
data_sprite1a_row2:
    .byt $00, $00, $00, $00, $00, $0e, $0f, $0f             // 4020: ........
    .byt $30, $03, $03, $01, $02, $07, $0f, $0e             // 4028: 0.......
    .byt $e0, $0e, $0e, $0f, $0f, $07, $07, $03             // 4030: ........
    .byt $00, $00, $00, $00, $00, $00, $08, $08             // 4038: ........
data_sprite1b_row2:
    .byt $00, $00, $00, $00, $00, $00, $01, $01             // 4040: ........
    .byt $70, $07, $07, $0f, $0f, $0e, $0e, $0c             // 4048: p.......
    .byt $c0, $0c, $0c, $08, $04, $0e, $0f, $07             // 4050: ........
    .byt $00, $00, $00, $00, $00, $07, $0f, $0f             // 4058: ........
data_sprite1c_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4060: ........
    .byt $d0, $0d, $0d, $0e, $0f, $0f, $07, $07             // 4068: ........
    .byt $80, $08, $08, $04, $0c, $08, $08, $0a             // 4070: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4078: ........
data_sprite1d_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4080: ........
    .byt $d0, $0d, $0d, $03, $03, $03, $05, $05             // 4088: ........
    .byt $c0, $0c, $0c, $0c, $08, $08, $0c, $0e             // 4090: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4098: ........
data_sprite1e_row2:
    .byt $00, $00, $00, $00, $00, $00, $00, $01             // 40a0: ........
    .byt $70, $03, $03, $05, $05, $0e, $0e, $0c             // 40a8: p.......
    .byt $c2, $0c, $0c, $0c, $0e, $0e, $0e, $07             // 40b0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 40b8: ........
data_sprite15_row3:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 40c0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 40c8: ........
    .byt $03, $01, $01, $01, $01, $01, $01, $00             // 40d0: ........
    .byt $08, $08, $08, $08, $08, $0c, $0e, $0f             // 40d8: ........
data_sprite16_row3:
    .byt $01, $01, $01, $01, $01, $03, $07, $0f             // 40e0: ........
    .byt $0c, $08, $08, $08, $08, $08, $08, $00             // 40e8: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 40f0: ........
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 40f8: ........
data_sprite17_row3:
    .byt $03, $07, $07, $07, $03, $03, $01, $00             // 4100: ........
    .byt $0e, $0c, $00, $00, $00, $08, $08, $00             // 4108: ........
    .byt $03, $01, $01, $01, $01, $01, $01, $01             // 4110: ........
    .byt $08, $08, $08, $08, $08, $0e, $0f, $0f             // 4118: ........
data_sprite18_row3:
    .byt $00, $00, $01, $01, $01, $00, $00, $00             // 4120: ........
    .byt $07, $0e, $0c, $0c, $0e, $0f, $07, $00             // 4128: ........
    .byt $06, $0c, $0c, $0c, $0c, $07, $07, $0f             // 4130: ........
    .byt $00, $00, $00, $00, $00, $00, $08, $08             // 4138: ........
data_sprite19_row3:
    .byt $00, $00, $01, $01, $01, $00, $00, $00             // 4140: ........
    .byt $0e, $0e, $0c, $0c, $0e, $0e, $06, $00             // 4148: ........
    .byt $0e, $0c, $0c, $0c, $0c, $0f, $0f, $0f             // 4150: ........
    .byt $00, $00, $00, $00, $00, $00, $08, $08             // 4158: ........
data_sprite1a_row3:
    .byt $0f, $0c, $0c, $0c, $08, $00, $00, $00             // 4160: ........
    .byt $0e, $0c, $00, $00, $00, $00, $00, $00             // 4168: ........
    .byt $03, $01, $01, $01, $01, $01, $01, $01             // 4170: ........
    .byt $08, $08, $08, $08, $08, $0e, $0f, $0f             // 4178: ........
data_sprite1b_row3:
    .byt $01, $01, $01, $01, $01, $07, $0f, $0f             // 4180: ........
    .byt $0c, $08, $08, $08, $08, $08, $08, $08             // 4188: ........
    .byt $07, $03, $00, $00, $00, $00, $00, $00             // 4190: ........
    .byt $0f, $03, $03, $03, $01, $00, $00, $00             // 4198: ........
data_sprite1c_row3:
    .byt $00, $00, $00, $00, $00, $00, $01, $01             // 41a0: ........
    .byt $07, $03, $03, $03, $03, $0f, $0f, $0f             // 41a8: ........
    .byt $07, $07, $03, $03, $07, $07, $06, $00             // 41b0: ........
    .byt $00, $00, $08, $08, $08, $00, $00, $00             // 41b8: ........
data_sprite1d_row3:
    .byt $00, $00, $00, $00, $00, $00, $01, $01             // 41c0: ........
    .byt $06, $03, $03, $03, $03, $0e, $0e, $0f             // 41c8: ........
    .byt $0e, $07, $03, $03, $07, $0f, $0e, $00             // 41d0: ........
    .byt $00, $00, $08, $08, $08, $00, $00, $00             // 41d8: ........
data_sprite1e_row3:
    .byt $01, $01, $01, $01, $01, $07, $0f, $0f             // 41e0: ........
    .byt $0c, $08, $08, $08, $08, $08, $08, $08             // 41e8: ........
    .byt $07, $03, $00, $00, $00, $01, $01, $00             // 41f0: ........
    .byt $0c, $0e, $0e, $0e, $0c, $0c, $08, $00             // 41f8: ........
// Level strip data - each strip is a 32x8 region of the level, packed with 5 bits per tile, so 0x30 bytes per strip.  Transporters and puzzle pieces are defined elsewhere.  The 'end' object on map 0 is encoded as a spirit, with special code making the substitution.
data_levelstrip_00:
    .byt $e0, $ff, $ff, $ff, $ff, $ff, $ff, $ff             // 4200: ........
    .byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff             // 4208: ........
    .byt $ff, $ff, $ff, $07, $00, $01, $04, $10             // 4210: ........
    .byt $40, $00, $01, $00, $00, $10, $00, $20             // 4218: @...... 
    .byt $80, $01, $c6, $18, $63, $8c, $31, $06             // 4220: ....c.1.
    .byt $18, $63, $8c, $31, $c6, $18, $63, $8c             // 4228: .c.1..c.
    .byt $91, $40, $08, $00, $80, $41, $03, $00             // 4230: .@...A..
    .byt $60, $00, $00, $06, $58, $60, $81, $05             // 4238: `...X`..
    .byt $16, $58, $60, $81, $01, $00, $00, $20             // 4240: .X`.... 
    .byt $80, $01, $06, $0a, $60, $90, $00, $00             // 4248: ....`...
    .byt $38, $e0, $80, $03, $0e, $38, $e0, $80             // 4250: 8....8..
    .byt $01, $02, $00, $01, $80, $05, $06, $00             // 4258: ........
    .byt $60, $00, $00, $c6, $18, $61, $84, $11             // 4260: `....a..
    .byt $46, $18, $e1, $86, $11, $40, $08, $00             // 4268: F....@..
    .byt $84, $31, $c6, $00, $63, $8c, $31, $16             // 4270: .1..c.1.
    .byt $21, $84, $10, $42, $08, $21, $84, $10             // 4278: !..B.!..
    .byt $42, $08, $21, $84, $80, $8f, $c0, $83             // 4280: B.!.....
    .byt $14, $1a, $42, $70, $de, $7b, $ef, $bd             // 4288: ..Bp.{..
    .byt $f7, $de, $7b, $ef, $7d, $08, $21, $84             // 4290: ..{.}.!.
    .byt $80, $85, $c0, $03, $17, $ea, $82, $73             // 4298: .......s
data_levelstrip_01:
    .byt $c2, $0b, $4f, $7c, $28, $a4, $0c, $52             // 42a0: ..O|(..R
    .byt $bc, $f7, $01, $63, $8c, $45, $c0, $04             // 42a8: ...c.E..
    .byt $17, $ea, $9c, $8b, $ce, $bb, $42, $7c             // 42b0: ......B|
    .byt $f0, $de, $0f, $4f, $4a, $08, $21, $84             // 42b8: ...OJ.!.
    .byt $80, $43, $c0, $03, $13, $09, $5d, $c4             // 42c0: .C....].
    .byt $63, $90, $e1, $7d, $18, $c3, $0f, $ef             // 42c8: c..}....
    .byt $7d, $c0, $18, $e3, $10, $42, $c0, $83             // 42d0: }....B..
    .byt $14, $32, $4a, $08, $c3, $93, $31, $48             // 42d8: .2J...1H
    .byt $f0, $23, $0c, $32, $3c, $21, $ae, $e0             // 42e0: .#.2<!..
    .byt $e0, $43, $c0, $43, $ef, $10, $c2, $0e             // 42e8: .C.C....
    .byt $c3, $7b, $ef, $7d, $f0, $3e, $78, $3f             // 42f0: .{.}.>x?
    .byt $0a, $21, $78, $90, $e0, $0b, $29, $84             // 42f8: .!x...).
    .byt $f7, $10, $74, $08, $ce, $bb, $10, $7c             // 4300: ..t....|
    .byt $20, $23, $90, $31, $fc, $18, $78, $10             // 4308:  #.1..x.
    .byt $ef, $bd, $47, $3e, $84, $a0, $7d, $d0             // 4310: ..G>..}.
    .byt $85, $0c, $32, $4a, $f0, $3e, $78, $4f             // 4318: ..2J.>xO
    .byt $bc, $0f, $21, $04, $4f, $84, $20, $3e             // 4320: ..!.O. >
    .byt $84, $c0, $7d, $08, $21, $68, $e2, $7d             // 4328: ..}.!h.}
    .byt $08, $3e, $78, $3f, $9c, $0f, $de, $07             // 4330: .>x?....
    .byt $3f, $5c, $21, $3e, $e8, $10, $fc, $0e             // 4338: ?\!>....
data_levelstrip_02:
    .byt $41, $7b, $e1, $85, $0f, $3e, $0c, $ef             // 4340: A{...>..
    .byt $89, $23, $c5, $07, $ef, $9d, $f3, $de             // 4348: .#......
    .byt $f9, $10, $bc, $f7, $c1, $7b, $ef, $9d             // 4350: .....{..
    .byt $0f, $21, $14, $4f, $ca, $f0, $c3, $87             // 4358: .!.O....
    .byt $10, $48, $09, $61, $70, $2f, $3c, $f2             // 4360: .H.ap/<.
    .byt $c2, $0f, $e2, $0b, $f1, $c8, $0f, $52             // 4368: .......R
    .byt $7c, $f0, $c4, $07, $ef, $43, $08, $21             // 4370: |....C.!
    .byt $04, $ee, $7d, $f0, $be, $8c, $e2, $0a             // 4378: ..}.....
    .byt $f1, $a1, $0d, $4f, $7c, $f0, $65, $38             // 4380: ...O|.e8
    .byt $ef, $43, $f0, $21, $84, $10, $bc, $f0             // 4388: .C.!....
    .byt $a3, $90, $e2, $09, $f1, $de, $17, $4f             // 4390: .......O
    .byt $7c, $f0, $de, $8f, $e2, $43, $f0, $de             // 4398: |....C..
    .byt $07, $1f, $bc, $f7, $c2, $0d, $ef, $3d             // 43a0: .......=
    .byt $19, $85, $8c, $42, $bc, $20, $65, $10             // 43a8: ...B. e.
    .byt $ef, $43, $08, $c1, $7b, $1f, $bc, $f0             // 43b0: .C..{...
    .byt $7e, $93, $e1, $bd, $f7, $c5, $17, $ef             // 43b8: ~.......
    .byt $bd, $f7, $de, $7b, $ef, $bd, $f7, $21             // 43c0: ...{...!
    .byt $08, $2f, $7c, $f0, $de, $fb, $e2, $01             // 43c8: ./|.....
    .byt $f0, $1e, $00, $00, $00, $00, $00, $00             // 43d0: ........
    .byt $00, $00, $f0, $de, $7b, $ef, $bd, $f7             // 43d8: ....{...
data_levelstrip_03:
    .byt $c6, $18, $93, $73, $21, $85, $14, $52             // 43e0: ...s!..R
    .byt $58, $84, $21, $84, $10, $82, $0b, $21             // 43e8: X.!....!
    .byt $94, $41, $5a, $84, $39, $bb, $9c, $0b             // 43f0: .AZ.9...
    .byt $c9, $6c, $30, $c2, $82, $9c, $c1, $98             // 43f8: .l0.....
    .byt $90, $4d, $0e, $21, $3a, $12, $a1, $9c             // 4400: .M.!:...
    .byt $85, $94, $41, $4a, $ce, $81, $05, $16             // 4408: ..AJ....
    .byt $42, $08, $21, $84, $10, $72, $08, $31             // 4410: B.!..r.1
    .byt $90, $21, $67, $0a, $23, $5a, $58, $72             // 4418: .!g.#ZXr
    .byt $76, $2e, $84, $10, $42, $08, $11, $16             // 4420: v...B...
    .byt $18, $72, $88, $39, $8f, $08, $53, $08             // 4428: .r.9..S.
    .byt $44, $de, $19, $a1, $21, $25, $98, $10             // 4430: D...!%..
    .byt $42, $84, $72, $92, $1c, $5c, $c8, $21             // 4438: B.r..\.!
    .byt $04, $39, $53, $08, $21, $b8, $20, $a7             // 4440: .9S.!. .
    .byt $c9, $21, $84, $60, $82, $9c, $c6, $91             // 4448: .!.`....
    .byt $6c, $b2, $c9, $21, $c2, $90, $42, $48             // 4450: l..!..BH
    .byt $11, $8a, $08, $23, $cc, $c1, $84, $10             // 4458: ...#....
    .byt $42, $30, $11, $8e, $9c, $73, $0e, $41             // 4460: B0...s.A
    .byt $ce, $14, $42, $08, $72, $86, $10, $e4             // 4468: ..B.r...
    .byt $cc, $21, $04, $13, $72, $08, $72, $92             // 4470: .!..r.r.
    .byt $10, $72, $0e, $11, $06, $e7, $9c, $73             // 4478: .r.....s
data_levelstrip_04:
    .byt $64, $94, $1c, $72, $8e, $30, $84, $17             // 4480: d..r.0..
    .byt $72, $70, $c1, $44, $18, $42, $08, $72             // 4488: rp.D.B.r
    .byt $86, $42, $0a, $19, $24, $5a, $18, $42             // 4490: .B..$Z.B
    .byt $90, $33, $87, $12, $b2, $c9, $21, $c8             // 4498: .3....!.
    .byt $29, $42, $84, $26, $84, $9c, $b3, $cb             // 44a0: )B.&....
    .byt $85, $e6, $4a, $46, $88, $30, $87, $17             // 44a8: ..JF.0..
    .byt $72, $ce, $21, $84, $10, $a1, $9c, $21             // 44b0: r.!....!
    .byt $84, $10, $c2, $08, $44, $de, $49, $4c             // 44b8: ....D.IL
    .byt $91, $33, $c2, $12, $02, $ca, $26, $07             // 44c0: .3....&.
    .byt $27, $67, $08, $25, $c2, $a0, $fd, $0e             // 44c8: 'g.%....
    .byt $64, $88, $5c, $08, $29, $59, $ce, $90             // 44d0: d.\.)Y..
    .byt $73, $ce, $39, $13, $17, $42, $20, $4e             // 44d8: s.9..B N
    .byt $4e, $c3, $bd, $0f, $39, $e7, $4c, $4a             // 44e0: N...9.LJ
    .byt $1e, $39, $c7, $10, $82, $29, $24, $84             // 44e8: .9...)$.
    .byt $08, $c3, $70, $11, $1a, $63, $bc, $37             // 44f0: ..p..c.7
    .byt $21, $04, $47, $4c, $26, $11, $ca, $19             // 44f8: !.GL&...
    .byt $42, $30, $86, $18, $39, $83, $1b, $72             // 4500: B0..9..r
    .byt $46, $68, $b8, $f7, $a4, $38, $52, $46             // 4508: Fh...8RF
    .byt $26, $64, $e6, $1c, $61, $08, $c1, $44             // 4510: &d..a..D
    .byt $18, $42, $19, $d9, $c9, $19, $21, $f7             // 4518: .B....!.
data_levelstrip_05:
    .byt $c1, $95, $11, $61, $76, $84, $e4, $2c             // 4520: ...av..,
    .byt $67, $84, $46, $c8, $19, $42, $08, $99             // 4528: g.F..B..
    .byt $94, $21, $67, $84, $ae, $0c, $27, $67             // 4530: .!g...'g
    .byt $70, $84, $b8, $91, $b3, $9c, $11, $1a             // 4538: p.......
    .byt $67, $8c, $31, $b9, $64, $52, $86, $9c             // 4540: g.1.dR..
    .byt $24, $38, $32, $65, $28, $a4, $b8, $11             // 4548: $82e(...
    .byt $61, $ce, $72, $46, $48, $c8, $28, $99             // 4550: a.rFH.(.
    .byt $64, $67, $0a, $29, $21, $90, $02, $a3             // 4558: dg.)!...
    .byt $31, $b9, $90, $22, $67, $ce, $39, $cb             // 4560: 1.."g.9.
    .byt $19, $42, $08, $b9, $64, $47, $9c, $1b             // 4568: .B..dG..
    .byt $21, $42, $62, $22, $34, $c6, $44, $68             // 4570: !Bb"4.Dh
    .byt $22, $0c, $22, $e7, $08, $73, $0e, $99             // 4578: "."..s..
    .byt $64, $53, $c8, $28, $41, $ce, $08, $e5             // 4580: dS.(A...
    .byt $34, $c6, $c8, $59, $e4, $0c, $21, $67             // 4588: 4..Y..!g
    .byt $39, $73, $0e, $39, $e4, $9c, $73, $ce             // 4590: 9s.9..s.
    .byt $21, $04, $39, $43, $88, $30, $42, $32             // 4598: !.9C.0B2
    .byt $5c, $0e, $21, $e7, $10, $22, $0c, $21             // 45a0: \.!..".!
    .byt $84, $e0, $5c, $1e, $26, $08, $63, $42             // 45a8: ..\.&.cB
    .byt $90, $53, $ce, $32, $48, $08, $21, $84             // 45b0: .S.2H.!.
    .byt $10, $e4, $8c, $d0, $84, $50, $5c, $08             // 45b8: .....P\.
data_levelstrip_06:
    .byt $21, $84, $10, $42, $30, $a1, $0c, $12             // 45c0: !..B0...
    .byt $61, $08, $21, $e7, $1c, $82, $93, $33             // 45c8: a.!....3
    .byt $c2, $90, $07, $09, $21, $98, $10, $4c             // 45d0: ....!..L
    .byt $08, $21, $3b, $22, $67, $08, $21, $9b             // 45d8: .!;"g.!.
    .byt $9c, $89, $0b, $59, $4e, $93, $49, $71             // 45e0: ...YN.Iq
    .byt $26, $84, $10, $42, $08, $21, $c2, $51             // 45e8: &..B.!.Q
    .byt $22, $0c, $21, $13, $e7, $48, $0e, $21             // 45f0: ".!..H.!
    .byt $47, $68, $ca, $20, $d9, $e4, $90, $45             // 45f8: Gh. ...E
    .byt $30, $61, $90, $5c, $e4, $0c, $21, $bb             // 4600: 0a.\..!.
    .byt $32, $48, $0e, $21, $c8, $99, $73, $28             // 4608: 2H.!..s(
.byt $26, $9b, $6c, $72, $08, $21, $93, $5c             // 4610: &.lr.!.\ 
    .byt $4c, $84, $21, $bb, $5c, $72, $ce, $21             // 4618: L.!.\r.!
.byt $84, $1c, $61, $08, $85, $8c, $42, $5c             // 4620: ..a...B\ 
    .byt $84, $39, $bb, $52, $8c, $9c, $21, $1b             // 4628: .9.R..!.
    .byt $57, $4c, $ce, $22, $84, $2c, $67, $38             // 4630: WL.".,g8
    .byt $8e, $44, $e8, $c8, $98, $83, $94, $11             // 4638: .D......
    .byt $a1, $09, $21, $9b, $4c, $4c, $36, $39             // 4640: ..!.LL69
    .byt $84, $1c, $61, $84, $86, $50, $43, $ca             // 4648: ..a..PC.
    .byt $30, $25, $e7, $2c, $a7, $09, $11, $1a             // 4650: 0%.,....
    .byt $52, $b2, $09, $26, $84, $2c, $a7, $9c             // 4658: R..&.,..
data_levelstrip_07:
    .byt $ff, $ff, $f0, $ff, $ff, $f9, $ff, $ff             // 4660: ........
    .byt $ff, $ff, $ff, $b7, $ff, $ff, $ff, $e5             // 4668: ........
    .byt $3b, $f2, $ff, $ff, $a2, $e1, $80, $8d             // 4670: ;.......
    .byt $31, $d9, $00, $03, $dc, $20, $0e, $8f             // 4678: 1.... ..
    .byt $87, $07, $c1, $84, $c0, $82, $93, $48             // 4680: .......H
    .byt $c1, $e0, $80, $8d, $31, $19, $18, $60             // 4688: ....1..`
    .byt $20, $21, $84, $14, $42, $08, $c6, $98             // 4690:  !..B...
    .byt $60, $82, $53, $08, $c1, $e0, $80, $1d             // 4698: `.S.....
    .byt $31, $d9, $00, $03, $2a, $19, $01, $63             // 46a0: 1...*..c
    .byt $8c, $47, $29, $98, $e0, $82, $53, $48             // 46a8: .G)...SH
    .byt $c1, $e0, $80, $49, $19, $19, $18, $60             // 46b0: ...I...`
    .byt $6a, $c1, $06, $8f, $42, $30, $c1, $b8             // 46b8: j...B0..
    .byt $60, $82, $47, $09, $c1, $e0, $80, $09             // 46c0: `.G.....
    .byt $63, $d9, $00, $03, $2a, $c1, $18, $13             // 46c8: c...*...
    .byt $4c, $46, $c1, $b8, $e0, $81, $47, $49             // 46d0: LF....GI
    .byt $c1, $e0, $80, $0b, $1b, $19, $18, $60             // 46d8: .......`
    .byt $6a, $c1, $a5, $94, $82, $09, $1e, $98             // 46e0: j.......
    .byt $e0, $82, $31, $76, $c1, $60, $81, $09             // 46e8: ..1v.`..
    .byt $2b, $d9, $00, $03, $ea, $c0, $64, $60             // 46f0: +.....d`
    .byt $5c, $c8, $18, $b8, $60, $42, $48, $19             // 46f8: \...`BH.
data_levelstrip_08:
    .byt $21, $84, $10, $0a, $33, $19, $63, $3c             // 4700: !...3.c<
    .byt $6a, $c1, $a3, $10, $82, $31, $29, $78             // 4708: j....1)x
    .byt $60, $8c, $31, $2e, $41, $7b, $bf, $07             // 4710: `.1.A{..
    .byt $33, $b9, $8c, $41, $6a, $c1, $04, $17             // 4718: 3..Aj...
    .byt $3c, $48, $19, $78, $0c, $42, $4a, $21             // 4720: <H.x.BJ!
    .byt $81, $7b, $ef, $77, $36, $99, $60, $8c             // 4728: .{.w6.`.
    .byt $eb, $c0, $64, $14, $82, $07, $26, $18             // 4730: ..d...&.
    .byt $63, $83, $0d, $36, $21, $b8, $c0, $7b             // 4738: c..6!..{
    .byt $3e, $b9, $90, $42, $ea, $c0, $18, $63             // 4740: >..B...c
    .byt $82, $0d, $c6, $f8, $61, $83, $0d, $36             // 4748: ....a..6
    .byt $7a, $0b, $bd, $85, $de, $19, $63, $3c             // 4750: z.....c<
    .byt $ea, $c0, $78, $14, $82, $0d, $26, $84             // 4758: ..x...&.
    .byt $60, $83, $0d, $36, $bc, $07, $de, $03             // 4760: `..6....
    .byt $ef, $b9, $90, $31, $2a, $c1, $63, $60             // 4768: ...1*.c`
    .byt $82, $0d, $2e, $98, $60, $83, $0d, $36             // 4770: ....`..6
    .byt $41, $84, $90, $85, $de, $79, $60, $8c             // 4778: A....y`.
    .byt $2b, $21, $05, $93, $82, $4d, $71, $98             // 4780: +!...Mq.
    .byt $60, $83, $0d, $36, $21, $64, $11, $02             // 4788: `..6!d..
    .byt $ef, $b9, $8c, $21, $2a, $c9, $a3, $64             // 4790: ...!*..d
    .byt $92, $f3, $28, $84, $60, $83, $0d, $36             // 4798: ..(.`..6
data_levelstrip_09:
    .byt $63, $e0, $84, $07, $21, $25, $42, $63             // 47a0: c...!%Bc
    .byt $8c, $31, $22, $84, $10, $82, $c0, $62             // 47a8: .1"....b
    .byt $0c, $53, $1c, $71, $64, $e0, $80, $07             // 47b0: .S.qd...
    .byt $26, $85, $56, $63, $8c, $31, $18, $63             // 47b8: &.Vc.1.c
    .byt $8c, $31, $c6, $63, $10, $e3, $b2, $23             // 47c0: .1.c...#
    .byt $86, $0c, $57, $0c, $1e, $11, $4f, $42             // 47c8: ..W...OB
    .byt $0a, $19, $05, $3b, $6c, $8c, $c3, $a6             // 47d0: ...;l...
    .byt $64, $52, $06, $19, $06, $63, $52, $46             // 47d8: dR...cRF
    .byt $29, $b4, $ba, $11, $ed, $c0, $83, $94             // 47e0: ).......
    .byt $10, $42, $c1, $85, $e4, $9c, $33, $19             // 47e8: .B....3.
    .byt $18, $63, $4c, $8a, $20, $12, $c3, $22             // 47f0: .cL. .."
    .byt $31, $c1, $18, $63, $1c, $5c, $c0, $a3             // 47f8: 1..c.\..
    .byt $90, $3c, $46, $31, $d8, $61, $5c, $ca             // 4800: .<F1.a\.
    .byt $20, $44, $4e, $f2, $e8, $c0, $c6, $84             // 4808:  DN.....
    .byt $e0, $48, $c0, $8d, $98, $9c, $8b, $1b             // 4810: .H......
    .byt $82, $10, $5c, $06, $1b, $23, $8f, $12             // 4818: ..\..#..
    .byt $31, $c1, $c6, $84, $40, $46, $c0, $d9             // 4820: 1...@F..
    .byt $8d, $60, $fc, $70, $21, $84, $60, $ca             // 4828: .`.p!.`.
    .byt $20, $a3, $94, $4c, $71, $c3, $c7, $14             // 4830:  ..Lq...
    .byt $37, $88, $c0, $62, $b8, $60, $7c, $39             // 4838: 7..b.`|9
data_levelstrip_0a:
    .byt $02, $1b, $4c, $dc, $c0, $a8, $98, $82             // 4840: ..L.....
    .byt $4b, $21, $64, $e0, $14, $82, $c1, $83             // 4848: K!d.....
    .byt $8c, $42, $0a, $16, $03, $3b, $8c, $0b             // 4850: .B...;..
    .byt $29, $98, $90, $82, $49, $19, $64, $e0             // 4858: )...I.d.
    .byt $10, $4c, $c0, $04, $63, $8c, $07, $2e             // 4860: .L..c...
    .byt $04, $97, $41, $02, $26, $64, $14, $32             // 4868: ..A.&d.2
    .byt $48, $19, $ae, $e0, $60, $42, $c0, $84             // 4870: H...`B..
    .byt $14, $82, $09, $2e, $04, $93, $82, $03             // 4878: ........
    .byt $76, $64, $b0, $32, $8c, $31, $c6, $60             // 4880: vd.2.1.`
    .byt $13, $42, $c0, $18, $63, $82, $09, $26             // 4888: .B..c..&
    .byt $03, $13, $8c, $03, $1e, $6e, $84, $10             // 4890: .....n..
    .byt $42, $08, $21, $84, $10, $42, $28, $a5             // 4898: B.!..B(.
    .byt $14, $e2, $06, $29, $64, $94, $42, $02             // 48a0: ...)d.B.
    .byt $26, $c5, $85, $10, $02, $c6, $d8, $38             // 48a8: &......8
    .byt $e2, $0c, $c6, $98, $90, $82, $1b, $1e             // 48b0: ........
    .byt $03, $3b, $4c, $30, $26, $84, $b8, $10             // 48b8: .;L0&...
    .byt $02, $16, $38, $bb, $e2, $0c, $36, $8e             // 48c0: ..8...6.
    .byt $e0, $82, $0d, $1e, $63, $90, $42, $f0             // 48c8: ....c.B.
    .byt $19, $a4, $8c, $10, $0c, $16, $38, $38             // 48d0: ......88
    .byt $e2, $04, $36, $86, $60, $82, $0d, $36             // 48d8: ..6.`..6
data_levelstrip_0b:
    .byt $de, $7b, $ef, $bd, $f7, $de, $7b, $ef             // 48e0: .{....{.
    .byt $bd, $f7, $de, $7b, $ef, $bd, $f7, $de             // 48e8: ...{....
    .byt $7b, $ef, $bd, $f7, $83, $18, $42, $ca             // 48f0: {.....B.
    .byt $70, $86, $b9, $e0, $02, $71, $a1, $64             // 48f8: p....q.d
    .byt $93, $47, $31, $c4, $39, $e7, $9c, $73             // 4900: .G1.9..s
    .byt $c3, $0c, $33, $48, $21, $ce, $0f, $92             // 4908: ..3H!...
    .byt $03, $71, $a4, $64, $92, $0b, $f1, $a5             // 4910: .q.d....
    .byt $90, $51, $c8, $28, $86, $a4, $62, $0a             // 4918: .Q.(..b.
    .byt $19, $c4, $e7, $1c, $5c, $21, $83, $94             // 4920: ....\!..
    .byt $91, $89, $f3, $85, $8c, $52, $c8, $10             // 4928: .....R..
    .byt $c3, $10, $53, $c6, $20, $c5, $8f, $51             // 4930: ..S. ..Q
    .byt $48, $c9, $a4, $e4, $9c, $dd, $f0, $39             // 4938: H......9
    .byt $e7, $5c, $48, $19, $a5, $18, $42, $46             // 4940: .\H...BF
    .byt $11, $c5, $8f, $91, $73, $ce, $39, $67             // 4948: ....s.9g
    .byt $52, $c8, $f0, $a6, $b8, $53, $c8, $28             // 4950: R....S.(
    .byt $a5, $94, $52, $4a, $29, $c5, $17, $32             // 4958: ..RJ)..2
    .byt $c8, $28, $24, $87, $3c, $4a, $f6, $8e             // 4960: .($.<J..
    .byt $8c, $4c, $b2, $33, $a5, $94, $22, $8a             // 4968: .L.3..".
    .byt $28, $85, $39, $32, $4a, $21, $39, $17             // 4970: (.92J!9.
    .byt $92, $4b, $f6, $a4, $e4, $51, $f4, $36             // 4978: .K...Q.6
data_levelstrip_0c:
    .byt $a5, $94, $52, $4a, $29, $c5, $93, $61             // 4980: ..RJ)..a
    .byt $72, $2e, $23, $17, $62, $46, $f6, $23             // 4988: r.#.bF.#
    .byt $97, $a1, $89, $37, $b9, $94, $22, $8a             // 4990: ...7..".
    .byt $28, $c5, $e7, $9c, $73, $26, $d9, $e4             // 4998: (...s&..
    .byt $94, $47, $f6, $a4, $0c, $5d, $4a, $37             // 49a0: .G...]J7
    .byt $a2, $e4, $52, $4a, $29, $c5, $93, $51             // 49a8: ..RJ)..Q
    .byt $48, $26, $f9, $8d, $4c, $4a, $f6, $64             // 49b0: H&..LJ.d
    .byt $14, $46, $ba, $31, $9e, $79, $a6, $bd             // 49b8: .F.1.y..
    .byt $f7, $de, $97, $41, $4a, $2e, $64, $14             // 49c0: ...AJ.d.
    .byt $32, $b2, $69, $a3, $10, $d6, $43, $08             // 49c8: 2.i...C.
    .byt $c4, $11, $c7, $7b, $0a, $bc, $93, $32             // 49d0: ...{...2
    .byt $48, $08, $21, $84, $90, $8d, $f1, $c6             // 49d8: H.!.....
.byt $e4, $ec, $43, $ca, $83, $94, $12, $5c             // 49e0: ..C....\ 
    .byt $08, $c1, $64, $e3, $f4, $0e, $21, $84             // 49e8: ..d...!.
    .byt $6c, $8c, $f1, $ce, $64, $e7, $43, $30             // 49f0: l...d.C0
    .byt $a5, $e8, $1d, $fc, $0e, $c9, $18, $a3             // 49f8: ........
    .byt $bd, $df, $21, $64, $63, $8c, $f1, $db             // 4a00: ..!dc...
    .byt $18, $63, $52, $68, $de, $7b, $ef, $bd             // 4a08: .cRh.{..
    .byt $f7, $de, $7b, $ef, $bd, $f7, $de, $7b             // 4a10: ..{....{
    .byt $ef, $bd, $f7, $de, $7b, $ef, $bd, $f7             // 4a18: ....{...
data_levelstrip_0d:
    .byt $21, $65, $ef, $bd, $f7, $c5, $7b, $ef             // 4a20: !e....{.
    .byt $bd, $f7, $de, $7b, $ef, $bc, $f7, $de             // 4a28: ...{....
    .byt $7b, $ef, $bd, $2f, $21, $e4, $10, $82             // 4a30: {../!...
    .byt $2b, $25, $3b, $63, $72, $29, $ae, $94             // 4a38: +%;cr)..
    .byt $52, $32, $00, $00, $00, $00, $00, $2e             // 4a40: R2......
    .byt $21, $e4, $52, $5c, $c9, $b9, $94, $60             // 4a48: !.R\...`
    .byt $b2, $29, $c5, $15, $53, $32, $00, $00             // 4a50: .)..S2..
    .byt $00, $00, $00, $2e, $22, $e4, $e0, $4a             // 4a58: ...."..J
    .byt $c9, $85, $e5, $9c, $9d, $29, $a5, $b8             // 4a60: .....)..
    .byt $52, $32, $00, $00, $00, $00, $1e, $2e             // 4a68: R2......
    .byt $21, $64, $57, $72, $2e, $25, $97, $52             // 4a70: !dWr.%.R
    .byt $8a, $0b, $26, $67, $93, $33, $00, $00             // 4a78: ..&g.3..
    .byt $00, $50, $0a, $2e, $21, $e5, $12, $82             // 4a80: .P..!...
    .byt $0b, $21, $97, $9c, $43, $ce, $b9, $94             // 4a88: .!..C...
    .byt $9c, $43, $08, $21, $84, $1c, $82, $2b             // 4a90: .C.!...+
    .byt $21, $e4, $62, $42, $c9, $b9, $94, $1c             // 4a98: !.bB....
    .byt $42, $66, $a6, $88, $92, $43, $08, $21             // 4aa0: Bf...C.!
    .byt $84, $9c, $33, $2c, $21, $e4, $9c, $5d             // 4aa8: ..3,!..]
    .byt $29, $b9, $e4, $1c, $72, $ce, $b9, $94             // 4ab0: )...r...
    .byt $92, $73, $29, $c5, $85, $10, $4c, $2d             // 4ab8: .s)...L-
data_levelstrip_0e:
    .byt $21, $e4, $5c, $4a, $31, $b9, $e4, $10             // 4ac0: !.\J1...
    .byt $72, $31, $b9, $98, $52, $72, $2e, $25             // 4ac8: r1..Rr.%
    .byt $5a, $6b, $ed, $2c, $21, $e4, $52, $4a             // 4ad0: Zk.,!.RJ
    .byt $31, $ac, $e4, $90, $73, $c9, $b9, $94             // 4ad8: 1...s...
    .byt $52, $72, $2e, $11, $bb, $10, $4a, $29             // 4ae0: Rr....J)
    .byt $21, $e5, $9c, $73, $ce, $39, $e4, $10             // 4ae8: !..s.9..
    .byt $82, $0b, $21, $84, $52, $72, $66, $14             // 4af0: ..!.Rrf.
    .byt $b7, $90, $4b, $29, $21, $e4, $52, $4a             // 4af8: ..K)!.RJ
    .byt $29, $2e, $04, $ed, $77, $2e, $26, $87             // 4b00: )...w.&.
    .byt $92, $73, $29, $12, $63, $93, $4b, $29             // 4b08: .s).c.K)
    .byt $29, $e4, $c2, $4a, $29, $25, $04, $2f             // 4b10: )..J)%./
    .byt $b8, $f7, $3b, $87, $9c, $73, $29, $d9             // 4b18: ..;..s).
    .byt $c9, $7b, $ef, $bd, $21, $e4, $53, $4a             // 4b20: .{..!.SJ
    .byt $09, $21, $04, $2f, $82, $0b, $3e, $87             // 4b28: .!./..>.
    .byt $5c, $4a, $29, $d9, $94, $52, $4a, $29             // 4b30: \J)..RJ)
    .byt $21, $e4, $10, $42, $08, $39, $07, $ef             // 4b38: !..B.9..
    .byt $b7, $d0, $7e, $87, $9c, $73, $36, $d9             // 4b40: ..~..s6.
    .byt $94, $52, $b2, $c9, $21, $e5, $9c, $73             // 4b48: .R..!..s
    .byt $ce, $39, $04, $2f, $42, $08, $c1, $87             // 4b50: .9./B...
    .byt $10, $72, $36, $d9, $e4, $52, $0c, $03             // 4b58: .r6..R..
data_levelstrip_0f:
    .byt $21, $84, $4c, $4a, $76, $24, $04, $ee             // 4b60: !.LJv$..
    .byt $bd, $0f, $dc, $fb, $1d, $72, $36, $d9             // 4b68: .....r6.
    .byt $e4, $42, $32, $00, $29, $84, $5c, $48             // 4b70: .B2.).\H
    .byt $26, $25, $84, $10, $bc, $08, $c1, $05             // 4b78: &%......
    .byt $1f, $42, $36, $c6, $64, $e7, $48, $21             // 4b80: .B6.d.H!
    .byt $21, $84, $4c, $4a, $2e, $39, $84, $10             // 4b88: !.LJ.9..
    .byt $b8, $f7, $5b, $68, $bf, $43, $36, $ce             // 4b90: ..[h.C6.
    .byt $b8, $42, $0a, $29, $21, $84, $5c, $48             // 4b98: .B.)!.\H
    .byt $26, $39, $04, $11, $82, $17, $21, $84             // 4ba0: &9....!.
    .byt $e0, $43, $ce, $c5, $15, $52, $48, $21             // 4ba8: .C...RH!
    .byt $21, $e5, $cc, $ca, $2b, $39, $84, $10             // 4bb0: !...+9..
    .byt $02, $f7, $de, $07, $ee, $fd, $ce, $a1             // 4bb8: ........
    .byt $84, $10, $42, $08, $21, $64, $17, $5a             // 4bc0: ..B.!d.Z
    .byt $21, $25, $84, $10, $42, $08, $5e, $84             // 4bc8: !%..B.^.
    .byt $e0, $82, $cf, $21, $04, $16, $42, $08             // 4bd0: ...!..B.
    .byt $29, $e4, $16, $32, $29, $24, $88, $10             // 4bd8: )..2)$..
    .byt $42, $08, $dc, $fb, $2d, $b4, $cf, $21             // 4be0: B...-..!
    .byt $84, $10, $42, $08, $21, $e4, $6c, $72             // 4be8: ..B.!.lr
    .byt $21, $25, $84, $10, $42, $08, $c1, $8b             // 4bf0: !%..B...
    .byt $10, $82, $c8, $21, $84, $10, $42, $08             // 4bf8: ...!..B.
data_levelstrip_10:
    .byt $00, $00, $00, $00, $00, $00, $00, $00             // 4c00: ........
    .byt $00, $c0, $00, $00, $00, $00, $00, $00             // 4c08: ........
    .byt $00, $00, $00, $00, $00, $03, $8c, $31             // 4c10: .......1
    .byt $c6, $06, $63, $8c, $31, $00, $00, $63             // 4c18: ..c.1..c
    .byt $80, $31, $c6, $18, $60, $80, $31, $c6             // 4c20: .1..`.1.
    .byt $00, $03, $00, $00, $c0, $18, $03, $0c             // 4c28: ........
    .byt $30, $c0, $00, $60, $00, $00, $00, $18             // 4c30: 0..`....
    .byt $60, $80, $01, $00, $00, $03, $0c, $30             // 4c38: `......0
    .byt $00, $00, $00, $0c, $30, $c0, $18, $63             // 4c40: ....0..c
    .byt $8c, $31, $c6, $18, $60, $8c, $01, $06             // 4c48: .1..`...
    .byt $00, $03, $0c, $30, $c6, $18, $63, $0c             // 4c50: ...0..c.
    .byt $30, $c0, $18, $00, $00, $00, $c0, $00             // 4c58: 0.......
    .byt $00, $00, $00, $3e, $00, $03, $0c, $00             // 4c60: ...>....
    .byt $c0, $00, $00, $00, $00, $00, $18, $63             // 4c68: .......c
    .byt $80, $31, $c0, $18, $63, $8c, $31, $c6             // 4c70: .1..c.1.
    .byt $00, $03, $8c, $31, $00, $00, $63, $8c             // 4c78: ...1..c.
    .byt $31, $06, $00, $60, $00, $30, $00, $00             // 4c80: 1..`.0..
    .byt $83, $06, $00, $00, $00, $37, $0c, $30             // 4c88: .....7.0
    .byt $c6, $18, $63, $00, $00, $c6, $18, $63             // 4c90: ..c....c
    .byt $0c, $30, $c6, $00, $00, $8c, $01, $c6             // 4c98: .0......
data_levelstrip_11:
    .byt $00, $03, $00, $00, $06, $00, $60, $8c             // 4ca0: ......`.
    .byt $01, $06, $00, $00, $00, $00, $c0, $18             // 4ca8: ........
    .byt $63, $0c, $00, $36, $00, $63, $8c, $31             // 4cb0: c..6.c.1
    .byt $06, $18, $60, $80, $01, $06, $18, $63             // 4cb8: ..`....c
    .byt $8c, $31, $c6, $18, $00, $0c, $30, $06             // 4cc0: .1....0.
    .byt $00, $00, $00, $00, $00, $18, $00, $80             // 4cc8: ........
    .byt $01, $06, $00, $00, $00, $00, $00, $18             // 4cd0: ........
    .byt $03, $00, $00, $06, $00, $63, $8c, $31             // 4cd8: .....c.1
    .byt $c6, $18, $60, $8c, $01, $06, $18, $63             // 4ce0: ..`....c
    .byt $8c, $31, $06, $18, $63, $8c, $01, $00             // 4ce8: .1..c...
    .byt $00, $60, $00, $00, $00, $18, $00, $00             // 4cf0: .`......
    .byt $00, $02, $21, $04, $1c, $42, $08, $38             // 4cf8: ..!..B.8
    .byt $84, $80, $31, $c6, $18, $60, $80, $31             // 4d00: ..1..`.1
    .byt $06, $18, $63, $8c, $31, $c6, $01, $07             // 4d08: ..c.1...
    .byt $1c, $4c, $c0, $38, $e0, $80, $45, $08             // 4d10: .L.8..E.
    .byt $38, $84, $10, $02, $06, $38, $60, $1c             // 4d18: 8....8`.
    .byt $4c, $c0, $01, $07, $8c, $71, $c3, $38             // 4d20: L....q.8
    .byt $e0, $80, $31, $0e, $d8, $60, $83, $0d             // 4d28: ..1..`..
    .byt $36, $c1, $04, $13, $70, $30, $01, $07             // 4d30: 6...p0..
    .byt $13, $70, $30, $c1, $e0, $10, $42, $08             // 4d38: .p0...B.
data_levelstrip_12:
    .byt $ff, $ff, $5f, $fe, $ff, $ff, $ff, $ff             // 4d40: .._.....
    .byt $cb, $ff, $bf, $fc, $ff, $ff, $ff, $ff             // 4d48: ........
    .byt $ff, $f2, $ff, $ff, $83, $94, $31, $08             // 4d50: ......1.
    .byt $76, $64, $14, $32, $88, $29, $98, $b8             // 4d58: vd.2.)..
    .byt $10, $42, $30, $01, $97, $91, $46, $21             // 4d60: .B0...F!
    .byt $05, $63, $8c, $09, $1e, $a4, $10, $57             // 4d68: .c.....W
    .byt $06, $21, $78, $e8, $1d, $42, $08, $01             // 4d70: .!x..B..
    .byt $63, $8c, $31, $26, $04, $1b, $e3, $06             // 4d78: c.1&....
    .byt $26, $91, $14, $8c, $31, $c6, $98, $70             // 4d80: &...1..p
    .byt $6f, $f4, $26, $03, $07, $13, $02, $26             // 4d88: o.&....&
    .byt $03, $1b, $bd, $09, $26, $92, $94, $31             // 4d90: ....&..1
    .byt $48, $71, $b8, $0c, $ee, $7d, $1f, $04             // 4d98: Hq...}..
    .byt $07, $17, $82, $21, $04, $1b, $ef, $07             // 4da0: ...!....
    .byt $26, $82, $0c, $56, $c6, $70, $98, $14             // 4da8: &..V.p..
    .byt $c2, $bb, $23, $05, $3b, $ed, $09, $2e             // 4db0: ..#.;...
    .byt $05, $1b, $ef, $09, $2e, $83, $90, $51             // 4db8: .......Q
    .byt $72, $29, $83, $e4, $52, $06, $09, $06             // 4dc0: r)..R...
    .byt $3b, $ee, $09, $2e, $09, $1b, $de, $0b             // 4dc8: ;.......
    .byt $c6, $18, $63, $8c, $31, $c6, $18, $63             // 4dd0: ..c.1..c
    .byt $8c, $31, $c6, $18, $3b, $42, $0a, $1e             // 4dd8: .1..;B..
data_levelstrip_13:
    .byt $a3, $85, $10, $02, $26, $c5, $15, $32             // 4de0: ....&..2
    .byt $48, $19, $03, $63, $82, $31, $c1, $05             // 4de8: H..c.1..
    .byt $43, $57, $06, $2e, $03, $df, $7b, $31             // 4df0: CW....{1
    .byt $26, $98, $38, $32, $8a, $29, $c1, $b1             // 4df8: &.82.)..
    .byt $e0, $58, $70, $05, $93, $e2, $06, $2e             // 4e00: .Xp.....
    .byt $a3, $9a, $4c, $24, $26, $b8, $b8, $32             // 4e08: ..L$&..2
    .byt $08, $29, $01, $e3, $80, $71, $c0, $85             // 4e10: .)...q..
    .byt $8c, $42, $0a, $1e, $63, $be, $41, $1c             // 4e18: .B..c.A.
    .byt $2d, $b8, $14, $52, $f0, $bd, $18, $63             // 4e20: -..R...c
    .byt $8c, $31, $c6, $18, $63, $8c, $31, $26             // 4e28: .1..c.1&
    .byt $c5, $14, $42, $06, $25, $f8, $de, $7b             // 4e30: ..B.%..{
    .byt $e7, $20, $12, $63, $9c, $42, $08, $21             // 4e38: . .c.B.!
    .byt $84, $d0, $98, $21, $03, $92, $e2, $0b             // 4e40: ...!....
    .byt $2d, $d5, $98, $c2, $48, $31, $43, $62             // 4e48: -...H1Cb
    .byt $1c, $4c, $30, $21, $84, $d0, $5a, $2c             // 4e50: .L0!..Z,
    .byt $a3, $0e, $e2, $0d, $3d, $d5, $64, $92             // 4e58: ....=.d.
    .byt $07, $19, $65, $50, $6c, $82, $09, $26             // 4e60: ..ePl..&
    .byt $04, $13, $02, $1d, $03, $c3, $32, $08             // 4e68: ......2.
    .byt $c5, $93, $8c, $91, $0b, $21, $a3, $48             // 4e70: .....!.H
    .byt $1c, $42, $08, $c1, $04, $13, $02, $4d             // 4e78: .B.....M
data_levelstrip_14:
    .byt $04, $5f, $6b, $2d, $9e, $26, $bb, $92             // 4e80: ._k-.&..
    .byt $f3, $70, $8e, $38, $1a, $5c, $08, $21             // 4e88: .p.8.\.!
    .byt $98, $10, $02, $2d, $a3, $12, $39, $e5             // 4e90: ...-..9.
    .byt $74, $21, $93, $91, $83, $2b, $64, $44             // 4e98: t!...+dD
    .byt $4c, $5c, $29, $84, $0c, $52, $06, $2d             // 4ea0: L\)..R.-
    .byt $c5, $14, $17, $18, $19, $21, $13, $ed             // 4ea8: .....!..
    .byt $f7, $28, $21, $50, $32, $5c, $21, $83             // 4eb0: .(!P2\!.
    .byt $8c, $32, $08, $1d, $a3, $0e, $12, $61             // 4eb8: .2.....a
    .byt $c8, $21, $98, $1c, $88, $0b, $64, $50             // 4ec0: .!....dP
    .byt $52, $5c, $21, $a3, $90, $52, $06, $25             // 4ec8: R\!..R.%
    .byt $a3, $16, $43, $6b, $c8, $21, $e4, $1c             // 4ed0: ..Ck.!..
    .byt $42, $ce, $84, $50, $42, $72, $21, $83             // 4ed8: B..PBr!.
    .byt $14, $52, $06, $1d, $04, $5b, $8b, $67             // 4ee0: .R...[.g
    .byt $c8, $21, $e4, $e0, $42, $08, $21, $62             // 4ee8: .!..B.!b
    .byt $1c, $42, $70, $21, $44, $6b, $2d, $2e             // 4ef0: .Bp!Dk-.
    .byt $04, $df, $3b, $43, $c8, $21, $e7, $40             // 4ef8: ..;C.!.@
    .byt $5c, $88, $16, $63, $1c, $44, $60, $21             // 4f00: \..c.D`!
    .byt $50, $12, $82, $23, $a4, $86, $10, $82             // 4f08: P..#....
    .byt $c9, $26, $87, $10, $8a, $a3, $8e, $0c             // 4f10: .&......
    .byt $1c, $42, $08, $21, $50, $92, $0b, $2e             // 4f18: .B.!P...
data_levelstrip_15:
    .byt $a4, $86, $60, $42, $ce, $39, $9b, $60             // 4f20: ..`B.9.`
    .byt $02, $a1, $a4, $8c, $17, $42, $08, $21             // 4f28: .....B.!
    .byt $d0, $c1, $0a, $1e, $a4, $9a, $10, $42             // 4f30: .......B
    .byt $08, $39, $87, $1c, $4c, $c4, $04, $e3             // 4f38: .9..L...
    .byt $12, $b4, $df, $39, $53, $52, $06, $26             // 4f40: ...9SR.&
    .byt $a9, $06, $13, $4c, $08, $39, $9b, $60             // 4f48: ...L.9.`
    .byt $32, $c5, $03, $17, $92, $b9, $2b, $83             // 4f50: 2.....+.
    .byt $d0, $7b, $2f, $26, $a4, $86, $10, $42             // 4f58: .{/&...B
    .byt $30, $21, $87, $10, $22, $c6, $04, $93             // 4f60: 0!.."...
    .byt $32, $86, $0b, $21, $d0, $31, $08, $2d             // 4f68: 2..!.1.-
    .byt $a5, $06, $13, $42, $08, $21, $9b, $10             // 4f70: ...B.!..
    .byt $a8, $31, $65, $10, $ed, $37, $71, $d9             // 4f78: .1e..7q.
    .byt $50, $42, $86, $2c, $a4, $86, $10, $a2             // 4f80: PB.,....
    .byt $81, $a1, $85, $10, $9d, $31, $24, $1b             // 4f88: .....1$.
    .byt $ef, $3d, $71, $61, $d0, $42, $ca, $28             // 4f90: .=qa.B.(
    .byt $05, $5b, $6b, $b1, $c5, $d6, $5a, $3b             // 4f98: .[k...Z;
    .byt $08, $c6, $2d, $5a, $6b, $ad, $b5, $d6             // 4fa0: ..-Zk...
    .byt $62, $6b, $2d, $24, $a5, $90, $41, $46             // 4fa8: bk-$..AF
    .byt $21, $23, $11, $32, $0a, $31, $86, $90             // 4fb0: !#.2.1..
    .byt $51, $c8, $20, $29, $11, $32, $0a, $19             // 4fb8: Q. ).2..
data_levelstrip_16:
    .byt $6f, $e4, $41, $4a, $76, $a3, $64, $52             // 4fc0: o.AJv.dR
    .byt $5c, $2e, $65, $64, $47, $46, $26, $c4             // 4fc8: \.edGF&.
    .byt $65, $32, $4a, $7e, $81, $8c, $92, $c7             // 4fd0: e2J~....
    .byt $20, $b9, $90, $91, $49, $29, $99, $0c             // 4fd8:  ...I)..
    .byt $92, $09, $29, $99, $0c, $92, $0b, $09             // 4fe0: ..).....
    .byt $61, $e4, $31, $48, $2e, $83, $e4, $42             // 4fe8: a.1H...B
    .byt $46, $26, $65, $64, $42, $4a, $26, $64             // 4ff0: F&edBJ&d
    .byt $e4, $42, $46, $0e, $a1, $e4, $dc, $72             // 4ff8: .BF....r
    .byt $26, $79, $14, $92, $09, $21, $b9, $14             // 5000: &y...!..
    .byt $92, $47, $21, $79, $90, $91, $49, $09             // 5008: .G!y..I.
    .byt $61, $e4, $3c, $48, $2e, $a4, $e4, $52             // 5010: a.<H...R
    .byt $48, $1e, $a4, $64, $32, $4a, $2e, $a4             // 5018: H..d2J..
    .byt $64, $32, $48, $0e, $21, $67, $32, $48             // 5020: d2H.!g2H
    .byt $26, $b9, $90, $92, $09, $19, $99, $94             // 5028: &.......
    .byt $92, $c9, $28, $b9, $90, $91, $49, $09             // 5030: ..(...I.
    .byt $21, $a7, $61, $4a, $2e, $65, $64, $42             // 5038: !.aJ.edB
    .byt $4a, $1e, $83, $64, $21, $48, $26, $a3             // 5040: J..d!H&.
    .byt $e4, $31, $4a, $0e, $21, $e7, $9c, $73             // 5048: .1J.!..s
    .byt $2e, $a4, $e4, $9c, $73, $26, $79, $90             // 5050: ....s&y.
    .byt $92, $0b, $21, $b9, $90, $92, $49, $09             // 5058: ..!...I.
data_levelstrip_17:
    .byt $39, $e7, $90, $72, $ce, $c3, $85, $52             // 5060: 9..r...R
    .byt $4a, $26, $65, $e4, $42, $46, $2e, $85             // 5068: J&e.BF..
    .byt $e4, $31, $48, $0e, $29, $a4, $14, $52             // 5070: .1H.)..R
    .byt $c8, $39, $87, $c2, $48, $26, $99, $90             // 5078: .9..H&..
    .byt $92, $49, $19, $b9, $90, $91, $49, $09             // 5080: .I....I.
    .byt $39, $bb, $9c, $73, $ce, $26, $e7, $7c             // 5088: 9..s.&.|
    .byt $48, $26, $65, $e4, $31, $48, $2e, $a4             // 5090: H&e.1H..
    .byt $e4, $42, $46, $0e, $64, $14, $52, $06             // 5098: .BF.d.R.
    .byt $31, $c6, $94, $9c, $73, $26, $79, $0c             // 50a0: 1...s&y.
    .byt $92, $0b, $19, $99, $94, $92, $09, $09             // 50a8: ........
    .byt $39, $87, $9c, $49, $36, $d9, $0c, $52             // 50b0: 9..I6..R
    .byt $72, $ce, $85, $e4, $41, $46, $1e, $a3             // 50b8: r...AF..
    .byt $e4, $42, $5c, $0e, $26, $07, $93, $09             // 50c0: .B\.&...
    .byt $31, $c6, $94, $41, $4a, $c9, $39, $93             // 50c8: 1..AJ.9.
    .byt $92, $49, $19, $99, $90, $32, $f4, $d6             // 50d0: .I...2..
    .byt $26, $07, $93, $49, $36, $39, $0f, $42             // 50d8: &..I69.B
    .byt $1c, $29, $25, $e7, $9c, $73, $ce, $39             // 50e0: .)%..s.9
    .byt $e7, $56, $78, $e7, $26, $07, $93, $49             // 50e8: .Vx.&..I
    .byt $36, $39, $90, $32, $06, $c9, $83, $94             // 50f0: 69.2....
    .byt $9c, $b3, $21, $64, $0c, $32, $9c, $0b             // 50f8: ..!d.2..
data_levelstrip_18:
    .byt $26, $87, $9c, $49, $36, $39, $10, $57             // 5100: &..I69.W
    .byt $08, $c9, $84, $b8, $90, $72, $ce, $64             // 5108: .....r.d
    .byt $90, $51, $b4, $d0, $21, $84, $90, $49             // 5110: .Q..!..I
    .byt $36, $2e, $b8, $e2, $06, $c9, $6c, $90             // 5118: 6.....l.
    .byt $9c, $33, $c9, $39, $97, $6c, $7c, $e0             // 5120: .3.9.l|.
    .byt $39, $67, $92, $4b, $36, $39, $90, $51             // 5128: 9g.K69.Q
    .byt $48, $c9, $63, $90, $e1, $98, $21, $25             // 5130: H.c...!%
    .byt $e7, $9c, $7b, $c8, $a5, $90, $92, $47             // 5138: ..{....G
    .byt $ce, $d9, $e4, $9c, $73, $ce, $83, $90             // 5140: ....s...
    .byt $51, $32, $21, $85, $64, $52, $4a, $c8             // 5148: Q2!.dRJ.
    .byt $c5, $18, $92, $07, $21, $39, $e7, $42             // 5150: ....!9.B
    .byt $0a, $29, $a5, $90, $61, $98, $2b, $24             // 5158: .)..a.+$
    .byt $67, $42, $32, $c9, $c3, $18, $92, $1d             // 5160: gB2.....
    .byt $21, $65, $90, $42, $c6, $20, $8c, $b0             // 5168: !e.B. ..
    .byt $32, $f2, $20, $a6, $10, $97, $b3, $c9             // 5170: 2. .....
    .byt $84, $94, $c1, $5c, $29, $64, $14, $32             // 5178: ...\)d.2
    .byt $0a, $19, $83, $14, $42, $32, $21, $25             // 5180: ....B2!%
    .byt $13, $62, $b2, $c8, $bc, $f3, $ce, $3b             // 5188: .b.....;
    .byt $ef, $bc, $f3, $ce, $3b, $ef, $bc, $f3             // 5190: ....;...
    .byt $ce, $3b, $ef, $bc, $f3, $ce, $3b, $ef             // 5198: .;....;.
data_levelstrip_19:
    .byt $c6, $fc, $ff, $ff, $ff, $ff, $ff, $4c             // 51a0: .......L
    .byt $8a, $cb, $a5, $90, $51, $48, $21, $63             // 51a8: ....QH!c
    .byt $14, $92, $72, $ce, $c6, $64, $42, $ca             // 51b0: ..r..dB.
    .byt $20, $83, $14, $32, $88, $cb, $a4, $e4             // 51b8:  ..2....
    .byt $4c, $ca, $20, $85, $88, $92, $47, $21             // 51c0: L. ...G!
    .byt $c6, $e4, $52, $c8, $28, $82, $8c, $ec             // 51c8: ..R.(...
    .byt $48, $c9, $25, $9f, $42, $32, $29, $a6             // 51d0: H.%.B2).
.byt $90, $4c, $48, $31, $c6, $e4, $32, $5c             // 51d8: .LH1..2\ 
    .byt $29, $83, $8c, $ec, $06, $19, $99, $e4             // 51e0: ).......
    .byt $92, $49, $21, $83, $e4, $52, $08, $19             // 51e8: .I!..R..
    .byt $c6, $e4, $41, $5c, $21, $a5, $90, $6c             // 51f0: ..A\!..l
    .byt $8c, $c9, $a4, $90, $3c, $48, $21, $23             // 51f8: ....<H!#
    .byt $13, $52, $06, $19, $c6, $64, $52, $dc             // 5200: .R...dR.
    .byt $18, $64, $94, $9c, $73, $ce, $b9, $b8             // 5208: .d..s...
    .byt $40, $0a, $29, $d9, $10, $52, $86, $29             // 5210: @.)..R.)
.byt $c6, $64, $32, $5c, $21, $45, $8c, $5c             // 5218: .d2\!E.\ 
    .byt $5c, $71, $99, $e4, $30, $c8, $c8, $86             // 5220: \q..0...
.byt $b9, $52, $c8, $28, $c6, $64, $32, $5c             // 5228: .R.(.d2\ 
    .byt $29, $83, $94, $4c, $88, $1b, $b9, $e4             // 5230: )..L....
    .byt $e0, $48, $ce, $39, $e7, $9c, $73, $2e             // 5238: .H.9..s.
data_levelstrip_1a:
    .byt $c6, $64, $92, $59, $26, $a3, $90, $ec             // 5240: .d.Y&...
    .byt $dc, $20, $99, $04, $e7, $32, $21, $b9             // 5248: . ...2!.
    .byt $0c, $62, $4a, $19, $c6, $e4, $51, $72             // 5250: .bJ...Qr
    .byt $19, $84, $94, $4c, $48, $21, $99, $04             // 5258: ...LH!..
    .byt $93, $47, $29, $85, $8c, $42, $46, $21             // 5260: .G)..BF!
    .byt $c6, $e4, $32, $48, $21, $82, $90, $9c             // 5268: ..2H!...
    .byt $4b, $ce, $b9, $90, $5c, $48, $21, $85             // 5270: K...\H!.
    .byt $14, $52, $48, $19, $c6, $94, $42, $c8             // 5278: .RH...B.
    .byt $18, $64, $b0, $3c, $46, $29, $84, $e4             // 5280: .d.<F)..
    .byt $31, $c8, $20, $85, $0c, $32, $ca, $20             // 5288: 1. ..2. 
    .byt $39, $e7, $9c, $73, $ce, $39, $e7, $3c             // 5290: 9..s.9.<
    .byt $f4, $1e, $23, $17, $52, $48, $21, $39             // 5298: ..#.RH!9
    .byt $e7, $9c, $b3, $33, $a6, $90, $41, $46             // 52a0: ...3..AF
    .byt $21, $2c, $84, $9c, $49, $19, $d9, $b9             // 52a8: !,..I...
    .byt $52, $c8, $28, $39, $84, $90, $c2, $36             // 52b0: R.(9...6
    .byt $39, $e7, $9c, $73, $26, $39, $a8, $9c             // 52b8: 9..s&9..
    .byt $49, $c9, $84, $98, $92, $49, $19, $d9             // 52c0: I....I..
    .byt $85, $10, $82, $37, $83, $14, $27, $72             // 52c8: ...7..'r
    .byt $2e, $39, $e7, $4c, $4a, $ce, $39, $e7             // 52d0: .9.LJ.9.
    .byt $9c, $47, $26, $c5, $14, $12, $42, $37             // 52d8: .G&...B7
data_levelstrip_1b:
    .byt $21, $38, $52, $72, $1e, $99, $14, $32             // 52e0: !8Rr...2
    .byt $f2, $20, $85, $8c, $42, $4a, $ce, $39             // 52e8: . ..BJ.9
    .byt $e7, $1c, $42, $08, $21, $e7, $9c, $73             // 52f0: ..B.!..s
    .byt $26, $a4, $94, $91, $09, $29, $2c, $e7             // 52f8: &....),.
    .byt $9c, $4b, $19, $a4, $90, $9c, $42, $48             // 5300: .K....BH
    .byt $21, $84, $32, $08, $71, $81, $94, $4c             // 5308: !.2.q..L
    .byt $48, $19, $39, $87, $90, $73, $ce, $39             // 5310: H.9..s.9
    .byt $93, $9c, $73, $0e, $2e, $04, $42, $4a             // 5318: ..s...BJ
    .byt $26, $a1, $e4, $41, $0a, $21, $39, $e7             // 5320: &..A.!9.
    .byt $90, $43, $48, $21, $93, $42, $48, $ce             // 5328: .CH!.BH.
    .byt $2c, $84, $31, $48, $2e, $a1, $94, $41             // 5330: ,.1H...A
    .byt $c8, $28, $39, $e4, $10, $42, $08, $39             // 5338: .(9..B.9
    .byt $e7, $9c, $49, $21, $39, $04, $42, $4a             // 5340: ..I!9.BJ
    .byt $26, $86, $8c, $42, $18, $29, $39, $85             // 5348: &..B.)9.
    .byt $90, $43, $ce, $39, $84, $90, $49, $19             // 5350: .C.9..I.
    .byt $d9, $64, $32, $4a, $ce, $39, $e7, $9c             // 5358: .d2J.9..
    .byt $73, $ce, $39, $84, $90, $43, $0a, $21             // 5360: s.9..C.!
    .byt $e4, $90, $49, $19, $d9, $e4, $42, $46             // 5368: ..I...BF
    .byt $08, $21, $84, $10, $52, $63, $39, $84             // 5370: .!..Rc9.
    .byt $90, $43, $08, $39, $84, $d0, $48, $19             // 5378: .C.9..H.
data_levelstrip_1c:
    .byt $2f, $93, $4c, $d2, $30, $a4, $8c, $e6             // 5380: /.L.0...
    .byt $4c, $19, $a8, $10, $82, $c8, $20, $a8             // 5388: L..... .
    .byt $14, $32, $0a, $12, $c6, $94, $9c, $73             // 5390: .2.....s
    .byt $ce, $c4, $8c, $4c, $0c, $42, $65, $a0             // 5398: ...L.Be.
    .byt $42, $0a, $22, $03, $8d, $82, $10, $29             // 53a0: B."....)
    .byt $26, $93, $5c, $0a, $19, $85, $8c, $3c             // 53a8: &.\....<
    .byt $cc, $20, $03, $15, $82, $08, $41, $a4             // 53b0: . ....A.
    .byt $24, $44, $ca, $18, $26, $93, $3c, $48             // 53b8: $D..&.<H
    .byt $29, $39, $e7, $4c, $cc, $40, $a4, $10             // 53c0: )9.L.@..
    .byt $44, $10, $22, $05, $11, $34, $0a, $1a             // 53c8: D."..4..
    .byt $c6, $10, $66, $c6, $20, $23, $91, $4c             // 53d0: ..f. #.L
    .byt $4c, $41, $03, $0d, $52, $50, $21, $88             // 53d8: LA..RP!.
    .byt $90, $42, $06, $19, $39, $e7, $9c, $73             // 53e0: .B..9..s
    .byt $2e, $39, $e7, $9c, $f3, $c8, $39, $e7             // 53e8: .9....9.
    .byt $9c, $73, $ce, $39, $e7, $9c, $73, $ce             // 53f0: .s.9..s.
    .byt $c6, $18, $63, $8c, $31, $c6, $18, $63             // 53f8: ..c.1..c
    .byt $8c, $31, $c6, $18, $63, $8c, $31, $c6             // 5400: .1..c.1.
    .byt $18, $63, $8c, $31, $39, $67, $92, $73             // 5408: .c.19g.s
    .byt $ce, $39, $e7, $3c, $72, $ce, $39, $e7             // 5410: .9.<r.9.
    .byt $4c, $72, $ce, $23, $e7, $9c, $73, $ce             // 5418: Lr.#..s.
data_levelstrip_1d:
    .byt $a6, $0c, $32, $0a, $21, $99, $90, $32             // 5420: ..2.!..2
    .byt $88, $c9, $a5, $90, $51, $06, $c9, $24             // 5428: ....Q..$
    .byt $9f, $52, $c8, $28, $39, $e7, $9c, $73             // 5430: .R.(9..s
    .byt $2e, $79, $e4, $9c, $73, $ce, $24, $e7             // 5438: .y..s.$.
    .byt $9c, $73, $c9, $23, $93, $51, $88, $29             // 5440: .s.#.Q.)
    .byt $c5, $98, $5c, $0a, $21, $63, $10, $52             // 5448: ..\.!c.R
    .byt $0a, $c9, $24, $8f, $41, $b2, $c9, $25             // 5450: ..$.A..%
    .byt $17, $32, $48, $19, $c9, $98, $42, $72             // 5458: .2H...Br
    .byt $ce, $43, $10, $51, $72, $c9, $24, $8f             // 5460: .C.Qr.$.
    .byt $4c, $72, $ce, $24, $e7, $9c, $4b, $ce             // 5468: Lr.$..K.
    .byt $c5, $98, $9c, $b3, $cb, $84, $8c, $42             // 5470: .......B
    .byt $32, $29, $22, $97, $4c, $0a, $c9, $a5             // 5478: 2)".L...
    .byt $10, $32, $06, $31, $39, $e7, $9c, $73             // 5480: .2.19..s
    .byt $29, $84, $b8, $32, $72, $ce, $24, $97             // 5488: )..2r.$.
    .byt $4c, $72, $c9, $23, $8f, $9c, $73, $ce             // 5490: Lr.#..s.
    .byt $63, $10, $52, $c8, $20, $a5, $30, $32             // 5498: c.R. .02
    .byt $b2, $c9, $65, $90, $4c, $32, $c9, $85             // 54a0: ..e.L2..
    .byt $8c, $6c, $8c, $31, $c5, $18, $43, $72             // 54a8: .l.1..Cr
    .byt $19, $84, $94, $41, $b2, $c9, $23, $e7             // 54b0: ...A..#.
    .byt $6c, $32, $c9, $25, $e7, $6c, $8c, $31             // 54b8: l2.%.l.1
data_levelstrip_1e:
    .byt $c3, $18, $43, $72, $ce, $39, $e7, $4c             // 54c0: ..Cr.9.L
    .byt $72, $19, $24, $8f, $9c, $33, $c9, $23             // 54c8: r.$..3.#
    .byt $9b, $9c, $73, $26, $c5, $18, $43, $b2             // 54d0: ..s&..C.
    .byt $73, $c3, $65, $42, $ca, $c8, $84, $90             // 54d8: s.eB....
    .byt $3c, $72, $c9, $24, $bb, $4c, $48, $19             // 54e0: <r.$.LH.
    .byt $63, $10, $52, $32, $71, $ce, $65, $92             // 54e8: c.R2q.e.
    .byt $73, $ce, $99, $8c, $4c, $dc, $28, $84             // 54f0: s...L.(.
    .byt $90, $10, $42, $08, $a5, $90, $41, $b2             // 54f8: ..B...A.
    .byt $1b, $c6, $e4, $92, $c9, $28, $99, $90             // 5500: .....(..
    .byt $4c, $f4, $0e, $7a, $07, $bd, $43, $08             // 5508: L..z..C.
    .byt $a5, $8d, $41, $32, $21, $65, $e4, $91             // 5510: ..A2!e..
    .byt $89, $29, $99, $90, $3c, $fc, $68, $de             // 5518: .)..<.h.
    .byt $37, $de, $9b, $de, $2e, $34, $52, $72             // 5520: 7....4Rr
    .byt $ce, $99, $e4, $92, $c7, $20, $99, $90             // 5528: ..... ..
    .byt $3c, $78, $77, $bc, $13, $32, $8a, $f7             // 5530: <xw..2..
    .byt $2c, $e4, $36, $46, $21, $84, $64, $92             // 5538: ,.6F!.d.
    .byt $f3, $c8, $39, $e7, $4c, $32, $21, $a5             // 5540: ..9.L2!.
    .byt $8c, $42, $06, $f7, $d9, $e4, $dc, $08             // 5548: .B......
    .byt $29, $84, $e4, $31, $48, $21, $84, $10             // 5550: )..1H!..
    .byt $62, $d8, $20, $84, $10, $63, $8c, $e9             // 5558: b. ..c..
data_levelstrip_1f:
    .byt $ff, $8f, $ff, $ff, $ff, $ff, $87, $ff             // 5560: ........
    .byt $ff, $ff, $e6, $ff, $ff, $ff, $ff, $ff             // 5568: ........
    .byt $7f, $f2, $ff, $ff, $a5, $90, $6c, $8c             // 5570: ......l.
    .byt $71, $39, $84, $10, $b2, $31, $c6, $18             // 5578: q9...1..
    .byt $13, $a1, $18, $44, $4e, $e2, $e2, $74             // 5580: ...DN..t
    .byt $85, $8c, $6c, $8c, $31, $39, $84, $10             // 5588: ..l.19..
    .byt $b2, $31, $c6, $18, $23, $e7, $20, $64             // 5590: .1..#. d
    .byt $14, $12, $67, $1b, $a5, $94, $6c, $8c             // 5598: ..g...l.
    .byt $31, $39, $84, $10, $b2, $c9, $99, $e5             // 55a0: 19......
    .byt $4c, $46, $84, $63, $10, $39, $49, $19             // 55a8: LF.c.9I.
    .byt $43, $8c, $6c, $8c, $31, $39, $84, $10             // 55b0: C.l.19..
    .byt $72, $ce, $c4, $94, $32, $88, $9c, $a5             // 55b8: r...2...
    .byt $90, $51, $c8, $28, $63, $90, $6c, $8c             // 55c0: .Q.(c.l.
    .byt $31, $39, $84, $10, $42, $ce, $a5, $90             // 55c8: 19..B...
    .byt $51, $c8, $68, $11, $0e, $52, $48, $19             // 55d0: Q.h..RH.
    .byt $a5, $8c, $6c, $8c, $31, $39, $84, $10             // 55d8: ..l.19..
    .byt $42, $c8, $89, $94, $41, $4a, $84, $72             // 55e0: B...AJ.r
    .byt $0e, $52, $48, $19, $43, $90, $42, $46             // 55e8: .RH.C.BF
    .byt $ce, $39, $84, $10, $42, $c8, $d9, $91             // 55f0: .9..B...
    .byt $e2, $86, $9c, $a4, $0c, $52, $c8, $28             // 55f8: .....R.(
data_levelstrip_20:
    .byt $64, $90, $32, $72, $4e, $21, $84, $10             // 5600: d.2rN!..
    .byt $42, $08, $79, $14, $97, $23, $2c, $83             // 5608: B.y..#,.
    .byt $14, $52, $06, $31, $a5, $0c, $92, $33             // 5610: .R.1...3
    .byt $19, $85, $94, $42, $46, $09, $79, $84             // 5618: ...BF.y.
    .byt $08, $e5, $2c, $85, $90, $32, $8a, $31             // 5620: ..,..2.1
    .byt $85, $90, $9c, $c9, $28, $a5, $10, $52             // 5628: ....(..R
    .byt $48, $49, $f9, $04, $39, $07, $89, $90             // 5630: HI..9...
    .byt $a4, $32, $48, $19, $84, $e4, $4c, $ca             // 5638: .2H...L.
    .byt $20, $a5, $10, $32, $ca, $08, $39, $42             // 5640:  ..2..9B
    .byt $42, $ca, $90, $33, $c2, $52, $c8, $28             // 5648: B..3.R.(
    .byt $c4, $e5, $41, $46, $21, $c6, $18, $52             // 5650: ..AF!..R
    .byt $c6, $c8, $59, $4e, $42, $ca, $20, $44             // 5658: ..YNB. D
    .byt $ce, $08, $b3, $1b, $84, $e4, $42, $ca             // 5660: ......B.
    .byt $30, $c6, $18, $43, $0a, $c9, $11, $12             // 5668: 0..C....
    .byt $52, $86, $18, $24, $17, $39, $23, $24             // 5670: R..$.9#$
    .byt $85, $e4, $3c, $48, $31, $c6, $18, $43             // 5678: ..<H1..C
    .byt $4a, $ce, $72, $46, $58, $0a, $19, $24             // 5680: J.rFX..$
    .byt $0f, $32, $e4, $2c, $8e, $90, $9c, $49             // 5688: .2.,...I
    .byt $31, $c6, $18, $33, $72, $26, $a3, $c8             // 5690: 1..3r&..
    .byt $59, $ca, $20, $86, $99, $52, $06, $09             // 5698: Y. ..R..
data_levelstrip_21:
    .byt $84, $94, $91, $73, $26, $c6, $98, $9c             // 56a0: ...s&...
    .byt $73, $71, $99, $11, $52, $06, $11, $24             // 56a8: sq..R..$
    .byt $0f, $52, $08, $09, $63, $08, $32, $48             // 56b0: .R..c.2H
    .byt $ce, $39, $e7, $4c, $48, $21, $b9, $90             // 56b8: .9.LH!..
    .byt $12, $21, $21, $25, $8f, $41, $44, $09             // 56c0: .!!%.AD.
    .byt $84, $94, $41, $46, $c9, $2e, $13, $52             // 56c8: ..AF...R
    .byt $06, $19, $99, $90, $21, $e7, $20, $25             // 56d0: ....!. %
    .byt $42, $42, $46, $09, $64, $94, $42, $da             // 56d8: BBF.d.B.
    .byt $20, $a3, $90, $4c, $48, $6e, $79, $14             // 56e0:  ..LHny.
    .byt $51, $22, $24, $43, $ce, $08, $49, $09             // 56e8: Q"$C..I.
    .byt $8f, $10, $32, $4a, $ce, $39, $e7, $4c             // 56f0: ..2J.9.L
    .byt $5c, $c8, $b9, $90, $32, $e4, $8c, $d0             // 56f8: \...2...
    .byt $18, $39, $0b, $09, $84, $94, $41, $88             // 5700: .9....A.
    .byt $31, $c6, $98, $3c, $1c, $09, $cc, $95             // 5708: 1..<....
    .byt $42, $c8, $90, $d3, $91, $12, $61, $6e             // 5710: B.....an
    .byt $25, $13, $32, $8a, $31, $ce, $e5, $4c             // 5718: %.2.1..L
    .byt $86, $09, $79, $8c, $42, $04, $21, $65             // 5720: ..y.B.!e
    .byt $10, $27, $67, $84, $a5, $10, $32, $88             // 5728: .'g...2.
    .byt $31, $c6, $98, $9c, $89, $29, $b9, $14             // 5730: 1....)..
    .byt $42, $06, $19, $24, $97, $32, $8c, $9c             // 5738: B..$.2..
data_levelstrip_22:
    .byt $22, $e7, $41, $42, $08, $21, $84, $52             // 5740: ".AB.!.R
    .byt $06, $21, $b9, $94, $41, $4a, $21, $83             // 5748: .!..AJ!.
    .byt $0c, $13, $42, $08, $23, $ef, $51, $42             // 5750: ..B.#.QB
    .byt $08, $21, $94, $61, $08, $29, $99, $90             // 5758: .!.a.)..
    .byt $32, $4c, $29, $84, $8c, $6c, $8c, $09             // 5760: 2L)..l..
    .byt $85, $f7, $e2, $42, $08, $61, $0c, $42             // 5768: ...B.a.B
    .byt $8a, $28, $cc, $94, $42, $46, $19, $a4             // 5770: .(..BF..
    .byt $0c, $13, $42, $08, $c5, $e5, $a1, $43             // 5778: ..B....C
    .byt $08, $99, $90, $62, $08, $19, $99, $90             // 5780: ...b....
    .byt $32, $08, $19, $65, $94, $1c, $8c, $31             // 5788: 2..e...1
    .byt $45, $ef, $91, $43, $c8, $2f, $0f, $52             // 5790: E..C./.R
    .byt $ca, $20, $6d, $10, $32, $48, $31, $85             // 5798: . m.2H1.
    .byt $0c, $13, $42, $08, $24, $77, $92, $4d             // 57a0: ..B.$w.M
    .byt $2e, $64, $64, $42, $72, $19, $99, $14             // 57a8: .ddBr...
    .byt $53, $c8, $20, $84, $94, $6c, $8c, $49             // 57b0: S. ..l.I
    .byt $24, $9f, $61, $b2, $29, $99, $98, $4c             // 57b8: $.a.)..L
    .byt $f2, $28, $b9, $0c, $92, $73, $29, $c3             // 57c0: .(...s).
    .byt $90, $1c, $42, $08, $25, $e7, $9c, $4d             // 57c8: ..B.%..M
    .byt $2e, $39, $e4, $41, $f2, $20, $b9, $90             // 57d0: .9.A. ..
    .byt $51, $32, $21, $a5, $8c, $9c, $73, $ce             // 57d8: Q2!...s.
data_levelstrip_23:
    .byt $24, $13, $32, $46, $29, $39, $90, $e2             // 57e0: $.2F)9..
    .byt $f2, $28, $39, $e7, $4c, $72, $31, $65             // 57e8: .(9.Lr1e
    .byt $90, $4c, $9c, $73, $24, $0f, $32, $ca             // 57f0: .L.s$.2.
    .byt $70, $21, $94, $a1, $b7, $2b, $65, $90             // 57f8: p!...+e.
    .byt $4c, $72, $19, $84, $94, $ec, $4c, $19             // 5800: Lr....L.
    .byt $24, $8f, $9c, $73, $ce, $84, $94, $cc             // 5808: $..s....
    .byt $7b, $19, $c3, $95, $5c, $f2, $20, $a6             // 5810: {...\. .
.byt $8c, $5c, $88, $0b, $24, $0f, $52, $5c             // 5818: .\..$.R\ 
    .byt $c9, $a3, $e4, $41, $4a, $21, $a4, $8c             // 5820: ...AJ!..
    .byt $3c, $f2, $20, $a5, $8c, $9c, $4b, $ce             // 5828: <. ...K.
    .byt $24, $b7, $4c, $8a, $cb, $39, $0f, $52             // 5830: $.L..9.R
    .byt $48, $19, $83, $8c, $4c, $0a, $19, $c4             // 5838: H...L...
    .byt $0d, $42, $46, $29, $24, $e7, $4c, $32             // 5840: .BF)$.L2
    .byt $29, $83, $14, $63, $f2, $20, $84, $91             // 5848: )..c. ..
    .byt $ec, $08, $71, $79, $64, $96, $4d, $1e             // 5850: ..qyd.M.
    .byt $24, $97, $42, $c8, $18, $64, $98, $14             // 5858: $.B..d..
    .byt $4c, $1e, $64, $94, $6c, $8a, $d1, $39             // 5860: L.d.l..9
    .byt $65, $63, $32, $29, $83, $90, $92, $0b             // 5868: ec2)....
    .byt $19, $a4, $98, $10, $4c, $1e, $84, $8c             // 5870: ....L...
    .byt $6c, $8c, $f6, $79, $64, $63, $1a, $19             // 5878: l..ydc..
data_levelstrip_24:
    .byt $85, $14, $32, $48, $0e, $21, $84, $10             // 5880: ..2H.!..
    .byt $42, $08, $41, $84, $9c, $73, $76, $64             // 5888: B.A..svd
    .byt $64, $47, $48, $29, $c4, $14, $43, $46             // 5890: dGH)..CF
    .byt $0e, $21, $e7, $10, $72, $08, $39, $87             // 5898: .!..r.9.
    .byt $90, $db, $70, $39, $67, $e7, $9c, $73             // 58a0: ..p9g..s
    .byt $a4, $98, $62, $46, $0e, $39, $84, $90             // 58a8: ..bF.9..
    .byt $43, $0e, $39, $e4, $90, $33, $29, $63             // 58b0: C.9..3)c
    .byt $64, $e2, $08, $19, $c5, $14, $33, $48             // 58b8: d.....3H
    .byt $0e, $61, $84, $90, $47, $0e, $79, $84             // 58c0: .a..G.y.
    .byt $10, $32, $21, $65, $e4, $52, $06, $19             // 58c8: .2!e.R..
    .byt $a5, $10, $32, $46, $08, $21, $e4, $90             // 58d0: ..2F.!..
    .byt $43, $0e, $39, $84, $10, $72, $26, $a5             // 58d8: C.9..r&.
    .byt $e4, $9c, $73, $c9, $39, $e7, $9c, $49             // 58e0: ..s.9..I
    .byt $0e, $39, $87, $90, $43, $0e, $39, $84             // 58e8: .9..C.9.
    .byt $10, $42, $26, $83, $90, $32, $08, $19             // 58f0: .B&..2..
    .byt $d9, $39, $52, $46, $0e, $21, $84, $10             // 58f8: .9RF.!..
    .byt $42, $08, $21, $84, $90, $49, $1e, $39             // 5900: B.!..I.9
    .byt $e7, $3c, $32, $c9, $c6, $98, $42, $4a             // 5908: .<2...BJ
    .byt $0e, $21, $84, $10, $ac, $08, $21, $84             // 5910: .!....!.
    .byt $90, $49, $29, $83, $9c, $5c, $48, $ce             // 5918: .I)..\H.
data_levelstrip_25:
    .byt $e2, $ff, $ff, $ff, $ff, $ff, $ff, $ff             // 5920: ........
    .byt $ff, $27, $ff, $ff, $ff, $ff, $ff, $ff             // 5928: .'......
    .byt $ff, $ff, $7f, $f9, $24, $1b, $93, $09             // 5930: ....$...
    .byt $29, $83, $8c, $9c, $4a, $21, $a3, $0c             // 5938: )...J!..
    .byt $52, $0c, $21, $39, $93, $d1, $de, $28             // 5940: R.!9...(
    .byt $23, $3b, $93, $07, $71, $a5, $0c, $92             // 5948: #;..q...
    .byt $4b, $19, $84, $90, $62, $06, $09, $a9             // 5950: K...b...
    .byt $14, $92, $c9, $28, $25, $1b, $93, $87             // 5958: ...(%...
    .byt $23, $ae, $94, $5c, $0a, $21, $84, $8c             // 5960: #..\.!..
    .byt $42, $0c, $49, $a1, $e4, $92, $49, $ce             // 5968: B.I...I.
    .byt $24, $1b, $43, $86, $23, $c5, $64, $42             // 5970: $.C.#.dB
    .byt $46, $19, $82, $94, $61, $48, $c9, $65             // 5978: F...aH.e
    .byt $e4, $9c, $49, $ce, $24, $1b, $93, $8b             // 5980: ..I.$...
    .byt $2b, $65, $90, $5c, $0a, $19, $65, $90             // 5988: +e.\..e.
    .byt $42, $4c, $c9, $c6, $94, $91, $4f, $2e             // 5990: BL....O.
    .byt $24, $1b, $93, $49, $21, $83, $8c, $92             // 5998: $..I!...
    .byt $cb, $20, $83, $14, $42, $4a, $36, $c6             // 59a0: . ..BJ6.
    .byt $18, $97, $73, $26, $24, $1b, $93, $4b             // 59a8: ..s&$..K
    .byt $19, $84, $90, $51, $32, $21, $a2, $0c             // 59b0: ...Q2!..
    .byt $32, $b2, $31, $26, $93, $51, $06, $29             // 59b8: 2.1&.Q.)
data_levelstrip_26:
    .byt $24, $1b, $93, $4b, $19, $64, $90, $91             // 59c0: $..K.d..
    .byt $07, $29, $84, $0c, $53, $48, $36, $c6             // 59c8: .)..SH6.
    .byt $e5, $92, $73, $26, $26, $1b, $93, $73             // 59d0: ..s&&..s
    .byt $ce, $39, $e7, $ec, $72, $19, $24, $13             // 59d8: .9..r.$.
    .byt $32, $46, $c9, $c6, $98, $6c, $4c, $1e             // 59e0: 2F...lL.
    .byt $26, $1b, $93, $8d, $31, $64, $94, $42             // 59e8: &...1d.B
    .byt $42, $1e, $79, $64, $42, $4c, $21, $d9             // 59f0: B.ydBL!.
    .byt $18, $e7, $4c, $2e, $26, $1b, $93, $8d             // 59f8: ..L.&...
    .byt $31, $85, $94, $1c, $32, $c9, $a4, $8c             // 5a00: 1...2...
    .byt $4c, $48, $29, $23, $1b, $63, $72, $ce             // 5a08: LH)#.cr.
    .byt $26, $1b, $53, $8c, $31, $85, $8c, $1c             // 5a10: &.S.1...
    .byt $4a, $21, $a3, $0c, $92, $09, $31, $85             // 5a18: J!....1.
    .byt $64, $93, $4b, $31, $26, $1b, $93, $cb             // 5a20: d.K1&...
    .byt $20, $84, $94, $dc, $32, $29, $c4, $91             // 5a28:  ...2)..
    .byt $51, $32, $21, $83, $94, $4c, $9c, $2b             // 5a30: Q2!..L.+
    .byt $26, $1b, $93, $73, $21, $64, $90, $92             // 5a38: &..s!d..
    .byt $09, $71, $a5, $0c, $47, $4a, $2e, $a6             // 5a40: .q..GJ..
    .byt $0c, $92, $09, $71, $26, $1b, $93, $4d             // 5a48: ...q&..M
    .byt $ce, $ac, $90, $4c, $72, $29, $63, $90             // 5a50: ...Lr)c.
    .byt $41, $32, $21, $a5, $0c, $52, $32, $29             // 5a58: A2!..R2)
data_levelstrip_27:
    .byt $26, $1b, $93, $8d, $31, $26, $e7, $52             // 5a60: &...1&.R
    .byt $48, $2e, $d9, $e5, $31, $4a, $26, $6e             // 5a68: H...1J&n
    .byt $8c, $92, $5d, $c9, $26, $1b, $93, $8d             // 5a70: ..].&...
    .byt $31, $c6, $18, $53, $32, $29, $ce, $b9             // 5a78: 1..S2)..
    .byt $51, $f2, $18, $64, $94, $2c, $88, $23             // 5a80: Q..d.,.#
    .byt $26, $1b, $93, $73, $ce, $39, $e7, $9c             // 5a88: &..s.9..
    .byt $49, $26, $84, $90, $91, $09, $61, $c4             // 5a90: I&....a.
    .byt $91, $92, $0b, $31, $26, $1b, $93, $4b             // 5a98: ...1&..K
    .byt $19, $64, $14, $32, $0a, $c9, $84, $8c             // 5aa0: .d.2....
    .byt $4c, $f2, $18, $a4, $90, $4c, $1c, $71             // 5aa8: L....L.q
    .byt $26, $1b, $53, $08, $19, $65, $10, $57             // 5ab0: &.S..e.W
    .byt $0a, $29, $d9, $64, $42, $4a, $2e, $b9             // 5ab8: .).dBJ..
    .byt $64, $52, $86, $21, $26, $1b, $93, $4b             // 5ac0: dR.!&..K
    .byt $19, $ac, $94, $41, $08, $19, $25, $13             // 5ac8: ...A..%.
    .byt $32, $46, $c9, $24, $97, $42, $48, $19             // 5ad0: 2F.$.BH.
    .byt $26, $1b, $93, $09, $29, $83, $0c, $32             // 5ad8: &...)..2
    .byt $5c, $29, $84, $8c, $42, $86, $29, $85             // 5ae0: \)..B.).
    .byt $e4, $9c, $33, $c9, $c6, $18, $93, $4b             // 5ae8: ..3....K
    .byt $21, $64, $94, $41, $08, $29, $83, $8c             // 5af0: !d.A.)..
    .byt $32, $0a, $21, $65, $90, $51, $0a, $31             // 5af8: 2.!e.Q.1
data_levelstrip_28:
    .byt $64, $94, $42, $48, $c9, $c4, $95, $42             // 5b00: d.BH...B
    .byt $46, $19, $84, $94, $41, $88, $0b, $39             // 5b08: F...A..9
    .byt $19, $42, $4a, $19, $44, $6f, $51, $dc             // 5b10: .BJ.DoQ.
    .byt $c8, $84, $b8, $91, $cb, $c8, $39, $e7             // 5b18: ......9.
    .byt $ec, $46, $0e, $39, $04, $53, $f4, $2e             // 5b20: .F.9.S..
    .byt $8e, $f7, $32, $d8, $c8, $2e, $b8, $91             // 5b28: ..2.....
    .byt $4b, $36, $2e, $84, $6c, $8a, $0b, $d9             // 5b30: K6..l...
    .byt $84, $60, $78, $67, $a5, $0c, $42, $c8             // 5b38: .`xg..B.
    .byt $c8, $c5, $11, $93, $4b, $31, $ce, $e5             // 5b40: ....K1..
    .byt $5c, $48, $0b, $39, $04, $53, $0a, $71             // 5b48: \H.9.S.q
    .byt $25, $e7, $9c, $73, $ce, $85, $8c, $91             // 5b50: %..s....
    .byt $49, $36, $c6, $98, $5c, $46, $36, $39             // 5b58: I6..\F69
    .byt $18, $42, $4a, $19, $25, $9b, $4c, $48             // 5b60: .BJ.%.LH
    .byt $c9, $39, $e7, $9c, $c9, $c8, $39, $e7             // 5b68: .9....9.
    .byt $9c, $73, $ce, $d9, $94, $42, $46, $0e             // 5b70: .s...BF.
    .byt $63, $14, $32, $4c, $29, $64, $90, $61             // 5b78: c.2L)d.a
    .byt $4a, $31, $63, $10, $52, $0a, $19, $ad             // 5b80: J1c.R...
    .byt $94, $31, $08, $c9, $39, $e7, $9c, $73             // 5b88: .1..9..s
    .byt $ce, $39, $e7, $9c, $73, $ce, $39, $e4             // 5b90: .9..s.9.
    .byt $9c, $73, $ce, $39, $e7, $9c, $73, $ce             // 5b98: .s.9..s.
data_levelstrip_29:
    .byt $a5, $10, $52, $1c, $19, $23, $17, $92             // 5ba0: ..R..#..
    .byt $4d, $08, $21, $98, $5c, $ca, $18, $64             // 5ba8: M.!.\..d
    .byt $e4, $37, $9c, $cb, $a5, $90, $3c, $06             // 5bb0: .7....<.
    .byt $c9, $65, $90, $91, $43, $c8, $21, $84             // 5bb8: .e..C.!.
    .byt $41, $48, $21, $99, $90, $51, $8c, $39             // 5bc0: AH!..Q.9
    .byt $a6, $64, $97, $cb, $c8, $84, $98, $92             // 5bc8: .d......
    .byt $43, $0e, $21, $84, $4c, $48, $19, $39             // 5bd0: C.!.LH.9
    .byt $67, $92, $73, $1e, $25, $8f, $41, $06             // 5bd8: g.s.%.A.
    .byt $c9, $84, $0c, $92, $43, $c8, $21, $84             // 5be0: ....C.!.
    .byt $3c, $f2, $c8, $99, $90, $92, $49, $1e             // 5be8: <.....I.
    .byt $a5, $b8, $e2, $06, $c9, $63, $90, $91             // 5bf0: .....c..
    .byt $43, $08, $39, $84, $4c, $32, $21, $79             // 5bf8: C.9.L2!y
    .byt $14, $92, $09, $29, $8e, $38, $37, $06             // 5c00: ...).87.
    .byt $c9, $a6, $0c, $92, $43, $08, $29, $87             // 5c08: ....C.).
    .byt $4c, $72, $1e, $b9, $10, $93, $09, $29             // 5c10: Lr.....)
    .byt $84, $94, $42, $c8, $c8, $84, $0c, $52             // 5c18: ..B....R
    .byt $42, $08, $39, $84, $4c, $32, $29, $99             // 5c20: B.9.L2).
    .byt $90, $32, $06, $29, $84, $94, $41, $72             // 5c28: .2.)..Ar
    .byt $29, $84, $8c, $92, $4d, $08, $21, $98             // 5c30: )...M.!.
    .byt $5c, $ca, $20, $84, $90, $32, $06, $29             // 5c38: \. ..2.)
data_levelstrip_2a:
    .byt $39, $e7, $9c, $73, $ce, $39, $e7, $9c             // 5c40: 9..s.9..
    .byt $73, $ce, $39, $e7, $9c, $73, $26, $39             // 5c48: s.9..s&9
    .byt $e7, $9c, $73, $ce, $a4, $90, $42, $06             // 5c50: ..s...B.
    .byt $19, $a5, $10, $32, $4a, $ce, $24, $97             // 5c58: ...2J.$.
    .byt $41, $5c, $2e, $65, $64, $47, $dc, $70             // 5c60: A\.edG.p
    .byt $44, $ef, $a2, $77, $c9, $64, $64, $93             // 5c68: D..w.dd.
    .byt $09, $29, $23, $93, $5c, $46, $26, $79             // 5c70: .)#.\F&y
    .byt $64, $42, $ca, $30, $84, $f7, $c1, $7b             // 5c78: dB.0...{
    .byt $c9, $24, $1b, $63, $72, $c9, $24, $8f             // 5c80: .$.cr.$.
    .byt $9c, $49, $2e, $99, $8c, $4c, $8a, $29             // 5c88: .I...L.)
    .byt $84, $0c, $43, $c8, $c8, $c3, $98, $6c             // 5c90: ..C....l
    .byt $0c, $c9, $63, $14, $92, $49, $26, $79             // 5c98: ..c..I&y
    .byt $14, $92, $c7, $20, $44, $ef, $a1, $77             // 5ca0: ... D..w
    .byt $c9, $24, $1b, $63, $72, $c9, $24, $e7             // 5ca8: .$.cr.$.
    .byt $91, $49, $2e, $99, $b8, $41, $f4, $1e             // 5cb0: .I...A..
    .byt $83, $77, $c2, $7b, $c9, $85, $64, $93             // 5cb8: .w.{..d.
    .byt $cb, $c8, $84, $8c, $92, $db, $20, $79             // 5cc0: ...... y
    .byt $90, $52, $78, $27, $84, $94, $41, $06             // 5cc8: .Rx'..A.
    .byt $c9, $99, $0c, $42, $4a, $ce, $39, $17             // 5cd0: ...BJ.9.
    .byt $42, $c6, $20, $99, $90, $3c, $8a, $20             // 5cd8: B. ..<. 
data_levelstrip_2b:
    .byt $e2, $ff, $ff, $ff, $ff, $ff, $ff, $ff             // 5ce0: ........
    .byt $ff, $ff, $ff, $ff, $ff, $3f, $f9, $ff             // 5ce8: .....?..
    .byt $ff, $3f, $fe, $0f, $84, $b8, $52, $48             // 5cf0: .?....RH
    .byt $19, $24, $9b, $62, $48, $23, $d9, $94             // 5cf8: .$.bH#..
    .byt $41, $32, $71, $7a, $e7, $4c, $5c, $36             // 5d00: A2qz.L\6
    .byt $83, $90, $9c, $73, $ce, $64, $64, $53             // 5d08: ...s.ddS
    .byt $4c, $26, $39, $e7, $4c, $72, $d1, $de             // 5d10: L&9.Lr..
    .byt $8f, $41, $74, $0e, $39, $e4, $10, $42             // 5d18: .At.9..B
    .byt $c8, $c3, $85, $6c, $4a, $26, $25, $8f             // 5d20: ...lJ&%.
    .byt $41, $32, $e1, $be, $13, $ed, $7d, $36             // 5d28: A2....}6
    .byt $21, $84, $10, $72, $ce, $c3, $94, $90             // 5d30: !..r....
    .byt $4d, $ce, $25, $93, $3c, $32, $29, $84             // 5d38: M.%.<2).
    .byt $0c, $ee, $7d, $0e, $39, $e4, $90, $43             // 5d40: ..}.9..C
    .byt $c8, $c6, $a5, $10, $72, $26, $23, $13             // 5d48: ....r&#.
    .byt $52, $32, $19, $a5, $10, $42, $72, $36             // 5d50: R2...Br6
    .byt $21, $e4, $10, $42, $c8, $cc, $b8, $14             // 5d58: !..B....
    .byt $42, $1e, $39, $67, $92, $f3, $28, $8e             // 5d60: B.9g..(.
    .byt $90, $91, $4b, $0e, $26, $87, $1c, $b2             // 5d68: ..K.&...
    .byt $c9, $39, $e7, $9c, $43, $2e, $99, $e4             // 5d70: .9..C...
    .byt $41, $72, $21, $ac, $90, $5c, $48, $36             // 5d78: Ar!..\H6
data_levelstrip_2c:
    .byt $39, $84, $10, $42, $0e, $61, $10, $32             // 5d80: 9..B.a.2
    .byt $42, $28, $84, $94, $41, $48, $2e, $85             // 5d88: B(..AH..
    .byt $e4, $52, $46, $0e, $26, $e4, $90, $43             // 5d90: .RF.&..C
    .byt $c8, $99, $90, $51, $42, $ca, $39, $67             // 5d98: ...QB.9g
    .byt $32, $4a, $c9, $24, $0f, $52, $4a, $36             // 5da0: 2J.$.RJ6
    .byt $21, $84, $10, $72, $08, $81, $8c, $9c             // 5da8: !..r....
    .byt $73, $29, $84, $e4, $5c, $4a, $19, $99             // 5db0: s)..\J..
    .byt $90, $32, $48, $0e, $39, $e7, $10, $42             // 5db8: .2H.9..B
    .byt $ce, $39, $e7, $6c, $ca, $20, $c4, $91             // 5dc0: .9.l. ..
    .byt $9c, $73, $19, $84, $94, $41, $48, $36             // 5dc8: .s...AH6
    .byt $84, $8c, $91, $73, $26, $63, $94, $9c             // 5dd0: ...s&c..
    .byt $33, $21, $63, $14, $32, $72, $ce, $99             // 5dd8: 3!c.2r..
    .byt $90, $52, $46, $ce, $a5, $8c, $9c, $c7             // 5de0: .RF.....
    .byt $20, $63, $14, $42, $72, $26, $a4, $88             // 5de8:  c.Br&..
    .byt $32, $08, $29, $39, $e7, $52, $08, $31             // 5df0: 2.)9.R.1
    .byt $79, $e4, $4c, $c8, $28, $a5, $10, $32             // 5df8: y.L.(..2
    .byt $5c, $2e, $65, $10, $42, $46, $29, $64             // 5e00: \.e.BF)d
    .byt $e4, $4c, $72, $76, $79, $64, $13, $42             // 5e08: .Lrvyd.B
    .byt $08, $21, $84, $e0, $48, $2e, $ae, $14             // 5e10: .!..H...
    .byt $42, $ca, $20, $84, $8c, $41, $06, $29             // 5e18: B. ..A.)
data_levelstrip_2d:
    .byt $79, $64, $13, $42, $08, $21, $84, $90             // 5e20: yd.B.!..
    .byt $4b, $2e, $c4, $90, $e2, $02, $19, $87             // 5e28: K.......
    .byt $14, $92, $73, $26, $83, $64, $96, $73             // 5e30: ..s&.d.s
    .byt $ce, $39, $e7, $9c, $49, $ce, $85, $90             // 5e38: .9..I...
    .byt $32, $06, $19, $85, $98, $92, $43, $18             // 5e40: 2.....C.
    .byt $23, $67, $93, $0b, $21, $d9, $34, $43             // 5e48: #g..!.4C
    .byt $c8, $c8, $99, $90, $31, $48, $21, $a6             // 5e50: ....1H!.
    .byt $90, $92, $43, $1e, $24, $1b, $93, $cb             // 5e58: ..C.$...
    .byt $20, $d9, $34, $93, $4b, $19, $39, $13             // 5e60:  .4.K.9.
    .byt $32, $46, $c9, $d9, $e5, $9c, $43, $ce             // 5e68: 2F....C.
    .byt $24, $9b, $9c, $73, $36, $b9, $99, $96             // 5e70: $..s6...
    .byt $4d, $2e, $24, $e7, $5c, $1e, $29, $64             // 5e78: M.$.\.)d
    .byt $84, $10, $42, $c8, $23, $1b, $63, $4c             // 5e80: ..B.#.cL
    .byt $2e, $b9, $99, $96, $73, $ce, $21, $84             // 5e88: ....s.!.
    .byt $9c, $73, $ce, $39, $e7, $1c, $72, $08             // 5e90: .s.9..r.
    .byt $24, $e7, $9c, $73, $1e, $39, $e7, $9c             // 5e98: $..s.9..
    .byt $33, $c9, $21, $87, $1c, $42, $c8, $21             // 5ea0: 3.!..B.!
    .byt $84, $9c, $73, $c8, $84, $94, $41, $c8             // 5ea8: ..s...A.
    .byt $28, $a5, $10, $32, $0a, $31, $21, $87             // 5eb0: (..2.1!.
    .byt $10, $72, $08, $21, $87, $10, $42, $08             // 5eb8: .r.!..B.
data_levelstrip_2e:
    .byt $c2, $8c, $31, $c6, $18, $63, $8c, $31             // 5ec0: ..1..c.1
    .byt $c6, $18, $63, $8c, $31, $c6, $18, $63             // 5ec8: ..c.1..c
    .byt $8c, $30, $c6, $18, $63, $0c, $33, $c6             // 5ed0: .0..c.3.
    .byt $18, $63, $8c, $31, $c6, $18, $63, $8c             // 5ed8: .c.1..c.
    .byt $31, $f2, $c8, $63, $84, $10, $c6, $18             // 5ee0: 1..c....
    .byt $c3, $8c, $31, $c6, $18, $63, $8c, $31             // 5ee8: ..1..c.1
    .byt $c6, $18, $63, $8c, $91, $c7, $70, $39             // 5ef0: ..c...p9
    .byt $84, $10, $c2, $18, $63, $0c, $33, $f2             // 5ef8: ....c.3.
    .byt $18, $63, $0c, $37, $c6, $18, $c3, $8d             // 5f00: .c.7....
    .byt $6c, $f2, $18, $23, $87, $10, $c6, $18             // 5f08: l..#....
    .byt $63, $8c, $91, $4d, $1e, $79, $0c, $e7             // 5f10: c..M.y..
    .byt $c6, $18, $f9, $64, $63, $4c, $76, $c3             // 5f18: ...dcLv.
    .byt $e5, $94, $c7, $18, $63, $8c, $6c, $8c             // 5f20: ....c.l.
    .byt $c9, $26, $8f, $31, $f2, $c8, $26, $1b             // 5f28: .&.1..&.
    .byt $63, $8c, $c9, $63, $8c, $6c, $f2, $30             // 5f30: c..c.l.0
    .byt $79, $64, $63, $8c, $31, $c6, $e4, $91             // 5f38: ydc.1...
    .byt $4d, $36, $c6, $18, $63, $8c, $31, $d9             // 5f40: M6..c.1.
    .byt $64, $63, $4c, $66, $26, $1b, $63, $8c             // 5f48: dcLf&.c.
    .byt $31, $c6, $98, $6c, $8c, $31, $c6, $18             // 5f50: 1..l.1..
    .byt $63, $8c, $31, $26, $1b, $63, $8c, $31             // 5f58: c.1&.c.1
data_levelstrip_2f:
    .byt $ae, $70, $ef, $bd, $f7, $de, $7b, $ef             // 5f60: .p....{.
    .byt $bd, $f7, $de, $7b, $ef, $bd, $f7, $de             // 5f68: ...{....
    .byt $7b, $ef, $bd, $f7, $9b, $14, $c2, $fd             // 5f70: {.......
    .byt $36, $2e, $b7, $d6, $58, $4e, $21, $65             // 5f78: 6...XN!e
    .byt $52, $48, $e1, $9d, $18, $63, $8c, $31             // 5f80: RH...c.1
    .byt $de, $91, $42, $0a, $df, $a4, $b4, $dc             // 5f88: ..B.....
    .byt $5a, $0e, $21, $e4, $92, $33, $29, $a4             // 5f90: Z.!..3).
    .byt $18, $e7, $9c, $cb, $de, $7b, $bf, $49             // 5f98: .....{.I
    .byt $f1, $9b, $b4, $d6, $5a, $21, $85, $14             // 5fa0: ....Z!..
    .byt $92, $73, $ce, $39, $1b, $63, $8c, $31             // 5fa8: .s.9.c.1
    .byt $dd, $18, $de, $1d, $e1, $bd, $e4, $9c             // 5fb0: ........
    .byt $19, $c9, $b9, $e4, $4c, $0a, $29, $24             // 5fb8: ....L.)$
    .byt $e7, $9c, $73, $ce, $c6, $18, $a3, $b7             // 5fc0: ..s.....
    .byt $20, $85, $14, $53, $48, $21, $85, $14             // 5fc8:  ..SH!..
    .byt $52, $72, $ce, $85, $14, $52, $48, $21             // 5fd0: Rr...RH!
    .byt $c6, $18, $c3, $7b, $ce, $39, $e7, $9c             // 5fd8: ...{.9..
    .byt $73, $ce, $39, $e7, $9c, $b3, $c8, $39             // 5fe0: s.9....9
    .byt $e7, $9c, $73, $70, $c6, $18, $11, $44             // 5fe8: ..sp...D
    .byt $10, $41, $04, $11, $44, $10, $41, $04             // 5ff0: .A..D.A.
    .byt $11, $44, $10, $21, $84, $10, $82, $d0             // 5ff8: .D.!....
l6000:
l6060:
l60a0:
pydis_end:

    * = $0380
// Referenced 1 time by $0d40
music_nextnotes:
    pha                                                     // 0380: 48
    tax                                                     // 0381: aa
    lda musicdata_channel2,x                                // 0382: bd 80 0d
    tax                                                     // 0385: aa
    lda #$12                                                // 0386: a9 12
    sta l0040                                               // 0388: 85 40
    lda #$02                                                // 038a: a9 02
    tay                                                     // 038c: a8
    jsr music_playnote                                      // 038d: 20 ac 03
    pla                                                     // 0390: 68
    tax                                                     // 0391: aa
    lda musicdata_channel3,x                                // 0392: bd d8 0e
    tax                                                     // 0395: aa
    lda #$13                                                // 0396: a9 13
    sta l0040                                               // 0398: 85 40
    lda #$02                                                // 039a: a9 02
    ldy #$02                                                // 039c: a0 02
    jmp music_playnote                                      // 039e: 4c ac 03
    .byt $60                                                // 03a1: `
// Referenced 1 time by $13dc
music_start:
    lda #$00                                                // 03a2: a9 00
    sta l0078                                               // 03a4: 85 78
    sta zp_music_note                                       // 03a6: 85 51
    jmp enable_event                                        // 03a8: 4c 46 0d
// Referenced 1 time by $03ae
music_playnote_skip:
    rts                                                     // 03ab: 60
// Referenced 2 times by $038d, $039e
music_playnote:
    cpx #$00                                                // 03ac: e0 00
    beq music_playnote_skip                                 // 03ae: f0 fb
    pha                                                     // 03b0: 48
    lda zp_soundon                                          // 03b1: a5 83
    and zp_music_enabled                                    // 03b3: 25 5f
    beq music_playnote_disabled                             // 03b5: f0 25
    pla                                                     // 03b7: 68
    sta zp_music_osword_envelope                            // 03b8: 85 43
    stx zp_music_osword_pitch                               // 03ba: 86 45
    sty zp_music_osword_duration                            // 03bc: 84 47
    ldx #$00                                                // 03be: a2 00
    stx zp_music_osword_duration+1                          // 03c0: 86 48
    stx zp_music_osword_pitch+1                             // 03c2: 86 46
    stx zp_music_osword_channel+1                           // 03c4: 86 42
    ldx l0040                                               // 03c6: a6 40
    stx zp_music_osword_channel                             // 03c8: 86 41
    ldx #$ff                                                // 03ca: a2 ff
    tay                                                     // 03cc: a8
// This branch and load seem to have no useful effect
    bmi music_playnote_osword                               // 03cd: 30 02
    ldx #$00                                                // 03cf: a2 00
// Referenced 1 time by $03cd
music_playnote_osword:
    sty zp_music_osword_envelope+1                          // 03d1: 84 44
    ldx #$41 // 'A'                                         // 03d3: a2 41
    ldy #$00                                                // 03d5: a0 00
    lda #$07                                                // 03d7: a9 07
    jmp osword                                              // 03d9: 4c f1 ff
// Referenced 1 time by $03b5
music_playnote_disabled:
    pla                                                     // 03dc: 68
    rts                                                     // 03dd: 60
    .byt $ea, $ea                                           // 03de: ..
l03e0:

    * = $0880
// Referenced 1 time by $0883
place_spirit_rts:
    rts                                                     // 0880: 60
// Referenced 1 time by $1f5f
place_spirit:
    lda zp_current_level                                    // 0881: a5 8b
    beq place_spirit_rts                                    // 0883: f0 fb
    lda #obj_empty                                          // 0885: a9 02
    jsr map_store_obj                                       // 0887: 20 6b 11
    jmp allocate_spirit                                     // 088a: 4c 62 1f
// Referenced 1 time by $0fd5
kbd_check_dwq:
    lda #keycode_d                                          // 088d: a9 cd
    jsr kbd_test                                            // 088f: 20 95 0f
    beq kbd_check_w                                         // 0892: f0 04
    lda #$01                                                // 0894: a9 01
    sta zp_music_enabled                                    // 0896: 85 5f
// Referenced 1 time by $0892
kbd_check_w:
    lda #keycode_w                                          // 0898: a9 de
    jsr kbd_test                                            // 089a: 20 95 0f
    beq kbd_check_q                                         // 089d: f0 04
    lda #$00                                                // 089f: a9 00
    sta zp_music_enabled                                    // 08a1: 85 5f
// Referenced 1 time by $089d
kbd_check_q:
    lda #keycode_q                                          // 08a3: a9 ef
    jmp kbd_test                                            // 08a5: 4c 95 0f
// Sets Z if the number of remaining puzzle pieces is 0 or 1
// Referenced 1 time by $2531
check_remaining_puzzlepieces:
    lda remaining_puzzlepieces_bcd                          // 08a8: ad e5 0b
    cmp #$01                                                // 08ab: c9 01
    bcs check_remaining_puzzlepieces_rts                    // 08ad: b0 02
    lda #$00                                                // 08af: a9 00
// Referenced 1 time by $08ad
check_remaining_puzzlepieces_rts:
    rts                                                     // 08b1: 60
    .byt $a9, $00, $60                                      // 08b2: ..`
// Referenced 1 time by $713b
start1:
    lda #$0c                                                // 08b5: a9 0c
    jsr oswrch                                              // 08b7: 20 ee ff
    jmp start2                                              // 08ba: 4c 84 1c
    .byt $ea, $ea, $ea                                      // 08bd: ...
l08c0:

    * = $70a0
// Everything from this point is not usually part of D.REPB, it's based on things that the official release does in separate loader code in D.REPA
boot_envelope2:
    .byt $02, $01, $00, $00, $00, $00, $00, $00             // 70a0: ........
    .byt $40, $01, $ff, $fe, $40, $40                       // 70a8: @...@@
boot:
    lda #$08                                                // 70ae: a9 08
    ldx #$a0                                                // 70b0: a2 a0
    ldy #$70 // 'p'                                         // 70b2: a0 70
    jsr osword                                              // 70b4: 20 f1 ff
    lda #$0a                                                // 70b7: a9 0a
    sta crtc_reg                                            // 70b9: 8d 00 fe
    lda #$20 // ' '                                         // 70bc: a9 20
    sta crtc_data                                           // 70be: 8d 01 fe
    lda #$01                                                // 70c1: a9 01
    sta crtc_reg                                            // 70c3: 8d 00 fe
    lda #$20 // ' '                                         // 70c6: a9 20
    sta crtc_data                                           // 70c8: 8d 01 fe
    lda #$02                                                // 70cb: a9 02
    sta crtc_reg                                            // 70cd: 8d 00 fe
    lda #$2e // '.'                                         // 70d0: a9 2e
    sta crtc_data                                           // 70d2: 8d 01 fe
    lda #$20 // ' '                                         // 70d5: a9 20
    sta l0354                                               // 70d7: 8d 54 03
    lda #$60 // '`'                                         // 70da: a9 60
    sta l034e                                               // 70dc: 8d 4e 03
    lda #$00                                                // 70df: a9 00
    sta l0352                                               // 70e1: 8d 52 03
    lda #$01                                                // 70e4: a9 01
    sta l0353                                               // 70e6: 8d 53 03
    lda #$03                                                // 70e9: a9 03
    sta l0356                                               // 70eb: 8d 56 03
    lda #$06                                                // 70ee: a9 06
    sta l0355                                               // 70f0: 8d 55 03
    sei                                                     // 70f3: 78
    lda #$0c                                                // 70f4: a9 0c
    sta lfe40                                               // 70f6: 8d 40 fe
    lda #$05                                                // 70f9: a9 05
    sta lfe40                                               // 70fb: 8d 40 fe
    cli                                                     // 70fe: 58
    lda #$8c                                                // 70ff: a9 8c
    ldx #$0c                                                // 7101: a2 0c
    jsr osbyte                                              // 7103: 20 f4 ff
// Relocate most of the code from 1d00-7000 to 0d00-6000
    ldy #$00                                                // 7106: a0 00
    sty zp_temp_x                                           // 7108: 84 70
    sty l0072                                               // 710a: 84 72
    lda #$1d                                                // 710c: a9 1d
    sta l0073                                               // 710e: 85 73
    lda #$0d                                                // 7110: a9 0d
    sta zp_temp_y                                           // 7112: 85 71
// Referenced 2 times by $7119, $7123
boot_relocate_0d00_loop:
    lda (l0072),y                                           // 7114: b1 72
    sta (zp_temp_x),y                                       // 7116: 91 70
    iny                                                     // 7118: c8
    bne boot_relocate_0d00_loop                             // 7119: d0 f9
    inc zp_temp_y                                           // 711b: e6 71
    inc l0073                                               // 711d: e6 73
    lda l0073                                               // 711f: a5 73
    cmp #$70 // 'p'                                         // 7121: c9 70
    bne boot_relocate_0d00_loop                             // 7123: d0 ef
// Relocate some code to 0880
    ldx #$3f // '?'                                         // 7125: a2 3f
// Referenced 1 time by $712e
boot_relocate_0880_loop:
    lda l7060,x                                             // 7127: bd 60 70
    sta place_spirit_rts,x                                  // 712a: 9d 80 08
    dex                                                     // 712d: ca
    bpl boot_relocate_0880_loop                             // 712e: 10 f7
// Relocate some code to 0380
    ldx #$5f // '_'                                         // 7130: a2 5f
// Referenced 1 time by $7139
boot_relocate_0380_loop:
    lda l7000,x                                             // 7132: bd 00 70
    sta music_nextnotes,x                                   // 7135: 9d 80 03
    dex                                                     // 7138: ca
    bpl boot_relocate_0380_loop                             // 7139: 10 f7
// Chain to D.REPB's (relocated) start routine
    jmp start1                                              // 713b: 4c b5 08
// Label references by decreasing frequency:
//     map_read:                                          25
//     draw_subtile_at_coords:                            18
//     map_write:                                         14
//     kbd_test:                                          13
//     oswrch:                                            11
//     sound_play:                                        10
//     lookup_subtile_image_data:                         10
//     print_char:                                        10
//     after_hit_checks:                                   9
//     print_bcd_from_69_6a:                               9
//     vsync:                                              8
//     move_monsters_next:                                 7
//     osbyte:                                             7
//     rock_fall_not:                                      6
//     repton_storeposition:                               6
//     repton_erase_and_draw:                              6
//     death:                                              6
//     random:                                             5
//     vdu19:                                              5
//     draw_sprite:                                        5
//     erase_sprite:                                       5
//     read_1_bit:                                         5
//     collect_puzzlepiece_loop_next:                      5
//     dissolve:                                           5
//     repton_check_move_leftright:                        5
//     print_bcd_digit:                                    5
//     print_string:                                       5
//     new_highscore_read_name_loop:                       5
//     scroll:                                             4
//     map_store_obj:                                      4
//     lookup_transporter_loop_next:                       4
//     update_meteors_not_hit_repton:                      4
//     kill_monster:                                       4
//     move_monster_applymovement:                         4
//     check_for_right:                                    4
//     spirit_move:                                        4
//     print_banner:                                       4
//     score_less_than_highscore:                          4
//     osword:                                             4
//     convert_xycoords_to_screen_address:                 3
//     check_audio_keys:                                   3
//     map_read_badx:                                      3
//     reenter_game:                                       3
//     transporter_effect:                                 3
//     draw_monster:                                       3
//     erase_monster:                                      3
//     move_monster_maybe_updown:                          3
//     check_for_down:                                     3
//     music_playnote:                                     2
//     collect_not:                                        2
//     irq2v_return:                                       2
//     draw_sprite_loop:                                   2
//     draw_sprite_next_tile:                              2
//     erase_sprite_loop:                                  2
//     map_store_obj_rts:                                  2
//     map_write_afterwrite:                               2
//     draw_subtile_at_coords_outofrange:                  2
//     unpack_level_strip:                                 2
//     new_level_going_to_0:                               2
//     init_spirits:                                       2
//     scan_for_spirits_loop:                              2
//     place_puzzlepieces_inlevel0:                        2
//     place_puzzlepieces_next:                            2
//     place_transporters_loop:                            2
//     place_transporters_next:                            2
//     collect_key_loop:                                   2
//     scan_rocks_loop:                                    2
//     scan_rocks_next:                                    2
//     update_meteors_rts:                                 2
//     spawn_meteor:                                       2
//     move_moster_done:                                   2
//     rock_move_end:                                      2
//     rock_moved_no_death:                                2
//     rock_moved_no_egg_crack:                            2
//     repton_alreadymoving:                               2
//     repton_check_for_new_leftright:                     2
//     left_pressed:                                       2
//     right_pressed:                                      2
//     repton_check_move_updown:                           2
//     repton_postmove:                                    2
//     repton_stationary:                                  2
//     spirit_move_rts:                                    2
//     init_spirit_direction_loop2_nextdir:                2
//     print_bcd_notzero:                                  2
//     status_screen:                                      2
//     count_remaining_transporters_loop:                  2
//     after_transporter:                                  2
//     end_of_game_screen:                                 2
//     score_greater_than_highscore:                       2
//     additional_palette_setup:                           2
//     boot_relocate_0d00_loop:                            2
//     music_nextnotes:                                    1
//     music_start:                                        1
//     music_playnote_skip:                                1
//     music_playnote_osword:                              1
//     music_playnote_disabled:                            1
//     place_spirit_rts:                                   1
//     place_spirit:                                       1
//     kbd_check_dwq:                                      1
//     kbd_check_w:                                        1
//     kbd_check_q:                                        1
//     check_remaining_puzzlepieces:                       1
//     check_remaining_puzzlepieces_rts:                   1
//     start1:                                             1
//     collect:                                            1
//     enable_event:                                       1
//     disable_event:                                      1
//     sound_play_osword:                                  1
//     sound_play_disabled:                                1
//     convert_xycoords_return:                            1
//     kbd_check_s:                                        1
//     check_audio_keys_rts:                               1
//     check_escape_ingame:                                1
//     check_escape_ingame_rts:                            1
//     draw_sprite_tile_loop:                              1
//     bug_shouldnt_call_here:                             1
//     map_read_bady:                                      1
//     map_write_drawloop_y:                               1
//     map_write_drawloop_x:                               1
//     draw_subtile:                                       1
//     draw_subtile_loop:                                  1
//     draw_character:                                     1
//     draw_character_loop:                                1
//     unpack_level:                                       1
//     unpack_level_loop:                                  1
//     new_level:                                          1
//     new_level_unpack_loop:                              1
//     new_level_rts:                                      1
//     unpack_level_strip_loop:                            1
//     fill_level_strip:                                   1
//     fill_level_strip_loop:                              1
//     new_level_going_to_0_loop:                          1
//     bittest_from_levelstrip_data:                       1
//     bittest_from_levelstrip_data_done:                  1
//     read_5_bits_from_levelstrip_data:                   1
//     read_1_bit_rts:                                     1
//     clear_spirits_loop:                                 1
//     scan_for_spirits_next:                              1
//     place_puzzlepieces_loop:                            1
//     redraw_from_centre_loop:                            1
//     redraw_from_centre_loop2:                           1
//     redraw_from_centre_loop3:                           1
//     transporter_effect_size_loop:                       1
//     transporter_effect_horiz_loop:                      1
//     transporter_effect_vert_loop:                       1
//     transporter_effect_corners:                         1
//     transporter_sound:                                  1
//     push_left:                                          1
//     push_right:                                         1
//     collect_diamond:                                    1
//     collect_key:                                        1
//     collect_key_loop_next:                              1
//     enter_transporter:                                  1
//     save_level_0_state:                                 1
//     lookup_transporter:                                 1
//     lookup_transporter_loop:                            1
//     take_transporter:                                   1
//     collect_puzzlepiece:                                1
//     collect_puzzlepiece_loop:                           1
//     scan_rocks:                                         1
//     update_meteors:                                     1
//     update_meteors_loop:                                1
//     update_meteors_move:                                1
//     update_meteors_check_hit_repton:                    1
//     spawn_meteor_choose_x:                              1
//     spawn_monster:                                      1
//     find_free_monster_loop:                             1
//     find_free_monster_loop_next:                        1
//     move_monsters:                                      1
//     move_monsters_loop:                                 1
//     move_monsters_newborn:                              1
//     move_monsters_alive:                                1
//     check_monster_rock_death:                           1
//     move_monster:                                       1
//     move_monster_ifclear_left:                          1
//     move_monster_leftright:                             1
//     move_monster_ifclear_up:                            1
//     move_monster_updown:                                1
//     rock_move:                                          1
//     rock_move_dont_fall_left:                           1
//     rock_move_dont_fall_right:                          1
//     rock_fall_left:                                     1
//     rock_fall_down:                                     1
//     rock_fall_right:                                    1
//     rock_moved:                                         1
//     repton_move_up:                                     1
//     repton_move_up_draw_top_strip_loop:                 1
//     repton_move_down:                                   1
//     repton_move_down_draw_bot_strip_loop:               1
//     repton_move_left:                                   1
//     repton_move_left_draw_left_strip_loop:              1
//     repton_move_right:                                  1
//     repton_move_right_draw_right_strip_loop:            1
//     random_clear:                                       1
//     random_clear_loop1:                                 1
//     random_clear_loop2:                                 1
//     random_clear_loop3:                                 1
//     clearscreen:                                        1
//     dissolve_loop0:                                     1
//     dissolve_loop1:                                     1
//     dissolve_loop2:                                     1
//     death_loop:                                         1
//     death_delayloop:                                    1
//     death_removereptonloop:                             1
//     death_not_end_of_game:                              1
//     start2:                                             1
//     newgame1:                                           1
//     newgame2:                                           1
//     clear_gamestate_loop:                               1
//     reset_transporters_puzzlepieces_etc:                1
//     spawn_repton:                                       1
//     reenter_after_spawn:                                1
//     repton_move:                                        1
//     repton_check_for_new_updown:                        1
//     up_pressed:                                         1
//     down_pressed:                                       1
//     repton_call_move_right:                             1
//     repton_call_move_down:                              1
//     check_hit_key:                                      1
//     check_hit_skull:                                    1
//     check_hit_endsquare:                                1
//     check_hit_status:                                   1
//     check_hit_transporter:                              1
//     check_hit_puzzlepiece:                              1
//     check_hit_earth:                                    1
//     repton_is_bored:                                    1
//     repton_is_moving:                                   1
//     after_movement_checks:                              1
//     place_spirit2:                                      1
//     allocate_spirit:                                    1
//     find_free_spirit_loop:                              1
//     find_free_spirit_loop_next:                         1
//     update_spirits:                                     1
//     update_spirits_loop:                                1
//     update_spirits_next:                                1
//     spirit_check_hit_repton:                            1
//     spirit_check_cage:                                  1
//     spirit_update_direction:                            1
//     spirit_update_direction_loop:                       1
//     spirit_update_direction_blocked:                    1
//     spirit_update_direction_try_turnleft:               1
//     spirit_update_direction_try_straight:               1
//     spirit_update_direction_straight_right_back_loop:   1
//     spirit_update_direction_nochange:                   1
//     init_spirit_direction:                              1
//     init_spirit_direction_loop:                         1
//     init_spirit_direction_blocked:                      1
//     init_spirit_direction_loop2:                        1
//     init_spirit_direction_loop2_notblocked:             1
//     init_spirit_direction_rts:                          1
//     rock_fall_move_and_set_curvedleft:                  1
//     print_char2:                                        1
//     print_char3:                                        1
//     print_char4:                                        1
//     print_char_rts:                                     1
//     print_bcd_rts:                                      1
//     print_string_loop:                                  1
//     print_string_rts:                                   1
//     print_banner_loop:                                  1
//     transporter_not_taken:                              1
//     count_remaining_puzzlepieces_loop:                  1
//     puzzlepieces_not_taken:                             1
//     print_sound_state:                                  1
//     print_sound_state_on:                               1
//     status_check_for_escape:                            1
//     status_check_for_space:                             1
//     statustrigger:                                      1
//     update_skulls:                                      1
//     update_skulls_diamonds:                             1
//     update_skulls_earth:                                1
//     update_skulls_transporters:                         1
//     update_skulls_puzzlepieces:                         1
//     update_skulls_done2:                                1
//     update_skulls_done:                                 1
//     setup_monsters_diamonds_earth_counters:             1
//     decrement_remaining_earth:                          1
//     decrement_remaining_diamonds:                       1
//     decrement_remaining_monsters:                       1
//     not_victory:                                        1
//     check_for_victory:                                  1
//     victory_clearmapdata1_loop:                         1
//     press_space_for_new_game:                           1
//     escape_quit_game:                                   1
//     end_of_game_wait_for_space:                         1
//     new_highscore:                                      1
//     new_highscore_read_name_addchar:                    1
//     new_highscore_read_name_done:                       1
//     new_highscore_pad_name_loop:                        1
//     print_string_flush_buffers:                         1
//     additional_palette_setup_vdu19:                     1
//     erase_current_monster:                              1
//     found_transporter_in_table:                         1
//     transporter_same_level:                             1
//     move_monster2:                                      1
//     boot_relocate_0880_loop:                            1
//     boot_relocate_0380_loop:                            1
//     osrdch:                                             1
l713e:

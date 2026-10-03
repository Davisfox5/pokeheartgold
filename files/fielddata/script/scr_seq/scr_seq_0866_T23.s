#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "fielddata/script/scr_seq/event_T23.h"
#include "msgdata/msg/msg_0564_T23.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23_000
	scrdef scr_seq_T23_001
	scrdef scr_seq_T23_002
	scrdef scr_seq_T23_003
	scrdef scr_seq_T23_004
	scrdef scr_seq_T23_005
	scrdef scr_seq_T23_006
	scrdef scr_seq_T23_007
	scrdef scr_seq_T23_008
	scrdef scr_seq_T23_009
	scrdef scr_seq_T23_010
	scrdef scr_seq_T23_011
	scrdef scr_seq_T23_012
	scrdef scr_seq_T23_013
	scrdef scr_seq_T23_014
	scrdef scr_seq_T23_015
	scrdef scr_seq_T23_016
	scrdef scr_seq_T23_017
	scrdef scr_seq_T23_018
	scrdef scr_seq_T23_019
	scrdef scr_seq_T23_020
	scrdef_end

scr_seq_T23_004:
	; ===== APOCRYPHA Ch3 fix: once Kurt (or Turk) has cleared the player
	; (WELL_PROGRESS >= 1) the survey crew stands down -- the standing guard
	; on the well chokepoint (434,461) and the blocker pair despawn, and the
	; survey beat disarms. Without this the guard sealed the only route to
	; the well mouth forever (hard deadlock). =====
	compare VAR_APOC_CH3_WELL_PROGRESS, 1
	goto_if_lt _T23_survey_active
	setflag FLAG_UNK_19F
	setflag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	setflag FLAG_AZALEA_HARASSED_CIVILIAN
	setvar VAR_UNK_4080, 1
	end

_T23_survey_active:
	compare VAR_UNK_4080, 0
	goto_if_ne _005F
	setflag FLAG_UNK_19F
	clearflag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	clearflag FLAG_AZALEA_HARASSED_CIVILIAN
_005F:
	end

scr_seq_T23_000:
scr_seq_T23_005:
	simple_npc_msg msg_0564_T23_00003
	end

scr_seq_T23_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0564_T23_00009
	play_cry SPECIES_SLOWPOKE, 0
	npc_msg msg_0564_T23_00010
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; ===== APOCRYPHA Ch3 (3.4e): Kestra catches up by the west exit after the
; badge (VAR_UNK_4075: badge sets 1; here -> 2). She missed everything. =====
scr_seq_T23_002:
	scrcmd_609
	lockall
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	clearflag FLAG_APOC_CH3_HIDE_KESTRA_T23
	show_person obj_T23_kestra
	move_person_facing obj_T23_kestra, 393, 0, VAR_SPECIAL_x8005, DIR_EAST
	apply_movement obj_T23_kestra, _T23_kes_in
	apply_movement obj_player, _T23_face_w
	wait_movement
	buffer_players_name 0
	npc_msg msg_0564_T23_00001
	npc_msg msg_0564_T23_00002
	closemsg
	apply_movement obj_T23_kestra, _T23_kes_off
	wait_movement
	hide_person obj_T23_kestra
	setflag FLAG_APOC_CH3_HIDE_KESTRA_T23
	setvar VAR_UNK_4075, 2
	releaseall
	end

	.balign 4, 0
_T23_kes_in:
	step 15, 1
	step_end
	.balign 4, 0
_T23_face_w:
	step 2, 1
	step_end
	.balign 4, 0
_T23_kes_off:
	step 14, 2
	step_end


; ===== APOCRYPHA Ch3 (3.1c): the polite well-path blocker. Same flag
; machinery as the vanilla harassment beat, none of the shoving. =====
scr_seq_T23_003:
	scrcmd_609
	lockall
	apply_movement obj_T23_rocketm_3, _0350
	wait_movement
	npc_msg msg_0564_T23_00016
	npc_msg msg_0564_T23_00017
	npc_msg msg_0564_T23_00039
	closemsg
	apply_movement obj_T23_gsmiddleman1_2, _0358
	wait_movement
	move_person_facing obj_T23_gsmiddleman1_2, 23, 0, 16, DIR_EAST
	apply_movement obj_T23_rocketm_3, _0374
	wait_movement
	hide_person obj_T23_gsmiddleman1_2
	setflag FLAG_AZALEA_HARASSED_CIVILIAN
	setflag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	clearflag FLAG_UNK_19F
	setvar VAR_UNK_4080, 1
	releaseall
	end

	.balign 4, 0
_0350:
	step 34, 2
	step_end

	.balign 4, 0
_0358:
	step 71, 1
	step 22, 1
	step 63, 2
	step 10, 2
	step 72, 1
	step 18, 9
	step_end

	.balign 4, 0
_0374:
	step 12, 2
	step 33, 1
	step_end

scr_seq_T23_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _039C
	npc_msg msg_0564_T23_00018
	goto _039F

_039C:
	npc_msg msg_0564_T23_00019
_039F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _03C3
	npc_msg msg_0564_T23_00005
	goto _039F

_03C3:
	npc_msg msg_0564_T23_00006
	goto _039F

scr_seq_T23_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_009:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00015, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_011:
	direction_signpost msg_0564_T23_00011, 0, 14, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_012:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00014, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_013:
	direction_signpost msg_0564_T23_00000, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_014:
	simple_npc_msg msg_0564_T23_00004
	end

scr_seq_T23_015:
	simple_npc_msg msg_0564_T23_00007
	end

scr_seq_T23_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _T23_count_post
	npc_msg msg_0564_T23_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T23_count_post:
	npc_msg msg_0564_T23_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0


; ===== APOCRYPHA Ch3 (3.1a): entry unease - the counting townsman. =====
scr_seq_T23_017:
	scrcmd_609
	lockall
	apply_movement obj_T23_gsman1, _T23_intro_alert
	wait_movement
	; the player can be anywhere on the two entry bands (x438/x442,
	; z460-472); he stands at (434,467), so face him toward the player's
	; row - N above, S below, E level - and the player back W at him
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 467
	goto_if_lt _T23_intro_pn
	goto_if_gt _T23_intro_ps
	apply_movement obj_T23_gsman1, _T23_intro_fe
	goto _T23_intro_talk

_T23_intro_pn:
	apply_movement obj_T23_gsman1, _T23_intro_fn
	goto _T23_intro_talk

_T23_intro_ps:
	apply_movement obj_T23_gsman1, _T23_intro_fs
_T23_intro_talk:
	apply_movement obj_player, _T23_face_w
	wait_movement
	npc_msg msg_0564_T23_00020
	npc_msg msg_0564_T23_00021
	closemsg
	apply_movement obj_T23_gsman1, _T23_intro_back
	wait_movement
	setvar VAR_APOC_CH3_AZALEA_SCENE, 1
	releaseall
	end

	.balign 4, 0
_T23_intro_alert:
	step 75, 1
	step_end
	.balign 4, 0
_T23_intro_fn:
	step 0, 1
	step_end
	.balign 4, 0
_T23_intro_fs:
	step 1, 1
	step_end
	.balign 4, 0
_T23_intro_fe:
	step 3, 1
	step_end
	.balign 4, 0
_T23_intro_back:
	step 0, 1
	step_end

; ===== APOCRYPHA Ch3 (3.1e): Turk at the well mouth - the recruit. Yes ->
; both descend (fade + warp into the well; the "blocked steps" are skipped
; via Kurt's service ladder). =====
scr_seq_T23_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0564_T23_00024
	npc_msg msg_0564_T23_00025
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _T23_turk_yes
	npc_msg msg_0564_T23_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T23_turk_yes:
	npc_msg msg_0564_T23_00026
	closemsg
	; Ch3 fix: mark the player recruited BEFORE the warp, or the well
	; entrance bounce (D26R0101_003, requires WELL_PROGRESS >= 1) ejects
	; the player right back out (was a hard blocker).
	setvar VAR_APOC_CH3_WELL_PROGRESS, 1
	setflag FLAG_APOC_CH3_HIDE_TURK_TOWN
	hide_person obj_T23_turk
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_SLOWPOKE_WELL_ENTRANCE, 0, 17, 8, DIR_SOUTH
	releaseall
	end

; ===== APOCRYPHA Ch3 (3.3): Silver arrives at the well mouth. The fade is
; the surfacing-into-daylight beat; he is already there when it lifts. =====
scr_seq_T23_019:
	scrcmd_609
	lockall
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	; Ch3 fix: restaged on real walkable ground (z457-458 x431-434 is cliff
	; face). Player surfaces onto (433/434,455); the trio waits on the z456
	; inner row: Silver SE of the player, Kurt and Turk to the west.
	clearflag FLAG_APOC_CH3_HIDE_SILVER_T23
	show_person obj_T23_gsrivel
	move_person_facing obj_T23_gsrivel, 434, 0, 456, DIR_NORTH
	clearflag FLAG_APOC_CH3_HIDE_KURT_T23
	show_person obj_T23_kurt
	move_person_facing obj_T23_kurt, 431, 0, 456, DIR_EAST
	clearflag FLAG_APOC_CH3_HIDE_TURK_TOWN
	show_person obj_T23_turk
	move_person_facing obj_T23_turk, 432, 0, 456, DIR_WEST
	apply_movement obj_player, _T23_silver_face_s
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	; Kurt (431,456) faces E, Turk (432,456) faces W: adjacent, mutual
	npc_msg msg_0564_T23_00028
	closemsg
	npc_msg msg_0564_T23_00029
	closemsg
	; Silver steps up; the half-beat pause before "...You." is the flicker.
	; Turk turns E to watch him arrive at (433,456).
	apply_movement obj_T23_gsrivel, _T23_silver_up
	apply_movement obj_T23_turk, _T23_face_e
	wait_movement
	wait 45, VAR_SPECIAL_RESULT
	buffer_players_name 0
	npc_msg msg_0564_T23_00030
	npc_msg msg_0564_T23_00031
	npc_msg msg_0564_T23_00032
	npc_msg msg_0564_T23_00033
	npc_msg msg_0564_T23_00034
	closemsg
	; he leaves the way champions do - cleanly, unexplained. No legal
	; walking exit from the mouth complex exists (the only gateway tile
	; (434,461) is occupied), so the exit happens under a fade.
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_T23_gsrivel
	setflag FLAG_APOC_CH3_HIDE_SILVER_T23
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	; Kurt turns to the player (NE of him) for his line
	apply_movement obj_T23_kurt, _T23_face_e
	wait_movement
	npc_msg msg_0564_T23_00035
	closemsg
	; Turk takes the tile Silver vacated, square under the player, mutual
	apply_movement obj_T23_turk, _T23_turk_step_up
	wait_movement
	npc_msg msg_0564_T23_00036
	closemsg
	; Kurt heads home; Turk heads for the gym - same fade idiom, no legal
	; walking exit from the well mouth
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_T23_kurt
	setflag FLAG_APOC_CH3_HIDE_KURT_T23
	hide_person obj_T23_turk
	setflag FLAG_APOC_CH3_HIDE_TURK_TOWN
	clearflag FLAG_APOC_CH3_HIDE_TURK_GYM
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setflag FLAG_APOC_CH3_SILVER_MET
	setvar VAR_APOC_CH3_AZALEA_SCENE, 3
	releaseall
	end

	.balign 4, 0
_T23_silver_face_s:
	step 1, 1
	step_end
	.balign 4, 0
_T23_silver_up:
	; from (434,456): sidestep to face the player at (433,455) head-on
	step 14, 1
	step 0, 1
	step_end
	.balign 4, 0
_T23_face_e:
	step 3, 1
	step_end
	.balign 4, 0
_T23_turk_step_up:
	; from (432,456): one tile east onto (433,456), then face the player
	step 15, 1
	step 0, 1
	step_end

; the one that isn't right (before and after the well)
scr_seq_T23_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _T23_wrong_post
	npc_msg msg_0564_T23_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T23_wrong_post:
	npc_msg msg_0564_T23_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

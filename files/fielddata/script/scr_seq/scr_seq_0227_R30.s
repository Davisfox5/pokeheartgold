#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30.h"
#include "msgdata/msg/msg_0375_R30.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R30_000
	scrdef scr_seq_R30_001
	scrdef scr_seq_R30_002
	scrdef scr_seq_R30_003
	scrdef scr_seq_R30_004
	scrdef scr_seq_R30_005
	scrdef scr_seq_R30_006
	scrdef scr_seq_R30_007
	scrdef scr_seq_R30_008
	scrdef scr_seq_R30_009
	scrdef scr_seq_R30_010
	scrdef scr_seq_R30_011
	scrdef scr_seq_R30_012
	scrdef_end

; APOCRYPHA: Elm's panic call does not exist (no stolen starter, no rival plot).
scr_seq_R30_001:
	end

scr_seq_R30_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0375_R30_00000
	closemsg
	apply_movement obj_R30_tsure_poke_static_rattata, _0088
	wait_movement
	apply_movement obj_R30_tsure_poke_static_pidgey, _0090
	wait_movement
	play_se SEQ_SE_DP_SELECT
	faceplayer
	npc_msg msg_0375_R30_00001
	closemsg
	apply_movement obj_R30_gsboy2_3, _0098
	wait_movement
	releaseall
	end

	.balign 4, 0
_0088:
	step 48, 3
	step_end

	.balign 4, 0
_0090:
	step 49, 2
	step_end

	.balign 4, 0
_0098:
	step 32, 1
	step_end

scr_seq_R30_002:
	; ===== APOCRYPHA Ch1 fix: this scene shares VAR_SCENE_ROUTE_30_OW==0
	; with the catch-demo coords. If it fired during the Scene-2 rescue
	; detour it set OW=1 and permanently disarmed the demo -> no starter,
	; softlock. Ch1-inert until the catch demo is done. =====
	goto_if_unset FLAG_APOC_CATCH_TUT_DONE, _R30_apricorn_skip
	scrcmd_609
	lockall
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	show_person obj_R30_gsmiddleman1
	apply_movement obj_R30_gsmiddleman1, _01B0
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_R30_gsmiddleman1, _01C4
	wait_movement
	npc_msg msg_0375_R30_00005
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4000, 558
	goto_if_ne _010A
	apply_movement obj_player, _01D4
	goto _0148

_010A:
	compare VAR_TEMP_x4000, 559
	goto_if_ne _0125
	apply_movement obj_player, _01E8
	goto _0148

_0125:
	compare VAR_TEMP_x4000, 560
	goto_if_ne _0140
	apply_movement obj_player, _01FC
	goto _0148

_0140:
	apply_movement obj_player, _0210
_0148:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0375_R30_00006
	giveitem_no_check ITEM_APRICORN_BOX, 1
	npc_msg msg_0375_R30_00008
	closemsg
	apply_movement obj_R30_gsmiddleman1, _01CC
	wait_movement
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_R30_gsmiddleman1, _01B8
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person obj_R30_gsmiddleman1
	setflag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	releaseall
	setflag FLAG_GOT_APRICORN_BOX
	setvar VAR_SCENE_ROUTE_30_OW, 1
	end

_R30_apricorn_skip:
	end

	.balign 4, 0
_01B0:
	step 13, 1
	step_end

	.balign 4, 0
_01B8:
	step 12, 1
	step 69, 1
	step_end

	.balign 4, 0
_01C4:
	step 35, 1
	step_end

	.balign 4, 0
_01CC:
	step 32, 1
	step_end

	.balign 4, 0
_01D4:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 2
	step_end

	.balign 4, 0
_01E8:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 3
	step_end

	.balign 4, 0
_01FC:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 4
	step_end

	.balign 4, 0
_0210:
	step 13, 2
	step 34, 1
	step 63, 2
	step 14, 5
	step_end

scr_seq_R30_003:
	simple_npc_msg msg_0375_R30_00013
	end

; APOCRYPHA: Mom's rival-naming follow-up call does not exist. The setvar
; stays so the coord trigger (val 1) can't re-fire if the var ever reaches 1.
scr_seq_R30_004:
	setvar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	end

scr_seq_R30_005:
	direction_signpost msg_0375_R30_00009, 1, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_006:
	direction_signpost msg_0375_R30_00010, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_007:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0375_R30_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0375_R30_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_009:
	goto_if_set FLAG_GOT_POKEDEX, _02D5
	simple_npc_msg msg_0375_R30_00002
	end

_02D5:
	simple_npc_msg msg_0375_R30_00003
	end

scr_seq_R30_010:
	simple_npc_msg msg_0375_R30_00004
	end

scr_seq_R30_011:
	goto_if_unset FLAG_GOT_STARTER, _R30_ch2_intro_end
	; Ch1 fix: the New Bark Pokedex leg is required before Ch2 opens --
	; the ceremony send-off points east, this enforces it.
	goto_if_unset FLAG_GOT_POKEDEX, _R30_ch2_intro_end
	goto_if_set FLAG_APOC_CH2_ROUTE30_INTRO_DONE, _R30_ch2_intro_end
	scrcmd_609
	lockall
	; Ch2 fix: Kestra at (548,384) is approachable from three sides --
	; branch the face-off on where the player stands, like the rescue
	; scene below does, instead of assuming the southern walk-up.
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 547
	goto_if_eq _R30_ch2_from_w
	compare VAR_TEMP_x4001, 383
	goto_if_eq _R30_ch2_from_n
	; player at (548,385), south of her: player up, Kestra down
	apply_movement obj_player, _R30_face_n
	apply_movement obj_R30_kestra, _R30_face_s
	goto _R30_ch2_greet

_R30_ch2_from_w:
	; player at (547,384), west of her: player right, Kestra left
	apply_movement obj_player, _R30_face_e
	apply_movement obj_R30_kestra, _R30_face_w
	goto _R30_ch2_greet

_R30_ch2_from_n:
	; player at (548,383), north of her: player down, Kestra up
	apply_movement obj_player, _R30_face_s
	apply_movement obj_R30_kestra, _R30_face_n
_R30_ch2_greet:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0375_R30_00014
	npc_msg msg_0375_R30_00015
	npc_msg msg_0375_R30_00016
	closemsg
	; she heads north up the x548 column -- unless the player came from
	; the north and is standing on it, then she sidesteps west first and
	; takes the x547 column instead.
	compare VAR_TEMP_x4001, 383
	goto_if_eq _R30_ch2_exit_via_w
	apply_movement obj_R30_kestra, _R30_kestra_run_north
	goto _R30_ch2_exit_done

_R30_ch2_exit_via_w:
	apply_movement obj_R30_kestra, _R30_kestra_run_north_w
_R30_ch2_exit_done:
	wait_movement
	setflag FLAG_APOC_CH2_ROUTE30_INTRO_DONE
	; Ch2 fix: re-set the object's spawn flag too, or Kestra respawns here
	; as a mute NPC on every R30 re-entry (hide_person is session-only).
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_1
	hide_person obj_R30_kestra
	releaseall
	end

_R30_ch2_intro_end:
	end

	.balign 4, 0
_R30_face_n:
	step 0, 1
	step_end

	.balign 4, 0
_R30_face_s:
	step 1, 1
	step_end

	.balign 4, 0
_R30_face_w:
	step 2, 1
	step_end

	.balign 4, 0
_R30_face_e:
	step 3, 1
	step_end

	.balign 4, 0
_R30_kestra_run_north:
	step 12, 6
	step_end

	.balign 4, 0
; north-approach variant: the player occupies (548,383), so she steps west
; to (547,384) and runs the parallel x547 column up to (547,378).
_R30_kestra_run_north_w:
	step 14, 1
	step 12, 6
	step_end

	.balign 4, 0
; ===== APOCRYPHA Ch1: the catch tutorial, in Route 30's first tall grass. Kestra
; spins in place searching the grass at (552,375); talking to her or stepping onto
; the tile just N (552,374) or S (552,376) of her trips this. =====
scr_seq_R30_012:
	goto_if_set FLAG_APOC_CATCH_TUT_DONE, _R30_catch_end
	scrcmd_609
	lockall
	; Gold and Kestra leave town the moment the rescue starts: retire their T21
	; plaza sprites so only the R30 rescue copies exist from here on. Without
	; these flags the pair respawn at their T21 bases when the post-catch warp
	; reloads the map, and the tour's show_person then stacks DUPLICATES on top
	; of the live base copies (the "Gold still standing in the plaza" bug). The
	; tour re-creates both cleanly at the north gate (clearflag + show + move).
	setflag FLAG_HIDE_CHERRYGROVE_GOLD
	setflag FLAG_HIDE_CHERRYGROVE_FRIEND
	; Fires by TALKING to Kestra or stepping onto the coord tile just N or S of her at
	; (552,375). The player is already adjacent, so just face off - which way each of
	; them turns depends on whether the player is south (z>=376) or north (z<=374).
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 376
	goto_if_ge _R30_catch_from_s
	; player NORTH of Kestra: player looks down, Kestra looks up
	apply_movement obj_player, _R30_face_s
	apply_movement obj_R30_kestra_rescue, _R30_face_n
	goto _R30_catch_greet
_R30_catch_from_s:
	; player SOUTH of Kestra (the natural walk-up the route): player up, Kestra down
	apply_movement obj_player, _R30_face_n
	apply_movement obj_R30_kestra_rescue, _R30_face_s
_R30_catch_greet:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0375_R30_00017
	closemsg
	; she spots one: '!' over her, then the wild Rattata reveals deeper in the grass
	apply_movement obj_R30_kestra_rescue, _R30_catch_alert
	wait_movement
	clearflag FLAG_UNK_234
	show_person obj_R30_rattata_rescue
	apply_movement obj_R30_rattata_rescue, _R30_catch_stir
	wait_movement
	npc_msg msg_0375_R30_00018
	closemsg
	; Gold rushes up from the south (behind the player) - too late to stop them
	clearflag FLAG_UNK_239
	show_person obj_R30_gold_rescue
	apply_movement obj_R30_gold_rescue, _R30_catch_goldrun
	wait_movement
	npc_msg msg_0375_R30_00019
	closemsg
	; Gold's demo catch, played for real: he turns to the wild one (east) and the
	; engine catching_tutorial takes over - the kids (and player) watch on the
	; battle screen as Gold, with NO Pokemon of his own, one-shots the catch with
	; a single bare-handed Poke Ball throw (TUTORIAL|SAFARI staging, forced catch;
	; see BattleSetup_New_Tutorial). The OW Rattata is hidden as the battle swirl
	; starts - from here it lives in the battle, then in Gold's ball.
	apply_movement obj_R30_gold_rescue, _R30_gold_throw
	wait_movement
	wait 10, VAR_SPECIAL_RESULT
	hide_person obj_R30_rattata_rescue
	setflag FLAG_UNK_234
	catching_tutorial
	; back on the field: the ball's shut. Gold savors it facing the catch spot,
	; then turns back to the kids for the lecture.
	npc_msg msg_0375_R30_00020
	closemsg
	apply_movement obj_R30_gold_rescue, _R30_face_n
	wait_movement
	npc_msg msg_0375_R30_00021
	closemsg
	; Ch1 fix: this was the only ball hand-out in the chapter and it was
	; never wired -- Gold covers the kids' first five Poke Balls here.
	npc_msg msg_0375_R30_00023
	closemsg
	giveitem_no_check ITEM_POKE_BALL, 5
	setflag FLAG_APOC_CATCH_TUT_DONE
	hide_person obj_R30_kestra_rescue
	hide_person obj_R30_gold_rescue
	setflag FLAG_UNK_239
	; fade + warp back to Cherrygrove's NORTH GATE with cg_ow==2: the T21 scene
	; table (scr_seq_0623_T21_hdr.s) auto-starts the grand tour (T21_018) on map
	; load - it stages Kestra+Gold around the player under this held black,
	; fades in, walks the town tour, and hands off to the starter ceremony.
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_CHERRYGROVE, 0, 549, 387, DIR_SOUTH
	releaseall
	end
_R30_catch_end:
	end

	.balign 4, 0
_R30_catch_step_e:
	step 15, 1
	step_end
	.balign 4, 0
_R30_catch_step_w:
	step 14, 1
	step_end
	.balign 4, 0
; coord-trigger entry only: player walks up from the path (z344) into the grass to
; Kestra (z331). 13 tiles, all under lockall so no wild encounters roll en route.
_R30_catch_approach:
	step 12, 13
	step_end
	.balign 4, 0
; Kestra turns EAST toward the wild one deeper in the grass and flags it with an '!'
_R30_catch_alert:
	step 3, 1
	step 75, 1
	step_end
	.balign 4, 0
; the wild one reacts (notices the trio)
_R30_catch_stir:
	step 75, 1
	step_end
	.balign 4, 0
; Gold hurries up from Cherrygrove (spawn 552,380) to (552,377), next to the player.
; STEP_UP (12), not RUN_UP (16) - RUN_* movement types don't execute for NPCs.
_R30_catch_goldrun:
	step 12, 3
	step_end
	.balign 4, 0
; Gold turns east toward the wild Rattata to lead into his demo catch
_R30_gold_throw:
	step 3, 1
	step_end
	.balign 4, 0

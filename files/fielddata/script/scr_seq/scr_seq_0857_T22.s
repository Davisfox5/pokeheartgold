#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
#include "msgdata/msg/msg_0556_T22.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22_000
	scrdef scr_seq_T22_001
	scrdef scr_seq_T22_002
	scrdef scr_seq_T22_003
	scrdef scr_seq_T22_004
	scrdef scr_seq_T22_005
	scrdef scr_seq_T22_006
	scrdef scr_seq_T22_007
	scrdef scr_seq_T22_008
	scrdef scr_seq_T22_009
	scrdef scr_seq_T22_010
	scrdef scr_seq_T22_011
	scrdef scr_seq_T22_012
	scrdef scr_seq_T22_013
	scrdef scr_seq_T22_014
	scrdef scr_seq_T22_015
	scrdef scr_seq_T22_016
	scrdef scr_seq_T22_017
	scrdef scr_seq_T22_018
	scrdef_end

; ===== APOCRYPHA: Elm gives no egg -- the vanilla pick-up-the-egg phone call
; is retired (its OW==1 scene row is also removed from the hdr, which now
; belongs to the Ch2 tower commotion coord). =====
scr_seq_T22_000:
	end

; ===== APOCRYPHA: the kimono girl's mystic beat. Rewired from the egg
; thank-you (OW==3, which Ch2 now uses for the Kestra battle) to OW==4,
; right after Kestra runs off; the practicum clears her hide flag so she
; is standing at (474,261) watching. Ends at OW==5 so it fires once. =====
scr_seq_T22_004:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	apply_movement obj_T22_dancer, _00CC
	wait_movement
	npc_msg msg_0556_T22_00013
	closemsg
	apply_movement obj_T22_dancer, _00DC
	wait_movement
	npc_msg msg_0556_T22_00014
	closemsg
	apply_movement obj_T22_dancer, _00E4
	wait_movement
	npc_msg msg_0556_T22_00015
	closemsg
	apply_movement obj_T22_dancer, _0104
	wait_movement
	npc_msg msg_0556_T22_00016
	closemsg
	apply_movement obj_T22_dancer, _00F4
	wait_movement
	callstd std_fade_end_kimono_girl_music
	hide_person obj_T22_dancer
	setflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	releaseall
	setvar VAR_SCENE_VIOLET_CITY_OW, 5
	end

	.balign 4, 0
_00CC:
	step 75, 1
	step 14, 5
	step 12, 1
	step_end

	.balign 4, 0
_00DC:
	step 12, 1
	step_end

	.balign 4, 0
_00E4:
	step 71, 1
	step 9, 1
	step 72, 1
	step_end

	.balign 4, 0
_00F4:
	step 13, 2
	step 14, 1
	step 13, 7
	step_end

	.balign 4, 0
_0104:
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step_end

scr_seq_T22_005:
	simple_npc_msg msg_0556_T22_00026
	end

; ===== APOCRYPHA Ch2: Earl's vanilla school-escort is retired; his tour is
; the one-shot arrival scene (T22_015). This is his plain plaza chat. =====
scr_seq_T22_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0556_T22_00041
	wait_button_or_walk_away
	closemsg
	releaseall
	end


scr_seq_T22_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call _0ADD
	call _0A57
	compare VAR_SPECIAL_x8006, 1
	goto_if_eq _06BC
	npc_msg msg_0556_T22_00017
	closemsg
	call _0ADD
	releaseall
	end

_06BC:
	npc_msg msg_0556_T22_00018
_06BF:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8000, 1
	goto_if_ne _06DE
	menu_item_add 205, 255, 0
_06DE:
	compare VAR_SPECIAL_x8001, 1
	goto_if_ne _06F3
	menu_item_add 206, 255, 1
_06F3:
	compare VAR_SPECIAL_x8002, 1
	goto_if_ne _0708
	menu_item_add 207, 255, 2
_0708:
	compare VAR_SPECIAL_x8003, 1
	goto_if_ne _071D
	menu_item_add 208, 255, 3
_071D:
	menu_item_add 126, 255, 4
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _0769
	case 1, _080D
	case 2, _08B1
	case 3, _0955
	goto _09F9

_0769:
	npc_msg msg_0556_T22_00021
	goto_if_no_item_space ITEM_CHERI_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_PECHA_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_LEPPA_BERRY, 1, _0A08
	giveitem_no_check ITEM_CHERI_BERRY, 1
	giveitem_no_check ITEM_PECHA_BERRY, 1
	giveitem_no_check ITEM_LEPPA_BERRY, 1
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_080D:
	npc_msg msg_0556_T22_00022
	goto_if_no_item_space ITEM_ORAN_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_CHESTO_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_WIKI_BERRY, 1, _0A08
	giveitem_no_check ITEM_ORAN_BERRY, 1
	giveitem_no_check ITEM_CHESTO_BERRY, 1
	giveitem_no_check ITEM_WIKI_BERRY, 1
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_08B1:
	npc_msg msg_0556_T22_00023
	goto_if_no_item_space ITEM_ASPEAR_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_SITRUS_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_IAPAPA_BERRY, 1, _0A08
	giveitem_no_check ITEM_ASPEAR_BERRY, 1
	giveitem_no_check ITEM_SITRUS_BERRY, 1
	giveitem_no_check ITEM_IAPAPA_BERRY, 1
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_0955:
	npc_msg msg_0556_T22_00024
	goto_if_no_item_space ITEM_RAWST_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_LUM_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_AGUAV_BERRY, 1, _0A08
	giveitem_no_check ITEM_RAWST_BERRY, 1
	giveitem_no_check ITEM_LUM_BERRY, 1
	giveitem_no_check ITEM_AGUAV_BERRY, 1
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_09F9:
	npc_msg msg_0556_T22_00020
	closemsg
	call _0ADD
	releaseall
	end

_0A08:
	npc_msg msg_0556_T22_00025
	closemsg
	call _0ADD
	releaseall
	end

_0A17:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call _0A57
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0A51
	npc_msg msg_0556_T22_00019
	goto _06BF

_0A51:
	goto _09F9

_0A57:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A78
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
_0A78:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A99
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
_0A99:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0ABA
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
_0ABA:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0ADB
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
_0ADB:
	return

_0ADD:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0AFE
	apply_movement obj_T22_juggrer, _0B28
	wait_movement
	goto _0B25

_0AFE:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0B1B
	apply_movement obj_T22_juggrer, _0B6C
	wait_movement
	goto _0B25

_0B1B:
	apply_movement obj_T22_juggrer, _0BB0
	wait_movement
_0B25:
	return

	.balign 4, 0
_0B28:
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step_end

	.balign 4, 0
_0B6C:
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step_end

	.balign 4, 0
_0BB0:
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step_end

; ===== APOCRYPHA Ch2 (2.4a): the Sprout Tower commotion. Ren has been caught
; spooking the tower's Bellsprout; a sage fumes at the doors, Earl deputizes
; the player as mediator, and Ren and Kestra slink inside ahead of you.
; Cast: sage (486,230) S / Ren (486,231) N / Kestra (488,231) N / Earl (485,232) E.
; Trigger band (483-491, 234) at VAR_SCENE_VIOLET_CITY_OW == 1 -- the full
; walkable cross-section, so the commotion can't be skirted. =====
scr_seq_T22_002:
	scrcmd_609
	lockall
	apply_movement obj_player, _T22_com_up
	wait_movement
	apply_movement obj_T22_sage, _T22_com_alert
	wait_movement
	npc_msg msg_0556_T22_00032
	closemsg
	apply_movement obj_T22_earl_tower, _T22_com_face_s
	wait_movement
	npc_msg msg_0556_T22_00033
	closemsg
	apply_movement obj_T22_ren, _T22_com_face_s
	wait_movement
	npc_msg msg_0556_T22_00034
	closemsg
	apply_movement obj_T22_kestra_tower, _T22_com_face_s
	wait_movement
	npc_msg msg_0556_T22_00035
	closemsg
	npc_msg msg_0556_T22_00036
	closemsg
	apply_movement obj_T22_ren, _T22_com_ren_in
	wait_movement
	hide_person obj_T22_ren
	setflag FLAG_APOC_CH2_HIDE_REN_TOWERDOORS
	apply_movement obj_T22_kestra_tower, _T22_com_kestra_in
	wait_movement
	hide_person obj_T22_kestra_tower
	setflag FLAG_APOC_CH2_HIDE_KESTRA_TOWERDOORS
	; Ch2 fix: Earl's old exit walked S through the fence at x485. He now
	; sidesteps E and takes the open x486 column -- unless the player fired
	; the band at x486 and is standing on that lane at (486,233), in which
	; case his exit happens under a brief fade instead.
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 486
	goto_if_eq _T22_com_earl_fade
	apply_movement obj_T22_earl_tower, _T22_com_earl_out
	wait_movement
	hide_person obj_T22_earl_tower
	goto _T22_com_earl_done

_T22_com_earl_fade:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_T22_earl_tower
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_T22_com_earl_done:
	setflag FLAG_APOC_CH2_HIDE_EARL_TOWERDOORS
	; Ch2 fix (FIX 7): the commotion is what sends Ren and Kestra inside --
	; reveal their Sprout Tower 2F copies now.
	clearflag FLAG_APOC_CH2_HIDE_RENKESTRA_TOWER
	setvar VAR_SCENE_VIOLET_CITY_OW, 2
	releaseall
	end

	.balign 4, 0
_T22_com_up:
	step 12, 1
	step_end
	.balign 4, 0
_T22_com_alert:
	step 75, 1
	step_end
	.balign 4, 0
_T22_com_face_s:
	step 1, 1
	step_end
	.balign 4, 0
; Ren ducks into the tower: east onto the door column, then up to the doors
_T22_com_ren_in:
	step 15, 1
	step 12, 3
	step_end
	.balign 4, 0
_T22_com_kestra_in:
	step 14, 1
	step 12, 3
	step_end
	.balign 4, 0
; Earl bustles back south toward campus: E to the open x486 column, then S
; ((485,234)/(485,235) are fence tiles -- the old straight-S path clipped them)
_T22_com_earl_out:
	step 15, 1
	step 13, 3
	step_end


scr_seq_T22_006:
	simple_npc_msg msg_0556_T22_00027
	end

scr_seq_T22_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_008:
	direction_signpost msg_0556_T22_00009, 0, 13, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_009:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00010, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_011:
	simple_npc_msg msg_0556_T22_00005
	end

scr_seq_T22_012:
	simple_npc_msg msg_0556_T22_00006
	end

scr_seq_T22_013:
	simple_npc_msg msg_0556_T22_00007
	end

scr_seq_T22_014:
	simple_npc_msg msg_0556_T22_00008
	end
	.balign 4, 0


; ===== APOCRYPHA Ch2 (2.3a): Earl's arrival tour. Fires on the full walkable
; column just west of the R31 gate, (510,268)-(510,272), at
; VAR_SCENE_VIOLET_CITY_OW == 0; the player is walked to the (510,270) anchor.
; Earl (508,270) and Kestra (508,269) wait on the road facing the gate. =====
scr_seq_T22_015:
	scrcmd_609
	lockall
	; Ch2 fix: the trigger band spans the whole gate cross-section now,
	; (510,268)-(510,272). Walk the player to the scene anchor (510,270)
	; first so Earl and Kestra's staging lines up whichever lane fired it
	; (same normalize-then-stage idiom as R30's apricorn scene).
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 268
	goto_if_eq _T22_arr_norm_s2
	compare VAR_TEMP_x4001, 269
	goto_if_eq _T22_arr_norm_s1
	compare VAR_TEMP_x4001, 271
	goto_if_eq _T22_arr_norm_n1
	compare VAR_TEMP_x4001, 272
	goto_if_eq _T22_arr_norm_n2
	; z == 270: already on the anchor
	goto _T22_arr_staged

_T22_arr_norm_s2:
	apply_movement obj_player, _T22_arr_walk_s2
	goto _T22_arr_norm_wait

_T22_arr_norm_s1:
	apply_movement obj_player, _T22_arr_walk_s1
	goto _T22_arr_norm_wait

_T22_arr_norm_n1:
	apply_movement obj_player, _T22_arr_walk_n1
	goto _T22_arr_norm_wait

_T22_arr_norm_n2:
	apply_movement obj_player, _T22_arr_walk_n2
_T22_arr_norm_wait:
	wait_movement
_T22_arr_staged:
	apply_movement obj_player, _T22_arr_face_w
	apply_movement obj_T22_gsbigman, _T22_arr_step_e
	apply_movement obj_T22_kestra, _T22_arr_step_e
	wait_movement
	npc_msg msg_0556_T22_00028
	npc_msg msg_0556_T22_00029
	npc_msg msg_0556_T22_00030
	closemsg
	npc_msg msg_0556_T22_00031
	closemsg
	apply_movement obj_T22_kestra, _T22_arr_kestra_off
	wait_movement
	hide_person obj_T22_kestra
	setflag FLAG_APOC_CH2_HIDE_KESTRA_GATE
	apply_movement obj_T22_gsbigman, _T22_arr_earl_off
	wait_movement
	; Ch2 fix: hide only for this session -- FLAG_UNK_19A is Earl's own
	; eventFlag and setting it here retired his plaza dean chat forever.
	; On the next map load he respawns at his JSON spot (back on campus).
	hide_person obj_T22_gsbigman
	; Ren's post-quest campus spot stays clear until the tower is settled,
	; and Kestra's post-practicum challenge spot until Roxanne clears you
	setflag FLAG_APOC_CH2_HIDE_REN_CAMPUS
	setflag FLAG_APOC_CH2_HIDE_KESTRA_GYMFRONT
	setvar VAR_SCENE_VIOLET_CITY_OW, 1
	releaseall
	end

	.balign 4, 0
_T22_arr_face_w:
	step 2, 1
	step_end
	.balign 4, 0
_T22_arr_step_e:
	step 15, 1
	step_end
	.balign 4, 0
; player normalization walks down the x510 column to the (510,270) anchor
_T22_arr_walk_s1:
	step 13, 1
	step_end
	.balign 4, 0
_T22_arr_walk_s2:
	step 13, 2
	step_end
	.balign 4, 0
_T22_arr_walk_n1:
	step 12, 1
	step_end
	.balign 4, 0
_T22_arr_walk_n2:
	step 12, 2
	step_end
	.balign 4, 0
; Kestra dashes west down the road toward the tower
_T22_arr_kestra_off:
	step 14, 5
	step_end
	.balign 4, 0
; Earl bustles off toward campus
_T22_arr_earl_off:
	step 14, 4
	step_end

; sage at the tower doors (talk)
scr_seq_T22_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_FLASH_GIVEN, _T22_sage_after
	npc_msg msg_0556_T22_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T22_sage_after:
	npc_msg msg_0556_T22_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; Ren on campus after the tower is settled (2.4e): thanks + Oran Berries
scr_seq_T22_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_REN_THANKS_DONE, _T22_ren_after
	npc_msg msg_0556_T22_00039
	npc_msg msg_0556_T22_00042
	giveitem_no_check ITEM_ORAN_BERRY, 3
	npc_msg msg_0556_T22_00040
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_REN_THANKS_DONE
	releaseall
	end

_T22_ren_after:
	npc_msg msg_0556_T22_00040
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

; ===== APOCRYPHA Ch2 (2.6): the first Kestra rival battle, right outside the
; practice hall. Fires stepping off the hall doorstep at OW == 3 (set when
; Roxanne's practicum is cleared). Slots 1-3 are Kestra's starter-countering
; teams; a loss white-outs with OW still 3, so it re-fires until won. =====
scr_seq_T22_018:
	scrcmd_609
	lockall
	apply_movement obj_T22_kestra_gymfront, _T22_kb_face_w
	apply_movement obj_player, _T22_kb_face_e
	wait_movement
	buffer_players_name 0
	npc_msg msg_0556_T22_00043
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, SPECIES_CHIKORITA
	goto_if_eq _T22_kb_vs_chiko
	compare VAR_SPECIAL_RESULT, SPECIES_CYNDAQUIL
	goto_if_eq _T22_kb_vs_cynda
	npc_msg msg_0556_T22_00046
	closemsg
	trainer_battle TRAINER_RIVAL_SILVER_3, 0, 0, 0
	goto _T22_kb_check

_T22_kb_vs_chiko:
	npc_msg msg_0556_T22_00044
	closemsg
	trainer_battle TRAINER_RIVAL_SILVER, 0, 0, 0
	goto _T22_kb_check

_T22_kb_vs_cynda:
	npc_msg msg_0556_T22_00045
	closemsg
	trainer_battle TRAINER_RIVAL_SILVER_2, 0, 0, 0
_T22_kb_check:
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _T22_kb_lost
	buffer_players_name 0
	npc_msg msg_0556_T22_00047
	npc_msg msg_0556_T22_00048
	closemsg
	; off she goes, south toward Route 32 and Azalea
	apply_movement obj_T22_kestra_gymfront, _T22_kb_run_off
	wait_movement
	hide_person obj_T22_kestra_gymfront
	setflag FLAG_APOC_CH2_HIDE_KESTRA_GYMFRONT
	setflag FLAG_APOC_CH2_KESTRA_BATTLE_DONE
	setvar VAR_SCENE_VIOLET_CITY_OW, 4
	releaseall
	end

_T22_kb_lost:
	white_out
	releaseall
	end

	.balign 4, 0
_T22_kb_face_w:
	step 2, 1
	step_end
	.balign 4, 0
_T22_kb_face_e:
	step 3, 1
	step_end
	.balign 4, 0
_T22_kb_run_off:
	step 13, 6
	step_end

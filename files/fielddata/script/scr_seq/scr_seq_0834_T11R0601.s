#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0601.h"
#include "msgdata/msg/msg_0535_T11R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0601_000
	scrdef scr_seq_T11R0601_001
	scrdef scr_seq_T11R0601_002
	scrdef scr_seq_T11R0601_003
	scrdef scr_seq_T11R0601_004
	scrdef scr_seq_T11R0601_005
	scrdef scr_seq_T11R0601_006
	scrdef scr_seq_T11R0601_007
	scrdef scr_seq_T11R0601_008
	scrdef_end

scr_seq_T11R0601_006:
	scrcmd_582 MAP_GOLDENROD, 1290, 209
	goto_if_set FLAG_RESTORED_POWER, _003F
	goto _0045

_003F:
	setvar VAR_UNK_411D, 0
_0045:
	setflag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
	check_registered_phone_number PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_eq _007E
	get_phone_book_rematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _007E
	goto_if_set FLAG_TRADE_LT_SURGE_PIKACHU, _007E
	clearflag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
_007E:
	end

scr_seq_T11R0601_005:
	goto_if_set FLAG_RESTORED_POWER, _008D
	; Ch4: the player arrives by train on Mel's pass before the Power Plant
	; is fixed -- (14,9) is the only corridor tile, so step the guard aside
	; or both Mel's walk-off and the player are walled in on the platform
	goto_if_set FLAG_APOC_CH4_RIVAL_SENDOFF_DONE, _008D
	end

_008D:
	move_person_facing obj_T11R0601_policeman, 12, 0, 7, DIR_EAST
	end

scr_seq_T11R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RESTORED_POWER, _00B9
	npc_msg msg_0535_T11R0601_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00B9:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _00D7
	npc_msg msg_0535_T11R0601_00005
	wait_button_or_walk_away
	closemsg
	goto _00E6

_00D7:
	npc_msg msg_0535_T11R0601_00007
	closemsg
	apply_movement obj_T11R0601_policeman, _00EC
	wait_movement
_00E6:
	releaseall
	end

	.balign 4, 0
_00EC:
	step 3, 1
	step_end

; ===== APOCRYPHA Ch4 (4.6): first steps in Kanto. Mel is already moving. =====
scr_seq_T11R0601_004:
	scrcmd_609
	lockall
	goto_if_set FLAG_APOC_CH4_SAFFRON_ARRIVED, _T11R0601_arr_done
	npc_msg msg_0535_T11R0601_00019
	closemsg
	clearflag FLAG_APOC_CH4_HIDE_MEL_SAFFRON
	show_person obj_T11R0601_mel
	; (13,8) is blocked -- (14,8) is the walkable tile directly south of the
	; player at (14,7), cardinal-adjacent and mutually facing (player faces S)
	move_person_facing obj_T11R0601_mel, 14, 0, 8, DIR_NORTH
	npc_msg msg_0535_T11R0601_00020
	npc_msg msg_0535_T11R0601_00021
	closemsg
	apply_movement obj_T11R0601_mel, _T11R0601_mel_off
	wait_movement
	hide_person obj_T11R0601_mel
	setflag FLAG_APOC_CH4_HIDE_MEL_SAFFRON
	setflag FLAG_APOC_CH4_SAFFRON_ARRIVED
	setvar VAR_UNK_411D, 1
	releaseall
	end

_T11R0601_arr_done:
	setvar VAR_UNK_411D, 1
	releaseall
	end

	.balign 4, 0
_T11R0601_mel_off:
	; straight S down the x14 concourse corridor from (14,8), ending on the
	; (14,20) station-exit tile -- she steps out into Saffron ahead of you
	step 13, 12
	step_end

_0116:
	wait 50, VAR_SPECIAL_x8004
	hasitem ITEM_PASS, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0163
	npc_msg msg_0535_T11R0601_00002
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0184
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

_0158:
	npc_msg msg_0535_T11R0601_00003
	closemsg
	goto _0116

_0163:
	npc_msg msg_0535_T11R0601_00004
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_411D, 1
	setvar VAR_UNK_411F, 1
	releaseall
	end

	.balign 4, 0
_017C:
	step 34, 1
	step_end

	.balign 4, 0
_0184:
	step 13, 2
	step_end

scr_seq_T11R0601_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0535_T11R0601_00012
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _024F
	npc_msg msg_0535_T11R0601_00014
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _024F
	load_npc_trade 10
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _0242
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_LT_SURGE_PIKACHU
	npc_msg msg_0535_T11R0601_00016
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _022C
	apply_movement obj_T11R0601_gsleader9, _025C
	goto _0234

_022C:
	apply_movement obj_T11R0601_gsleader9, _0268
_0234:
	wait_movement
	hide_person obj_T11R0601_gsleader9
	setflag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
	releaseall
	end

_0242:
	npc_trade_end
	npc_msg msg_0535_T11R0601_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_024F:
	npc_msg msg_0535_T11R0601_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_025C:
	step 78, 5
	step 77, 10
	step_end

	.balign 4, 0
_0268:
	step 77, 10
	step_end

scr_seq_T11R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RESTORED_POWER, _028E
	npc_msg msg_0535_T11R0601_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_028E:
	npc_msg msg_0535_T11R0601_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11R0601_002:
	simple_npc_msg msg_0535_T11R0601_00010
	end

scr_seq_T11R0601_003:
	simple_npc_msg msg_0535_T11R0601_00011
	end

scr_seq_T11R0601_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0535_T11R0601_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25GYM0101.h"
#include "msgdata/msg/msg_0582_T25GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25GYM0101_000
	scrdef scr_seq_T25GYM0101_001
	scrdef scr_seq_T25GYM0101_002
	scrdef scr_seq_T25GYM0101_003
	scrdef scr_seq_T25GYM0101_004
	scrdef_end

; ===== APOCRYPHA Ch4: the Gym is closed - Whitney is away on League
; business (Plain Badge deferred to a later chapter). The vanilla init
; could clear her hide flag; now it always sets it. =====
scr_seq_T25GYM0101_004:
	setflag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	end

scr_seq_T25GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_PLAIN, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0202
	goto_if_set FLAG_UNK_0B7, _01A0
	compare VAR_UNK_410A, 1
	goto_if_eq _017D
	npc_msg msg_0582_T25GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_WHITNEY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0218
	settrainerflag TRAINER_LASS_CARRIE
	settrainerflag TRAINER_LASS_CATHY
	settrainerflag TRAINER_BEAUTY_VICTORIA
	settrainerflag TRAINER_BEAUTY_SAMANTHA
	add_special_game_stat SCORE_EVENT_BADGE_GET
	move_person_facing obj_T25GYM0101_gsgirl1, 13, 0, 15, DIR_NORTH
_017D:
	npc_msg msg_0582_T25GYM0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	setvar VAR_UNK_410A, 1
	setflag FLAG_UNK_084
	setvar VAR_UNK_40DA, 1
	clearflag FLAG_HIDE_PARK_SOUTH_GATE_POKEATHLON_ENTHUSIASTS_UNLOCKED
	setflag FLAG_HIDE_PARK_SOUTH_GATE_POKEATHLON_ENTHUSIASTS_LOCKED
	end

_01A0:
	npc_msg msg_0582_T25GYM0101_00003
	buffer_players_name 0
	npc_msg msg_0582_T25GYM0101_00004
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge BADGE_PLAIN
	setvar VAR_UNK_410A, 2
	clearflag FLAG_UNK_084
	setflag FLAG_UNK_998
	npc_msg msg_0582_T25GYM0101_00005
_01C4:
	goto_if_no_item_space ITEM_TM45, 1, _01F8
	callstd std_give_item_verbose
	npc_msg msg_0582_T25GYM0101_00007
	wait_button_or_walk_away
	closemsg
	setflag FLAG_GOT_TM45_FROM_WHITNEY
	releaseall
	end

_01F8:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0202:
	goto_if_unset FLAG_GOT_TM45_FROM_WHITNEY, _01C4
	npc_msg msg_0582_T25GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0218:
	white_out
	releaseall
	end

scr_seq_T25GYM0101_001:
	scrcmd_609
	lockall
	apply_movement obj_T25GYM0101_gsgirl1, _0260
	wait_movement
	npc_msg msg_0582_T25GYM0101_00009
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T25GYM0101_gsgirl1, _026C
	apply_movement obj_player, _0278
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	setflag FLAG_UNK_0B7
	releaseall
	end

	.balign 4, 0
_0260:
	step 75, 1
	step 12, 3
	step_end

	.balign 4, 0
_026C:
	step 13, 3
	step 32, 1
	step_end

	.balign 4, 0
_0278:
	step 63, 1
	step 12, 1
	step_end

scr_seq_T25GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_PLAIN, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02AA
	npc_msg msg_0582_T25GYM0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02AA:
	npc_msg msg_0582_T25GYM0101_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_PLAIN, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02DC
	npc_msg msg_0582_T25GYM0101_00012
	goto _02DF

_02DC:
	npc_msg msg_0582_T25GYM0101_00013
_02DF:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

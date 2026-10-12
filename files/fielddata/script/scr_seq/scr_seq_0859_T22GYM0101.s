#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22GYM0101.h"
#include "msgdata/msg/msg_0558_T22GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22GYM0101_000
	scrdef scr_seq_T22GYM0101_001
	scrdef scr_seq_T22GYM0101_002
	scrdef scr_seq_T22GYM0101_003
	scrdef scr_seq_T22GYM0101_004
	scrdef scr_seq_T22GYM0101_005
	scrdef_end

; ===== APOCRYPHA Ch2 (2.5): the old gym is the League practice hall.
; Roxanne (TEACHER, Falkner's engine slot) runs the practicum: gated on the
; tower being settled, no badge, TM39 Rock Tomb reward, and her completion
; arms Kestra's first rival battle outside the doors. =====
scr_seq_T22GYM0101_000:
	violet_gym_init
	clearflag FLAG_HIDE_VIOLET_GYM_FALKNER
	end

scr_seq_T22GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_PRACTICUM_DONE, _T22GYM_after
	goto_if_unset FLAG_APOC_CH2_FLASH_GIVEN, _T22GYM_early
	npc_msg msg_0558_T22GYM0101_00011
	npc_msg msg_0558_T22GYM0101_00012
	npc_msg msg_0558_T22GYM0101_00013
	closemsg
	trainer_battle TRAINER_LEADER_FALKNER_FALKNER, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _T22GYM_lost
	npc_msg msg_0558_T22GYM0101_00014
	giveitem_no_check ITEM_TM39, 1
	npc_msg msg_0558_T22GYM0101_00015
	npc_msg msg_0558_T22GYM0101_00016
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_PRACTICUM_DONE
	settrainerflag TRAINER_BIRD_KEEPER_GS_ROD
	settrainerflag TRAINER_BIRD_KEEPER_GS_ABE
	; Kestra is waiting outside the hall (2.6)
	clearflag FLAG_APOC_CH2_HIDE_KESTRA_GYMFRONT
	; and the kimono girl takes up her watching spot for the beat after (OW==4)
	clearflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	setvar VAR_SCENE_VIOLET_CITY_OW, 3
	releaseall
	end

_T22GYM_early:
	npc_msg msg_0558_T22GYM0101_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T22GYM_after:
	npc_msg msg_0558_T22GYM0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T22GYM_lost:
	white_out
	releaseall
	end


scr_seq_T22GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	; ===== APOCRYPHA: no badge here -- the guide keys off the practicum =====
	goto_if_set FLAG_APOC_CH2_PRACTICUM_DONE, _01AA
	npc_msg msg_0558_T22GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01AA:
	npc_msg msg_0558_T22GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T22GYM0101_005:
	simple_npc_msg msg_0558_T22GYM0101_00006
	end

scr_seq_T22GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	; ===== APOCRYPHA: statue plaque flips on the practicum, not Zephyr =====
	buffer_players_name 0
	goto_if_set FLAG_APOC_CH2_PRACTICUM_DONE, _01EF
	npc_msg msg_0558_T22GYM0101_00009
	goto _01F2

_01EF:
	npc_msg msg_0558_T22GYM0101_00010
_01F2:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T22GYM0101_004:
	setvar VAR_TEMP_x4000, 0
	violet_gym_elevator
	end
	.balign 4, 0

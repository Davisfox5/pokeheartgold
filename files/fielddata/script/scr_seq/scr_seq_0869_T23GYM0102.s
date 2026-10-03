#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23GYM0102.h"
#include "msgdata/msg/msg_0567_T23GYM0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23GYM0102_000
	scrdef scr_seq_T23GYM0102_001
	scrdef scr_seq_T23GYM0102_002
	scrdef scr_seq_T23GYM0102_003
	scrdef scr_seq_T23GYM0102_004
	scrdef scr_seq_T23GYM0102_005
	scrdef scr_seq_T23GYM0102_006
	scrdef scr_seq_T23GYM0102_007
	scrdef scr_seq_T23GYM0102_008
	scrdef scr_seq_T23GYM0102_009
	scrdef scr_seq_T23GYM0102_010
	scrdef scr_seq_T23GYM0102_011
	scrdef scr_seq_T23GYM0102_012
	scrdef scr_seq_T23GYM0102_013
	scrdef scr_seq_T23GYM0102_014
	scrdef scr_seq_T23GYM0102_015
	scrdef scr_seq_T23GYM0102_016
	scrdef scr_seq_T23GYM0102_017
	scrdef_end

scr_seq_T23GYM0102_016:
	azalea_gym_init
	clearflag FLAG_HIDE_AZALEA_GYM_BUGSY
	end

; ===== APOCRYPHA Ch3 (3.4a): Bugsy officiates. The badge match is Turk's. =====
scr_seq_T23GYM0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH3_BADGE_DONE, _T23GYM_bugsy_after
	npc_msg msg_0567_T23GYM0102_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T23GYM_bugsy_after:
	npc_msg msg_0567_T23GYM0102_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23GYM0102_000:
	end

scr_seq_T23GYM0102_002:
	azalea_gym_spinarak 0
	end

scr_seq_T23GYM0102_003:
	azalea_gym_spinarak 1
	end

scr_seq_T23GYM0102_004:
	azalea_gym_spinarak 2
	end

scr_seq_T23GYM0102_005:
	azalea_gym_spinarak 3
	end

scr_seq_T23GYM0102_006:
	azalea_gym_spinarak 4
	end

scr_seq_T23GYM0102_007:
	azalea_gym_spinarak 5
	end

scr_seq_T23GYM0102_008:
	azalea_gym_spinarak 6
	end

scr_seq_T23GYM0102_009:
	azalea_gym_spinarak 7
	end

scr_seq_T23GYM0102_010:
	azalea_gym_spinarak 8
	end

scr_seq_T23GYM0102_011:
	azalea_gym_spinarak 9
	end

scr_seq_T23GYM0102_012:
	azalea_gym_spinarak 10
	end

scr_seq_T23GYM0102_013:
	azalea_gym_spinarak 11
	end

scr_seq_T23GYM0102_014:
	azalea_gym_switch 0
	end

scr_seq_T23GYM0102_015:
	azalea_gym_switch 1
	end
; ===== APOCRYPHA Ch3 (3.4c/d): Turk's first real battle; Hive Badge + TM89. =====
scr_seq_T23GYM0102_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH3_BADGE_DONE, _T23GYM_turk_after
	npc_msg msg_0567_T23GYM0102_00007
	closemsg
	trainer_battle TRAINER_LEADER_BUGSY_BUGSY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _T23GYM_turk_lost
	npc_msg msg_0567_T23GYM0102_00001
	buffer_players_name 0
	npc_msg msg_0567_T23GYM0102_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge BADGE_HIVE
	settrainerflag TRAINER_BUG_CATCHER_AL
	settrainerflag TRAINER_BUG_CATCHER_BENNY
	settrainerflag TRAINER_BUG_CATCHER_JOSH
	settrainerflag TRAINER_TWINS_AMY_AND_MIMI
	add_special_game_stat SCORE_EVENT_BADGE_GET
	npc_msg msg_0567_T23GYM0102_00005
	giveitem_no_check ITEM_TM89, 1
	setflag FLAG_GOT_TM89_FROM_BUGSY
	npc_msg msg_0567_T23GYM0102_00008
	npc_msg msg_0567_T23GYM0102_00009
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH3_BADGE_DONE
	; Kestra is waiting by the west exit (3.4e)
	setvar VAR_UNK_4075, 1
	releaseall
	end

_T23GYM_turk_after:
	npc_msg msg_0567_T23GYM0102_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_T23GYM_turk_lost:
	white_out
	releaseall
	end
	.balign 4, 0

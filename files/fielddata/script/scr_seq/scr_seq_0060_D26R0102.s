#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0102.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0091_D26R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0102_000
	scrdef scr_seq_D26R0102_001
	scrdef scr_seq_D26R0102_002
	scrdef scr_seq_D26R0102_003
	scrdef scr_seq_D26R0102_004
	scrdef scr_seq_D26R0102_005
	scrdef scr_seq_D26R0102_006
	scrdef_end

; ===== APOCRYPHA Ch3 (3.2): the Well is a lab, not a hideout. Every fight is
; a 2v2 with Turk (TRAINER_PARTNER_RIVAL_1) beside the player. The captive
; ring and terminal are read-only horror; the coat is the Silph seed. =====

; the chalk-and-cable ring (repurposed captive Slowpoke)
scr_seq_D26R0102_000:
	simple_npc_msg msg_0091_D26R0102_00005
	end

; terminal 1 (repurposed captive Slowpoke examine)
scr_seq_D26R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0091_D26R0102_00003
	npc_msg msg_0091_D26R0102_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; ===== the Lead Operative (Proton slot, unnamed) =====
scr_seq_D26R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_EXECUTIVE_PROTON_PROTON, _D26_lead_done
	npc_msg msg_0091_D26R0102_00006
	npc_msg msg_0091_D26R0102_00007
	npc_msg msg_0091_D26R0102_00008
	closemsg
	multi_battle TRAINER_PARTNER_RIVAL_1, TRAINER_EXECUTIVE_PROTON_PROTON, TRAINER_TEAM_ROCKET_GRUNT_26, 1
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _D26_lost
	settrainerflag TRAINER_EXECUTIVE_PROTON_PROTON
	; the wipe: screens die, he pockets the coat, and he is simply gone.
	; (27,2) and everything north of him is solid rock, so the exit is
	; staged vanilla-style: fade to black, footsteps in the dark, gone.
	npc_msg msg_0091_D26R0102_00009
	npc_msg msg_0091_D26R0102_00010
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	play_se SEQ_SE_GS_ASHIOTO_B
	wait_se SEQ_SE_GS_ASHIOTO_B
	hide_person obj_D26R0102_rkanbum3
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0091_D26R0102_00011
	closemsg
	; the rings power down; the crew stops existing here
	play_se SEQ_SE_DP_SELECT
	hide_person obj_D26R0102_rocketm
	hide_person obj_D26R0102_rocketm_2
	hide_person obj_D26R0102_rocketw
	setflag FLAG_UNK_1A9
	setflag FLAG_UNK_1D5
	hide_person obj_D26R0102_yadon
	hide_person obj_D26R0102_yadon_2
	setflag FLAG_APOC_CH3_HIDE_WELL_CASE
	hide_person obj_D26R0102_case
	npc_msg msg_0091_D26R0102_00012
	closemsg
	setflag FLAG_BEAT_AZALEA_ROCKETS
	clearflag FLAG_HIDE_AZALEA_SLOWPOKES
	clearflag FLAG_UNK_19E
	setflag FLAG_UNK_1AA
	setflag FLAG_UNK_1AC
	clearflag FLAG_HIDE_ILEX_APPRENTICE
	clearflag FLAG_HIDE_FARFETCHD_1_LOST
	clearflag FLAG_HIDE_FARFETCHD_2_LOST
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	setvar VAR_UNK_4080, 2
	setvar VAR_APOC_CH3_WELL_PROGRESS, 5
	setvar VAR_APOC_CH3_AZALEA_SCENE, 2
	setvar VAR_UNK_40F4, 1
	releaseall
	end

_D26_lead_done:
	end

_D26_lost:
	white_out
	releaseall
	end

; ===== battle 1 - the Site Technician =====
scr_seq_D26R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT, _D26_t1_done
	npc_msg msg_0091_D26R0102_00013
	npc_msg msg_0091_D26R0102_00014
	npc_msg msg_0091_D26R0102_00015
	closemsg
	multi_battle TRAINER_PARTNER_RIVAL_1, TRAINER_TEAM_ROCKET_GRUNT, TRAINER_TEAM_ROCKET_GRUNT_2, 1
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _D26_lost1
	settrainerflag TRAINER_TEAM_ROCKET_GRUNT
	settrainerflag TRAINER_TEAM_ROCKET_GRUNT_2
	npc_msg msg_0091_D26R0102_00016
	npc_msg msg_0091_D26R0102_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_t1_done:
	npc_msg msg_0091_D26R0102_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_lost1:
	white_out
	releaseall
	end

; ===== battle 2 - Field Researcher =====
scr_seq_D26R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_TEAM_ROCKET_F_GRUNT, _D26_t2_done
	npc_msg msg_0091_D26R0102_00018
	closemsg
	multi_battle TRAINER_PARTNER_RIVAL_1, TRAINER_TEAM_ROCKET_F_GRUNT, TRAINER_TEAM_ROCKET_GRUNT_20, 1
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _D26_lost2
	settrainerflag TRAINER_TEAM_ROCKET_F_GRUNT
	settrainerflag TRAINER_TEAM_ROCKET_GRUNT_20
	npc_msg msg_0091_D26R0102_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_t2_done:
	npc_msg msg_0091_D26R0102_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_lost2:
	white_out
	releaseall
	end

; ===== battle 3 - Field Researcher (f) =====
scr_seq_D26R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_21, _D26_t3_done
	npc_msg msg_0091_D26R0102_00020
	closemsg
	multi_battle TRAINER_PARTNER_RIVAL_1, TRAINER_TEAM_ROCKET_GRUNT_21, TRAINER_TEAM_ROCKET_GRUNT_25, 1
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _D26_lost3
	settrainerflag TRAINER_TEAM_ROCKET_GRUNT_21
	settrainerflag TRAINER_TEAM_ROCKET_GRUNT_25
	npc_msg msg_0091_D26R0102_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_t3_done:
	npc_msg msg_0091_D26R0102_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D26_lost3:
	white_out
	releaseall
	end

; the equipment case with the folded lab coat (gone after the wipe)
scr_seq_D26R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0091_D26R0102_00022
	npc_msg msg_0091_D26R0102_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

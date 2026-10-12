#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25.h"
#include "msgdata/msg/msg_0581_T25.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25_000
	scrdef scr_seq_T25_001
	scrdef scr_seq_T25_002
	scrdef scr_seq_T25_003
	scrdef scr_seq_T25_004
	scrdef scr_seq_T25_005
	scrdef scr_seq_T25_006
	scrdef scr_seq_T25_007
	scrdef scr_seq_T25_008
	scrdef scr_seq_T25_009
	scrdef scr_seq_T25_010
	scrdef scr_seq_T25_011
	scrdef scr_seq_T25_012
	scrdef scr_seq_T25_013
	scrdef scr_seq_T25_014
	scrdef scr_seq_T25_015
	scrdef scr_seq_T25_016
	scrdef scr_seq_T25_017
	scrdef scr_seq_T25_018
	scrdef scr_seq_T25_019
	scrdef scr_seq_T25_020
	scrdef scr_seq_T25_021
	scrdef scr_seq_T25_022
	scrdef scr_seq_T25_023
	scrdef scr_seq_T25_024
	scrdef scr_seq_T25_025
	scrdef scr_seq_T25_026
	scrdef scr_seq_T25_027
	scrdef scr_seq_T25_028
	scrdef scr_seq_T25_029
	scrdef scr_seq_T25_030
	scrdef scr_seq_T25_031
	scrdef scr_seq_T25_032
	scrdef scr_seq_T25_033
	scrdef scr_seq_T25_034
	scrdef_end

; APOCRYPHA Ch4: the Rocket takeover doesn't exist. Streets stay populated.
scr_seq_T25_018:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_1
	setflag FLAG_HIDE_ROCKET_TAKEOVER_3
	setflag FLAG_HIDE_ROCKET_TAKEOVER_4
	setflag FLAG_HIDE_ROCKET_TAKEOVER_5
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_2
	end

scr_seq_T25_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40DA, 1
	goto_if_ne _013E
	compare VAR_UNK_40DB, 0
	goto_if_eq _0149
_013E:
	npc_msg msg_0581_T25_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0149:
	npc_msg msg_0581_T25_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ge _0172
	npc_msg msg_0581_T25_00004
	goto _0175

_0172:
	npc_msg msg_0581_T25_00005
_0175:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_RADIO_CARD, _019B
	npc_msg msg_0581_T25_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_019B:
	npc_msg msg_0581_T25_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_003:
	simple_npc_msg msg_0581_T25_00008
	end

scr_seq_T25_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01DD
	npc_msg msg_0581_T25_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01DD:
	npc_msg msg_0581_T25_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40DA, 1
	goto_if_ne _020A
	compare VAR_UNK_40DB, 0
	goto_if_eq _0215
_020A:
	npc_msg msg_0581_T25_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0215:
	npc_msg msg_0581_T25_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40DA, 1
	goto_if_ne _0242
	compare VAR_UNK_40DB, 0
	goto_if_eq _024D
_0242:
	npc_msg msg_0581_T25_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_024D:
	npc_msg msg_0581_T25_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00013
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0284
	apply_movement obj_T25_rocketm, _02F8
	wait_movement
	goto _02B8

_0284:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _02A1
	apply_movement obj_T25_rocketm, _0308
	wait_movement
	goto _02B8

_02A1:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _02B8
	apply_movement obj_T25_rocketm, _0300
	wait_movement
_02B8:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _02CE
	npc_msg msg_0581_T25_00015
	goto _02D1

_02CE:
	npc_msg msg_0581_T25_00014
_02D1:
	closemsg
	compare VAR_TEMP_x4001, 350
	goto_if_eq _02EA
	apply_movement obj_T25_rocketm, _02F0
	wait_movement
_02EA:
	releaseall
	end

	.balign 4, 0
_02F0:
	step 32, 1
	step_end

	.balign 4, 0
_02F8:
	step 33, 1
	step_end

	.balign 4, 0
_0300:
	step 34, 1
	step_end

	.balign 4, 0
_0308:
	step 35, 1
	step_end

scr_seq_T25_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _032E
	npc_msg msg_0581_T25_00017
	goto _0331

_032E:
	npc_msg msg_0581_T25_00016
_0331:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0357
	npc_msg msg_0581_T25_00019
	goto _035A

_0357:
	npc_msg msg_0581_T25_00018
_035A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0380
	npc_msg msg_0581_T25_00021
	goto _0383

_0380:
	npc_msg msg_0581_T25_00020
_0383:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _03A9
	npc_msg msg_0581_T25_00023
	goto _03AC

_03A9:
	npc_msg msg_0581_T25_00022
_03AC:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _03D2
	npc_msg msg_0581_T25_00025
	goto _03D5

_03D2:
	npc_msg msg_0581_T25_00024
_03D5:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _03FB
	npc_msg msg_0581_T25_00030
	goto _03FE

_03FB:
	npc_msg msg_0581_T25_00029
_03FE:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_030:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_032:
	simple_npc_msg msg_0581_T25_00028
	end

scr_seq_T25_031:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25_014:
	simple_npc_msg msg_0581_T25_00031
	end

scr_seq_T25_015:
	simple_npc_msg msg_0581_T25_00032
	end

scr_seq_T25_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _047F
	npc_msg msg_0581_T25_00034
	goto _0482

_047F:
	npc_msg msg_0581_T25_00033
_0482:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; APOCRYPHA Ch4 (4.1): the big-arrival one-shot on the Route 34 gate band.
scr_seq_T25_017:
	setvar VAR_APOC_CH4_SCENE, 1
	setflag FLAG_APOC_CH4_GOLDENROD_INTRO_DONE
	end

scr_seq_T25_019:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00036, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_020:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00037, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_021:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00038, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_022:
	direction_signpost msg_0581_T25_00039, 0, 16, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_023:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00040, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_024:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00041, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_025:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00042, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_026:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00043, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_027:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00044, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_028:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00045, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T25_029:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00046, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0

; ===== APOCRYPHA Ch4 (4.2): Kestra resurfaces at the Department Store front
; and drags the player toward the Radio Tower and Mel's live show. =====
scr_seq_T25_033:
	scrcmd_609
	lockall
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	; Ch4 fix: she is hidden at new game now (0149) -- spawn her for the scene
	clearflag FLAG_APOC_CH4_HIDE_KESTRA_PLAZA
	show_person obj_T25_kestra
	move_person_facing obj_T25_kestra, VAR_SPECIAL_x8004, 0, 369, DIR_SOUTH
	apply_movement obj_T25_kestra, _T25_kes_alert
	apply_movement obj_player, _T25_face_n
	wait_movement
	npc_msg msg_0581_T25_00047
	npc_msg msg_0581_T25_00048
	npc_msg msg_0581_T25_00049
	npc_msg msg_0581_T25_00050
	closemsg
	apply_movement obj_T25_kestra, _T25_kes_off
	wait_movement
	hide_person obj_T25_kestra
	setflag FLAG_APOC_CH4_HIDE_KESTRA_PLAZA
	; she'll be waiting in the Radio Tower studio
	clearflag FLAG_HIDE_RADIO_TOWER_RIVAL
	setvar VAR_APOC_CH4_SCENE, 2
	releaseall
	end

scr_seq_T25_034:
	simple_npc_msg msg_0581_T25_00051
	end

	.balign 4, 0
_T25_kes_alert:
	step 75, 1
	step_end
	.balign 4, 0
_T25_face_n:
	step 0, 1
	step_end
	.balign 4, 0
_T25_kes_off:
	; (362,369) is blocked: sidestep W1 along the clear z369 tiles
	; (x363-365 for all trigger columns), drop S1 onto the open z370 row
	; (one tile west of the player, so no collision), then run it west --
	; ends 10 tiles west of the player (x354-356), off-screen
	step 14, 1
	step 13, 1
	step 14, 9
	step_end

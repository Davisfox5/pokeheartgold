#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0102.h"
#include "msgdata/msg/msg_0055_D15R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0102_000
	scrdef scr_seq_D15R0102_001
	scrdef scr_seq_D15R0102_002
	scrdef scr_seq_D15R0102_003
	scrdef scr_seq_D15R0102_004
	scrdef scr_seq_D15R0102_005
	scrdef_end

scr_seq_D15R0102_000:
	end

scr_seq_D15R0102_001:
	simple_npc_msg msg_0055_D15R0102_00000
	end

scr_seq_D15R0102_002:
	simple_npc_msg msg_0055_D15R0102_00001
	end
; ===== APOCRYPHA Ch2 (2.4c): Ren and Kestra mid-tower, failing to look
; innocent. Talking to either plays the exchange once; afterwards the three
; tag pickups (one per floor) are live. Both are hidden on
; FLAG_APOC_CH2_HIDE_RENKESTRA_TOWER: set from _std_init, cleared when the
; doorstep commotion sends them inside (T22_002), and set again for good
; once Elder Li settles things (D15R0103's Flash handout). =====
scr_seq_D15R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_TOWER_RENKESTRA_DONE, _D15R0102_ren_rep
	npc_msg msg_0055_D15R0102_00003
	npc_msg msg_0055_D15R0102_00004
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_TOWER_RENKESTRA_DONE
	releaseall
	end

_D15R0102_ren_rep:
	npc_msg msg_0055_D15R0102_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D15R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_TOWER_RENKESTRA_DONE, _D15R0102_kes_rep
	npc_msg msg_0055_D15R0102_00003
	npc_msg msg_0055_D15R0102_00004
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_TOWER_RENKESTRA_DONE
	releaseall
	end

_D15R0102_kes_rep:
	npc_msg msg_0055_D15R0102_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; the second misplaced training tag
scr_seq_D15R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_set FLAG_APOC_CH2_TOWER_RENKESTRA_DONE, _D15R0102_tag_take
	npc_msg msg_0055_D15R0102_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D15R0102_tag_take:
	npc_msg msg_0055_D15R0102_00008
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	hide_person obj_D15R0102_tag
	setflag FLAG_APOC_CH2_TAG2_RETURNED
	releaseall
	end
	.balign 4, 0

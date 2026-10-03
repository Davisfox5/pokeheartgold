#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0101.h"
#include "msgdata/msg/msg_0054_D15R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0101_000
	scrdef scr_seq_D15R0101_001
	scrdef scr_seq_D15R0101_002
	scrdef scr_seq_D15R0101_003
	scrdef scr_seq_D15R0101_004
	scrdef scr_seq_D15R0101_005
	scrdef_end

scr_seq_D15R0101_000:
	end

scr_seq_D15R0101_001:
	simple_npc_msg msg_0054_D15R0101_00002
	end

scr_seq_D15R0101_002:
	simple_npc_msg msg_0054_D15R0101_00003
	end

scr_seq_D15R0101_003:
	simple_npc_msg msg_0054_D15R0101_00001
	end

scr_seq_D15R0101_004:
	simple_npc_msg msg_0054_D15R0101_00000
	end
; APOCRYPHA Ch2 (2.4c): the first misplaced training tag
scr_seq_D15R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_set FLAG_APOC_CH2_TOWER_RENKESTRA_DONE, _D15R0101_tag_take
	npc_msg msg_0054_D15R0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D15R0101_tag_take:
	npc_msg msg_0054_D15R0101_00006
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	hide_person obj_D15R0101_tag
	setflag FLAG_APOC_CH2_TAG1_RETURNED
	releaseall
	end
	.balign 4, 0

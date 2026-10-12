#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0103.h"
#include "msgdata/msg/msg_0056_D15R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D15R0103_000
	scrdef scr_seq_D15R0103_001
	scrdef scr_seq_D15R0103_002
	scrdef scr_seq_D15R0103_003
	scrdef_end

; ===== APOCRYPHA Ch2 (2.4d): the vanilla Silver cutscene is retired; Elder Li
; is NOT battled. He reopens the tower once the three misplaced training tags
; are retrieved (FLAG_APOC_CH2_TAG1-3), gives TM70 Flash, and frees Ren to
; appear on campus for his thanks. =====
scr_seq_D15R0103_000:
	end

scr_seq_D15R0103_001:
	end

scr_seq_D15R0103_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_FLASH_GIVEN, _D15R0103_li_after
	goto_if_unset FLAG_APOC_CH2_TAG1_RETURNED, _D15R0103_li_notready
	goto_if_unset FLAG_APOC_CH2_TAG2_RETURNED, _D15R0103_li_notready
	goto_if_unset FLAG_APOC_CH2_TAG3_RETURNED, _D15R0103_li_notready
	npc_msg msg_0056_D15R0103_00009
	npc_msg msg_0056_D15R0103_00010
	npc_msg msg_0056_D15R0103_00011
	giveitem_no_check ITEM_TM70, 1
	npc_msg msg_0056_D15R0103_00012
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_FLASH_GIVEN
	; the pair leave the tower for good (their 2F copies now hide on their
	; own flag, not FLAG_APOC_CH2_FLASH_GIVEN, so they can start hidden)
	setflag FLAG_APOC_CH2_HIDE_RENKESTRA_TOWER
	; Ren turns up on campus to say thanks (2.4e)
	clearflag FLAG_APOC_CH2_HIDE_REN_CAMPUS
	; vanilla gym-guy state flip, kept for the practice-hall doorman
	setflag FLAG_HIDE_VIOLET_GYM_GYM_GUY_AFTER_SPROUT
	clearflag FLAG_HIDE_VIOLET_GYM_GYM_GUY_BEFORE_SPROUT
	releaseall
	end

_D15R0103_li_notready:
	npc_msg msg_0056_D15R0103_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D15R0103_li_after:
	npc_msg msg_0056_D15R0103_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; the third misplaced training tag (2.4c)
scr_seq_D15R0103_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_set FLAG_APOC_CH2_TOWER_RENKESTRA_DONE, _D15R0103_tag_take
	npc_msg msg_0056_D15R0103_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_D15R0103_tag_take:
	npc_msg msg_0056_D15R0103_00015
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	hide_person obj_D15R0103_tag
	setflag FLAG_APOC_CH2_TAG3_RETURNED
	releaseall
	end

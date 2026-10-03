#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0103.h"
#include "msgdata/msg/msg_0092_D26R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0103_000
	scrdef_end

; ===== APOCRYPHA Ch3: the modified King's Rock, left behind in the wipe.
; A quest object, not a usable item; Silver examines it topside. =====
scr_seq_D26R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0092_D26R0103_00000
	npc_msg msg_0092_D26R0103_00001
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	hide_person obj_D26R0103_gsassistantm
	setflag FLAG_APOC_CH3_KINGSROCK_TAKEN
	releaseall
	end
	.balign 4, 0

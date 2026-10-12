#include "constants/scrcmd.h"
#include "constants/species.h"
#include "fielddata/script/scr_seq/event_T21R0401.h"
#include "msgdata/msg/msg_0554_T21R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21R0401_000
	scrdef scr_seq_T21R0401_001
	scrdef scr_seq_T21R0401_002
	scrdef_end

scr_seq_T21R0401_000:
	end

scr_seq_T21R0401_001:
	simple_npc_msg msg_0554_T21R0401_00011
	end

; Starter now comes from the OUTDOOR ceremony (scr_seq_T21_014). The in-house
; balls are decoration; touching one just gives a flavor line (no starter here).
scr_seq_T21R0401_002:
	simple_npc_msg msg_0554_T21R0401_00012
	end
	.balign 4, 0

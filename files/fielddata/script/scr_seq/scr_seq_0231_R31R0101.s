#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R31R0101.h"
#include "msgdata/msg/msg_0379_R31R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R31R0101_000
	scrdef scr_seq_R31R0101_001
	scrdef scr_seq_R31R0101_002
	scrdef_end

scr_seq_R31R0101_001:
	get_friend_sprite VAR_OBJ_0
	end

; ===== APOCRYPHA: the vanilla Lyra/Ethan Vs. Recorder handoff is retired; the
; friend and her Marill are hidden behind FLAG_APOC_ALWAYS_HIDDEN. =====
scr_seq_R31R0101_000:
	end

scr_seq_R31R0101_002:
	simple_npc_msg msg_0379_R31R0101_00000
	end
	.balign 4, 0

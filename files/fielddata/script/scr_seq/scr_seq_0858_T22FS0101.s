#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22FS0101.h"
#include "msgdata/msg/msg_0557_T22FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22FS0101_000
	scrdef scr_seq_T22FS0101_001
	scrdef scr_seq_T22FS0101_002
	scrdef scr_seq_T22FS0101_003
	scrdef scr_seq_T22FS0101_004
	scrdef_end

scr_seq_T22FS0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_pokemart
	releaseall
	end

scr_seq_T22FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_special_mart
	releaseall
	end

; ===== APOCRYPHA: Elm gives no egg -- the Togepi-egg handoff from Elm's
; aide is retired (the aide stays hidden; FLAG_GOT_EGG_FROM_ELMS_ASSISTANT
; is pre-set at init and the kimono beat is rewired through the hdr). =====
scr_seq_T22FS0101_002:
	end

scr_seq_T22FS0101_003:
	simple_npc_msg msg_0557_T22FS0101_00000
	end

scr_seq_T22FS0101_004:
	simple_npc_msg msg_0557_T22FS0101_00001
	end
	.balign 4, 0

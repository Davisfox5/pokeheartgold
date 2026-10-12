#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20MOMS.h"
#include "msgdata/msg/msg_0829_T20MOMS.h"
	.include "asm/macros/script.inc"

	.rodata

; ===== APOCRYPHA: Gold's mother's house (New Bark Town). This interior is a
; clone of the SW-house room (shares land-data member 212 + area bank 25) with
; its own events/script/msg. It replaces the duplicate player-house door that
; used to funnel New Bark visitors into the player's Cherrygrove home. =====
	scrdef scr_seq_T20MOMS_000
	scrdef_end

scr_seq_T20MOMS_000:
	simple_npc_msg msg_0829_T20MOMS_00000
	end
	.balign 4, 0

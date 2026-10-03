#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08R0201.h"
#include "msgdata/msg/msg_0339_R08R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R08R0201_000
	scrdef scr_seq_R08R0201_001
	scrdef_end

scr_seq_R08R0201_000:
	simple_npc_msg msg_0339_R08R0201_00000
	end
	.balign 4, 0

; ===== APOCRYPHA Ch4: routes out of Saffron are soft-closed ("League safety
; inspections") until Chapter 5 opens the rest of Kanto. Coord strip on the
; Route 8 (east) side of the walkway fires while VAR_TEMP_x4000 == 0; the
; script never sets the var, so the block repeats every time. Pattern copied
; from the Magnet-Train pass check (scr_seq_0893_T25R0501.s _001). =====
scr_seq_R08R0201_001:
	scrcmd_609
	lockall
	npc_msg msg_0339_R08R0201_00001
	closemsg
	apply_movement obj_player, _R08R0201_stepback
	wait_movement
	releaseall
	end

	.balign 4, 0
_R08R0201_stepback:
	step 14, 1
	step_end
	.balign 4, 0

#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0201.h"
#include "msgdata/msg/msg_0377_R30R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R30R0201_000
	scrdef scr_seq_R30R0201_001
	scrdef scr_seq_R30R0201_002
	scrdef scr_seq_R30R0201_003
	scrdef_end

; ===== APOCRYPHA Ch2 (2.1d): Mr. Pokemon's house is the held-item lesson.
; The vanilla Mystery Egg / Oak / Pokedex / Red Scale plot is retired; he
; gives a Quick Claw once (FLAG_APOC_CH2_MRPOKEMON_GIFT) and stays a
; delighted collector afterward. =====
scr_seq_R30R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_APOC_CH2_MRPOKEMON_GIFT, _R30R0201_repeat
	npc_msg msg_0377_R30R0201_00031
	npc_msg msg_0377_R30R0201_00032
	closemsg
	giveitem_no_check ITEM_QUICK_CLAW, 1
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0377_R30R0201_00033
	wait_button_or_walk_away
	closemsg
	setflag FLAG_APOC_CH2_MRPOKEMON_GIFT
	releaseall
	end

_R30R0201_repeat:
	npc_msg msg_0377_R30R0201_00034
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; The scene scripts below are retired in Apocrypha. The house no longer runs any
; map/scene scripts (see _hdr.s), so these are unreferenced dead stubs kept only
; to preserve the scrdef numbering that event_R30R0201.h / the event data rely on.
; vanilla Mystery Egg delivery cutscene - retired
scr_seq_R30R0201_001:
	end

; vanilla Red/Blue Orb scene - retired
scr_seq_R30R0201_002:
	end

; vanilla Embedded Tower (Arceus) gentleman reposition - retired
scr_seq_R30R0201_003:
	end

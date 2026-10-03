#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0101.h"
#include "msgdata/msg/msg_0116_D37R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0101_000
	scrdef scr_seq_D37R0101_001
	scrdef scr_seq_D37R0101_002
	scrdef scr_seq_D37R0101_003
	scrdef_end

scr_seq_D37R0101_003:
	get_friend_sprite VAR_OBJ_0
	end

; ===== APOCRYPHA Ch4: no Lyra/Ethan - the Fashion Case friend cutscene
; is cut. Just mark the scene as seen so it stops re-firing. =====
scr_seq_D37R0101_002:
	setvar VAR_UNK_40F8, 1
	end

scr_seq_D37R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _0425
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_0425:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _043B
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_043B:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0451
	npc_msg msg_0116_D37R0101_00001
	goto _0454

_0451:
	npc_msg msg_0116_D37R0101_00000
_0454:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D37R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _047A
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_047A:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0490
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_0490:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _04A6
	npc_msg msg_0116_D37R0101_00004
	goto _04A9

_04A6:
	npc_msg msg_0116_D37R0101_00003
_04A9:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0

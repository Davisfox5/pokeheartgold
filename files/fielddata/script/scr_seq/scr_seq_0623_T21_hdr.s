#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21.h"
	.rodata
	.option alignment off

	.byte 2
	.short _EV_scr_seq_T21_010 + 1, 0
	.byte 1
	.word scr_seq_T21_map_scripts_1-.-4
	.byte 0

scr_seq_T21_map_scripts_1:
	; Apocrypha: auto-start the grand tour when arriving from the R30 catch
	; rescue (cg_ow==2). The warp lands under a held black screen, and a coord
	; trigger only fires on a STEP the player can't see to take - a scene
	; script fires on map load instead. _018 stages the trio at the north gate,
	; fades in, walks the tour, and hands off to the ceremony (which sets
	; cg_ow=3, disarming this entry).
	.short VAR_SCENE_CHERRYGROVE_CITY_OW, 2, _EV_scr_seq_T21_018 + 1
	.short 0

	.balign 4, 0

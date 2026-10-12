#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0201.h"
	.rodata
	.option alignment off

; ===== APOCRYPHA Ch2 (2.1d): Mr. Pokemon's house is now a simple collector's
; cottage with a single talk-to NPC (held-item lesson + Quick Claw gift). The
; vanilla auto-cutscene scene table (Mystery Egg / Red Scale / Embedded Tower)
; is RETIRED. It used to trigger scene script 001 on map entry whenever
; VAR_SCENE_MR_POKEMONS_HOUSE == 0 (the default on a first visit); with that
; script gutted to a bare `end`, the field control re-fired the empty scene
; every frame and never returned control -> the player froze on arrival.
; No map/scene scripts are needed here anymore. =====

	.byte 0

	.balign 4, 0

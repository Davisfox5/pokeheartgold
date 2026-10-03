#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T22_map_scripts_2-.-4
	.byte 0

scr_seq_T22_map_scripts_2:
; ===== APOCRYPHA: vanilla OW==1 row (Elm egg phone call) removed -- OW==1 now
; belongs to the Ch2 tower-commotion coord event (zone_event JSON). The kimono
; girl's beat moved 3 -> 4: OW==3 is the Kestra battle coord; she plays right
; after it and parks the var at 5. =====
	.short VAR_SCENE_VIOLET_CITY_OW, 4, _EV_scr_seq_T22_004 + 1
	.short 0

	.balign 4, 0

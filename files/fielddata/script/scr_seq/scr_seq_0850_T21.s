#include "constants/scrcmd.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "fielddata/script/scr_seq/event_T21.h"
#include "msgdata/msg/msg_0550_T21.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21_000
	scrdef scr_seq_T21_001
	scrdef scr_seq_T21_002
	scrdef scr_seq_T21_003
	scrdef scr_seq_T21_004
	scrdef scr_seq_T21_005
	scrdef scr_seq_T21_006
	scrdef scr_seq_T21_007
	scrdef scr_seq_T21_008
	scrdef scr_seq_T21_009
	scrdef scr_seq_T21_010
	scrdef scr_seq_T21_011
	scrdef scr_seq_T21_012
	scrdef scr_seq_T21_013
	scrdef scr_seq_T21_014
	scrdef scr_seq_T21_015
	scrdef scr_seq_T21_016
	scrdef scr_seq_T21_017
	scrdef scr_seq_T21_018
	scrdef scr_seq_T21_019
	scrdef scr_seq_T21_020
	scrdef scr_seq_T21_021
	scrdef scr_seq_T21_022
	scrdef_end

scr_seq_T21_010:
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	goto_if_unset FLAG_UNK_189, _003F
	clearflag FLAG_UNK_189
	end

_003F:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _007D
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0083
_007D:
	setflag FLAG_HIDE_CAMERON
	end

_0083:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T21_000:
	end

; ============================================================================
; RETIRED (Apocrypha): scr_seq_T21_001 (Guide-Gent running-shoes tour),
; _002 (Guide-Gent Map-Card hand-off) and _003 (road-rival battle) are DEAD.
; The Guide-Gent is deceased; no object, coord, bg or map-script header points
; to these entry points (verified). Their grants live on now in the LIVE paths:
;   - Running Shoes + Map Card -> scr_seq_T21_014 (Gold's outdoor ceremony)
;   - rival battle             -> retired (Silver is an unreachable idol in Ch.1)
; Their scrdef slots are kept (the scrdef table is position-indexed; deleting a
; slot would renumber every later script), and their bodies are left inert.
; Do not wire anything to _001/_002/_003.
; ============================================================================
scr_seq_T21_001:
	lock obj_T21_gsoldman1
	apply_movement obj_T21_gsoldman1, _0350
	wait_movement
	callstd std_play_follow_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 397
	goto_if_ne _00BE
	apply_movement obj_T21_gsoldman1, _0358
	goto _0109

_00BE:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _00D9
	apply_movement obj_T21_gsoldman1, _0360
	goto _0109

_00D9:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _00F4
	apply_movement obj_T21_gsoldman1, _0368
	goto _0109

_00F4:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0109
	apply_movement obj_T21_gsoldman1, _0370
_0109:
	apply_movement obj_player, _0378
	wait_movement
	npc_msg msg_0550_T21_00000
	closemsg
	buffer_players_name 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 397
	goto_if_ne _013C
	apply_movement obj_T21_gsoldman1, _0390
	goto _0187

_013C:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _0157
	apply_movement obj_T21_gsoldman1, _03AC
	goto _0187

_0157:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _0172
	apply_movement obj_T21_gsoldman1, _03D0
	goto _0187

_0172:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0187
	apply_movement obj_T21_gsoldman1, _03F4
_0187:
	wait_movement
	apply_movement obj_player, _0380
	wait_movement
	npc_msg msg_0550_T21_00001
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4001, 397
	goto_if_ne _01C5
	apply_movement obj_T21_gsoldman1, _0418
	apply_movement obj_player, _0478
	goto _0228

_01C5:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _01E8
	apply_movement obj_T21_gsoldman1, _0430
	apply_movement obj_player, _0488
	goto _0228

_01E8:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _020B
	apply_movement obj_T21_gsoldman1, _0448
	apply_movement obj_player, _0498
	goto _0228

_020B:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0228
	apply_movement obj_T21_gsoldman1, _0460
	apply_movement obj_player, _04A8
_0228:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00002
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _04B8
	apply_movement obj_player, _04CC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00003
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _04E0
	apply_movement obj_player, _04FC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00004
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _050C
	apply_movement obj_player, _052C
	wait_movement
	play_se SEQ_SE_GS_N_UMIBE
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00005
	closemsg
	stop_se SEQ_SE_GS_N_UMIBE
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _054C
	apply_movement obj_player, _0568
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00006
	give_running_shoes
	buffer_players_name 0
	npc_msg msg_0550_T21_00007
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0550_T21_00008
	closemsg
	apply_movement obj_T21_gsoldman1, _0580
	wait_movement
	scrcmd_307 17, 12, 14, 17, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T21_gsoldman1, _0580
	wait_movement
	release obj_T21_gsoldman1
	release obj_partner_poke
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T21_gsoldman1
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd std_fade_end_mom_music
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 1
	end

	.balign 4, 0
_0350:
	step 75, 1
	step_end

	.balign 4, 0
_0358:
	step 62, 1
	step_end

	.balign 4, 0
_0360:
	step 13, 1
	step_end

	.balign 4, 0
_0368:
	step 13, 2
	step_end

	.balign 4, 0
_0370:
	step 13, 3
	step_end

	.balign 4, 0
_0378:
	step 32, 1
	step_end

	.balign 4, 0
_0380:
	step 34, 1
	step_end

	.balign 4, 0
_0388:
	step 35, 1
	step_end

	.balign 4, 0
_0390:
	step 18, 2
	step 16, 2
	step 75, 1
	step 37, 1
	step 17, 3
	step 19, 1
	step_end

	.balign 4, 0
_03AC:
	step 18, 2
	step 16, 3
	step 63, 1
	step 37, 1
	step 66, 1
	step 75, 1
	step 17, 4
	step 19, 1
	step_end

	.balign 4, 0
_03D0:
	step 18, 2
	step 16, 4
	step 63, 1
	step 37, 1
	step 66, 1
	step 75, 1
	step 17, 5
	step 19, 1
	step_end

	.balign 4, 0
_03F4:
	step 18, 2
	step 16, 4
	step 63, 1
	step 37, 1
	step 66, 1
	step 75, 1
	step 17, 5
	step 19, 1
	step_end

	.balign 4, 0
_0418:
	step 18, 1
	step 16, 3
	step 37, 1
	step 62, 4
	step 36, 1
	step_end

	.balign 4, 0
_0430:
	step 18, 1
	step 16, 4
	step 37, 1
	step 62, 5
	step 36, 1
	step_end

	.balign 4, 0
_0448:
	step 18, 1
	step 16, 5
	step 37, 1
	step 62, 6
	step 36, 1
	step_end

	.balign 4, 0
_0460:
	step 18, 1
	step 16, 6
	step 37, 1
	step 62, 9
	step 36, 1
	step_end

	.balign 4, 0
_0478:
	step 14, 2
	step 12, 2
	step 63, 1
	step_end

	.balign 4, 0
_0488:
	step 14, 2
	step 12, 3
	step 63, 1
	step_end

	.balign 4, 0
_0498:
	step 14, 2
	step 12, 4
	step 63, 1
	step_end

	.balign 4, 0
_04A8:
	step 14, 2
	step 12, 5
	step 63, 1
	step_end

	.balign 4, 0
_04B8:
	step 18, 9
	step 39, 1
	step 62, 7
	step 36, 1
	step_end

	.balign 4, 0
_04CC:
	step 12, 1
	step 14, 8
	step 63, 2
	step 32, 1
	step_end

	.balign 4, 0
_04E0:
	step 18, 6
	step 16, 2
	step 18, 1
	step 39, 1
	step 62, 7
	step 36, 1
	step_end

	.balign 4, 0
_04FC:
	step 14, 7
	step 12, 2
	step 63, 1
	step_end

	.balign 4, 0
_050C:
	step 17, 2
	step 18, 6
	step 17, 8
	step 14, 6
	step 36, 1
	step 62, 17
	step 38, 1
	step_end

	.balign 4, 0
_052C:
	step 14, 1
	step 13, 2
	step 14, 6
	step 13, 7
	step 14, 6
	step 63, 2
	step 34, 1
	step_end

	.balign 4, 0
_054C:
	step 19, 16
	step 38, 1
	step 62, 6
	step 17, 2
	step 19, 6
	step 38, 1
	step_end

	.balign 4, 0
_0568:
	step 62, 1
	step 13, 1
	step 15, 16
	step 13, 2
	step 15, 5
	step_end

	.balign 4, 0
_0580:
	step 12, 2
	step_end

	.balign 4, 0
_0588:
	step 12, 1
	step_end

scr_seq_T21_002:
	scrcmd_609
	lockall
	apply_movement obj_player, _0680
	wait_movement
	callstd std_play_follow_music
	clearflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	show_person obj_T21_gsoldman1
	lock obj_T21_gsoldman1
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person_facing obj_T21_gsoldman1, VAR_TEMP_x4000, 1, 394, DIR_NORTH
	compare VAR_TEMP_x4000, 549
	goto_if_ne _05DB
	apply_movement obj_T21_gsoldman1, _068C
	goto _05FE

_05DB:
	compare VAR_TEMP_x4000, 550
	goto_if_ne _05F6
	apply_movement obj_T21_gsoldman1, _068C
	goto _05FE

_05F6:
	apply_movement obj_T21_gsoldman1, _069C
_05FE:
	wait_movement
	compare VAR_TEMP_x4000, 549
	goto_if_ne _061B
	apply_movement obj_player, _0380
	goto _063E

_061B:
	compare VAR_TEMP_x4000, 550
	goto_if_ne _0636
	apply_movement obj_player, _0380
	goto _063E

_0636:
	apply_movement obj_player, _0388
_063E:
	wait_movement
	npc_msg msg_0550_T21_00009
	buffer_players_name 0
	npc_msg msg_0550_T21_00010
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	npc_msg msg_0550_T21_00011
	npc_msg msg_0550_T21_00012
	closemsg
	apply_movement obj_T21_gsoldman1, _06AC
	wait_movement
	callstd std_fade_end_mom_music
	release obj_T21_gsoldman1
	hide_person obj_T21_gsoldman1
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	register_pokegear_card 1
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 2
	end

	.balign 4, 0
_0680:
	step 75, 1
	step 37, 1
	step_end

	.balign 4, 0
_068C:
	step 18, 1
	step 16, 9
	step 35, 1
	step_end

	.balign 4, 0
_069C:
	step 19, 1
	step 16, 9
	step 34, 1
	step_end

	.balign 4, 0
_06AC:
	step 17, 9
	step_end

scr_seq_T21_003:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement obj_player, _0350
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person_facing obj_T21_gsrivel, 583, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_T21_gsrivel, _0808
	wait_movement
	npc_msg msg_0550_T21_00013
	closemsg
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 152
	goto_if_ne _070C
	trainer_battle TRAINER_PASSERBY_BOY_2, 0, 1, 0
	goto _072F

_070C:
	compare VAR_SPECIAL_RESULT, 155
	goto_if_ne _0727
	trainer_battle TRAINER_PASSERBY_BOY_3, 0, 1, 0
	goto _072F

_0727:
	trainer_battle TRAINER_PASSERBY_BOY, 0, 1, 0
_072F:
	check_battle_won VAR_SPECIAL_RESULT
	callstd std_play_rival_outro_music
	npc_msg msg_0550_T21_00014
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _076B
	apply_movement obj_player, _0890
	goto _0773

_076B:
	apply_movement obj_player, _08A4
_0773:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _079A
	apply_movement obj_T21_gsrivel, _0810
	goto _07A2

_079A:
	apply_movement obj_T21_gsrivel, _0844
_07A2:
	wait_movement
	npc_msg msg_0550_T21_00015
	closemsg
	get_person_coords 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 401
	goto_if_ne _07D4
	apply_movement obj_T21_gsrivel, _0880
	apply_movement obj_player, _08B8
	goto _07E4

_07D4:
	apply_movement obj_T21_gsrivel, _0878
	apply_movement obj_player, _08B8
_07E4:
	wait_movement
	hide_person obj_T21_gsrivel
	setflag FLAG_HIDE_CHERRYGROVE_RIVAL
	callstd std_fade_end_rival_outro_music
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 4
	setflag FLAG_MET_PASSERBY_BOY
	end

_0800:
	white_out
	releaseall
	end

	.balign 4, 0
_0808:
	step 14, 7
	step_end

	.balign 4, 0
_0810:
	step 14, 6
	step 75, 1
	step 37, 1
	step 63, 1
	step 36, 1
	step 63, 1
	step 37, 1
	step 63, 1
	step 35, 1
	step 63, 1
	step 15, 5
	step 33, 1
	step_end

	.balign 4, 0
_0844:
	step 14, 6
	step 75, 1
	step 37, 1
	step 63, 1
	step 36, 1
	step 63, 1
	step 37, 1
	step 63, 1
	step 35, 1
	step 63, 1
	step 15, 5
	step 32, 1
	step_end

	.balign 4, 0
_0878:
	step 14, 11
	step_end

	.balign 4, 0
_0880:
	step 14, 5
	step 12, 1
	step 14, 6
	step_end

	.balign 4, 0
_0890:
	step 0, 1
	step 71, 1
	step 17, 1
	step 72, 1
	step_end

	.balign 4, 0
_08A4:
	step 1, 1
	step 71, 1
	step 16, 1
	step 72, 1
	step_end

	.balign 4, 0
_08B8:
	step 63, 2
	step 34, 1
	step_end

scr_seq_T21_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN, _0903
	npc_msg msg_0550_T21_00020
	goto_if_no_item_space ITEM_MYSTIC_WATER, 1, _090E
	callstd std_give_item_verbose
	setflag FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN
_0903:
	npc_msg msg_0550_T21_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_090E:
	npc_msg msg_0550_T21_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T21_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A41
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A55
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0992
	apply_movement obj_player, _0A6C
	apply_movement obj_T21_gsmiddleman1, _0AC0
	goto _09E0

_0992:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _09AD
	apply_movement obj_player, _0A84
	goto _09E0

_09AD:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _09D0
	apply_movement obj_player, _0AA4
	apply_movement obj_T21_gsmiddleman1, _0AC0
	goto _09E0

_09D0:
	apply_movement obj_player, _0A90
	apply_movement obj_T21_gsmiddleman1, _0AC0
_09E0:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A07
	apply_movement obj_partner_poke, _0ACC
	wait_movement
_0A07:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 1
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0A41:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0A55:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0A6C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

	.balign 4, 0
_0A84:
	step 12, 3
	step 33, 1
	step_end

	.balign 4, 0
_0A90:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

	.balign 4, 0
_0AA4:
	step 13, 1
	step 15, 2
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

	.balign 4, 0
_0AC0:
	step 63, 1
	step 32, 1
	step_end

	.balign 4, 0
_0ACC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end

scr_seq_T21_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0550_T21_00024, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T21_006:
	direction_signpost msg_0550_T21_00023, 0, 12, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T21_007:
	simple_npc_msg msg_0550_T21_00019
	end

scr_seq_T21_008:
	simple_npc_msg msg_0550_T21_00017
	end

scr_seq_T21_011:
	simple_npc_msg msg_0550_T21_00025
	end

; Cherrygrove townsfolk chatter, shared by both crowd generations: the pinned
; battle-watchers (gsboy1/gswoman1/gsbigman, present only through Scene 1) and
; their post-battle wanderer twins (gsboy2/gswoman2/gsbigman2, spread around
; town after the Gold/Silver fight). Placeholder chatter -- rewrite later.
scr_seq_T21_015:
	simple_npc_msg msg_0550_T21_00065
	end

scr_seq_T21_016:
	simple_npc_msg msg_0550_T21_00066
	end

scr_seq_T21_017:
	simple_npc_msg msg_0550_T21_00067
	end

; APOCRYPHA Scene 1 - Silver in Cherrygrove. Kestra watches on-screen with the
; town crowd, the player turns to face the battle, then Kestra crosses over for a
; first-meeting / get-to-know-you exchange where the player is finally NAMED.
scr_seq_T21_012:
	scrcmd_609
	lockall
	hide_person obj_T21_silverbird
	; Kestra spawns live at (553,401) on map load (her hide flag is clear at
	; chapter start), so a bare show_person here creates a stacked DUPLICATE and
	; the original is left standing after her run-off. hide -> clear -> show
	; recreates her cleanly whether she's live or hidden (same pattern as Gold
	; in _013).
	hide_person obj_T21_friend
	clearflag FLAG_HIDE_CHERRYGROVE_FRIEND
	show_person obj_T21_friend
	; The 10x7 trigger fires on the player's first FREE step out of the house, at one of
	; three tiles depending on direction: S->(547,401), W->(546,400), E->(548,400). Walk
	; them to the watch vantage (553,402) - one tile due south of Kestra - from whichever
	; tile they tripped it on, so they ALWAYS end up beside her facing the fight. (This is
	; the "specified path per tile" approach; apply_movement is exact, so each branch is a
	; fixed collision-free path that converges to (553,402) along z=402, south of Kestra.)
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 546
	goto_if_eq _apoc_watch_from_w
	compare VAR_TEMP_x4000, 548
	goto_if_eq _apoc_watch_from_e
	apply_movement obj_player, _apoc_watch_walk
	goto _apoc_watch_done
_apoc_watch_from_w:
	apply_movement obj_player, _apoc_watch_walk_l
	goto _apoc_watch_done
_apoc_watch_from_e:
	apply_movement obj_player, _apoc_watch_walk_r
_apoc_watch_done:
	wait_movement
	apply_movement obj_player, _apoc_face_e
	wait_movement
	; APOC camera: pan to the Gold/Silver clash so the player WATCHES the fight, not
	; a static crowd. scrcmd_102 plants an invisible focus (obj 241) at the player,
	; then moving that focus pans the camera (base-game recipe; obj 241 takes normal
	; step dirs). Player (553,402) -> clash (556,403): 3 east, 1 south. Restored with
	; a pan-back + scrcmd_103 after the Murkrow flies off, before the first-meeting.
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _apoc_cam_to_battle
	wait_movement
	npc_msg msg_0550_T21_00033
	closemsg
	npc_msg msg_0550_T21_00056
	closemsg
	npc_msg msg_0550_T21_00026
	closemsg
	npc_msg msg_0550_T21_00027
	closemsg
	npc_msg msg_0550_T21_00057
	closemsg
	npc_msg msg_0550_T21_00028
	npc_msg msg_0550_T21_00029
	npc_msg msg_0550_T21_00030
	npc_msg msg_0550_T21_00031
	closemsg
	npc_msg msg_0550_T21_00035
	closemsg
	npc_msg msg_0550_T21_00032
	closemsg
	hide_person obj_T21_gsrivel
	hide_person obj_T21_typhlosion
	hide_person obj_T21_alakazam
	clearflag FLAG_HIDE_CHERRYGROVE_SILVER
	show_person obj_T21_silverbird
	apoc_fly_away obj_T21_silverbird, SPECIES_MURKROW
	hide_person obj_T21_silverbird
	; apoc_fly_away removes the bird itself, so the hide_person above no-ops and
	; never re-sets the flag; set it explicitly so a save+reset at OW==1 doesn't
	; respawn on-foot Silver / the wild mon (they share this flag).
	setflag FLAG_HIDE_CHERRYGROVE_SILVER
	; APOC camera: fight's over and Silver flew off - pan the focus back to the player,
	; then release it so the face-to-face and naming are framed on the kids.
	apply_movement 241, _apoc_cam_back
	wait_movement
	scrcmd_103
	; First meeting: the watch-walk leaves the player at (553,402), one tile due south
	; of Kestra (553,401), so they're already adjacent - just turn them to face each
	; other (Kestra south toward the player, player north toward Kestra). No step-pop.
	apply_movement obj_T21_friend, _apoc_face_s
	apply_movement obj_player, _apoc_face_n
	wait_movement
	; Kestra's first DIRECT address plays only now -- after the camera has panned
	; back and the two are facing each other (her mid-battle lines 33/35 stay back
	; in the watch sequence; those are deliberately delivered eyes-on-the-fight).
	npc_msg msg_0550_T21_00034
	closemsg
	npc_msg msg_0550_T21_00036
	closemsg
	npc_msg msg_0550_T21_00058
	closemsg
	; --- naming: fade OUT, name, fade back IN (a field name_player leaves the
	; screen faded to black, so we must restore it - mirrors the lab name_rival).
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	name_player VAR_SPECIAL_RESULT
	; The Champion's gone and the show's over. The named NPCs (guide gent + Cameron)
	; leave -- hide them while the screen is black so there's no visible pop.
	hide_person obj_T21_gsoldman1
	hide_person obj_T21_gsmiddleman1
	; Crowd swap (two-object pattern, same as Mom in T20R0201): the pinned
	; battle-watchers (gsboy1/gswoman1/gsbigman, shared eventFlag B2F_MURKROW_2)
	; leave their spectator marks for good -- hide_person persist-SETS that flag.
	; Their wanderer twins (gs*2, gated on B3F_MURKROW_2, set since new-game
	; init) are revealed spread around town and free-roam from here on. All of
	; this happens while the screen is still black, so no visible pop.
	hide_person obj_T21_gsboy1
	hide_person obj_T21_gswoman1
	hide_person obj_T21_gsbigman
	wait 8, VAR_SPECIAL_RESULT
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	show_person obj_T21_gsboy2
	show_person obj_T21_gswoman2
	show_person obj_T21_gsbigman2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	buffer_players_name 0
	; Now that the player has a name, unlock the name-bearing menus (Trainer Card
	; / Save) - deferred from the opening so they never render a blank name.
	setflag FLAG_GOT_TRAINER_CARD
	setflag FLAG_GOT_SAVE_BUTTON
	npc_msg msg_0550_T21_00059
	closemsg
	npc_msg msg_0550_T21_00060
	closemsg
	npc_msg msg_0550_T21_00061
	closemsg
	; Kestra runs off north toward the grass, then hides. Gold STAYS in town -
	; visible and interactable (his _011 talk line) - and rushes in during Scene 2.
	apply_movement obj_T21_friend, _apoc_kestra_runoff
	wait_movement
	hide_person obj_T21_friend
	setflag FLAG_HIDE_CHERRYGROVE_FRIEND
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 1
	releaseall
	end

	.balign 4, 0
_apoc_to_kestra:
	step 13, 3
	step 15, 6
	step_end
	.balign 4, 0
; Scene 1 opening: the coord trigger is a 10x7 area; the player trips it at (547,401)
; one step out of the house. Walk them to (553,402) - one tile due south of Kestra
; (553,401) - so they watch the Gold/Silver battle beside her, facing east. The path
; runs along z=402, south of Kestra, clear of every actor spawn. S1, E6.
_apoc_watch_walk:
	step 13, 1
	step 15, 6
	step_end
	.balign 4, 0
; Tripped via a WEST first step, at (546,400): S2, E7 -> (553,402).
_apoc_watch_walk_l:
	step 13, 2
	step 15, 7
	step_end
	.balign 4, 0
; Tripped via an EAST first step, at (548,400): S2, E5 -> (553,402).
_apoc_watch_walk_r:
	step 13, 2
	step 15, 5
	step_end
	.balign 4, 0
_apoc_kestra_runoff:
	step 12, 5
	step_end
	.balign 4, 0
_apoc_face_e:
	step 3, 1
	step_end
	.balign 4, 0
_apoc_face_n:
	step 0, 1
	step_end
	.balign 4, 0
; APOC camera pan tables: move the focus (obj 241) from the player (553,402) to the
; Gold/Silver clash (556,403) and back. obj 241 takes normal step dirs: 15=E,14=W,13=S,12=N.
_apoc_cam_to_battle:
	step 15, 3
	step 13, 1
	step_end
	.balign 4, 0
_apoc_cam_back:
	step 14, 3
	step 12, 1
	step_end
	.balign 4, 0

; --- Scene 2 Part 1: north-grass rescue. Kestra is calm, searching the grass;
; the player walks up; she excitedly spots a wild mon; Gold arrives a beat too
; late and has no choice but to catch it himself. ---
scr_seq_T21_013:
	scrcmd_609
	lockall
	; --- Normalize the player's x. They trip the grass trigger anywhere across
	; x 547-550; snap them to x=548 (apply_movement is exact/forced) so the rescue
	; face-to-face AND the relative walk-home both land deterministically. ---
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 547
	goto_if_eq _apoc_norm_e1
	compare VAR_TEMP_x4000, 549
	goto_if_eq _apoc_norm_w1
	compare VAR_TEMP_x4000, 550
	goto_if_eq _apoc_norm_w2
	goto _apoc_norm_done
_apoc_norm_e1:
	apply_movement obj_player, _apoc_step_e1
	wait_movement
	goto _apoc_norm_done
_apoc_norm_w1:
	apply_movement obj_player, _apoc_step_w1
	wait_movement
	goto _apoc_norm_done
_apoc_norm_w2:
	apply_movement obj_player, _apoc_step_w2
	wait_movement
_apoc_norm_done:
	; Kestra is in the grass, peering around (she ran ahead at the end of Scene 1).
	; She was deleted+hidden at the end of Scene 1, so clear her hide flag and
	; show_person BEFORE move_person_facing (op 339 NULL-derefs on a dead object).
	clearflag FLAG_HIDE_CHERRYGROVE_FRIEND
	move_person obj_T21_friend, 548, 385
	show_person obj_T21_friend
	apply_movement obj_T21_friend, _apoc_search
	wait_movement
	; forced face-to-face: player looks up at her, she turns to face the player
	apply_movement obj_player, _apoc_face_n
	wait_movement
	apply_movement obj_T21_friend, _apoc_face_s
	wait_movement
	buffer_players_name 0
	npc_msg msg_0550_T21_00039
	closemsg
	; the wild Pokemon she spotted reveals itself, deeper in the grass. It shares
	; FLAG_HIDE_CHERRYGROVE_SILVER (set after Scene 1) with on-foot Silver and the
	; Murkrow, so clear it to spawn the mon; it is re-set explicitly before the warp.
	clearflag FLAG_HIDE_CHERRYGROVE_SILVER
	; Gold rushes in from town - too late. He may be loaded (just left in town),
	; unloaded (player walked far north), or hidden; hide -> set spawn -> clear ->
	; show recreates him cleanly at the grass regardless of which state he's in.
	hide_person obj_T21_gold
	move_person obj_T21_gold, 548, 387
	clearflag FLAG_HIDE_CHERRYGROVE_GOLD
	show_person obj_T21_gold
	apply_movement obj_T21_gold, _apoc_gold_alert
	wait_movement
	npc_msg msg_0550_T21_00040
	closemsg
	; --- Apocrypha custom catch: Gold catches the wild one HIMSELF (no player
	; battle). He turns to it and throws; it struggles, gets pulled into the ball,
	; the ball settles, and it's caught. A veteran's quick demo for the kids -
	; replaces the engine catching_tutorial (which handed control to the player
	; with a borrowed Marill rendered as the wrong-gender hero, and contradicted
	; Gold having just beaten the Champion with his own team).
	apply_movement obj_T21_gold, _apoc_gold_throw
	wait_movement
	play_se SEQ_SE_GS_NAGERU
	wait 16, VAR_SPECIAL_RESULT
	wait 22, VAR_SPECIAL_RESULT
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	npc_msg msg_0550_T21_00041
	closemsg
	npc_msg msg_0550_T21_00042
	closemsg
	; Re-hide leftover Scene-1 actors so none linger during the walk home.
	setflag FLAG_HIDE_CHERRYGROVE_SILVER
	; --- Gold walks the kids back into town. NO warp: the camera follows the
	; player, Gold leads, Kestra trails. Movement tables were recorded from the
	; live map so the trio can't collide or wall-hang (Kestra's table has a
	; lead-in delay to stay a beat behind). Leg A -> the Mart/Center vantage. ---
	apply_movement obj_T21_gold, _apoc_walk_gold_a
	apply_movement obj_player, _apoc_walk_player_a
	apply_movement obj_T21_friend, _apoc_walk_kestra_a
	wait_movement
	; Gold turns to the kids and gives the tour Kestra wanted (points out town).
	apply_movement obj_T21_gold, _apoc_face_w
	wait_movement
	npc_msg msg_0550_T21_00064
	closemsg
	; Leg B -> the rest of the way to Gold's house.
	apply_movement obj_T21_gold, _apoc_walk_gold_b
	apply_movement obj_player, _apoc_walk_player_b
	apply_movement obj_T21_friend, _apoc_walk_kestra_b
	wait_movement
	; Settle for the ceremony at Gold's door. The player was normalized to x=548 at
	; the rescue head, so the relative walk-home leaves them on a deterministic tile in
	; front of the house every run. Pin Kestra and Gold to exact tiles relative to where
	; the player lands; the player just turns to face Gold. (Tiles set after measuring.)
	move_person_facing obj_T21_friend, 556, 0, 404, DIR_NORTH
	move_person_facing obj_T21_gold, 557, 0, 403, DIR_SOUTH
	apply_movement obj_player, _apoc_face_n
	wait_movement
	goto _T21_ceremony_body

	.balign 4, 0
_apoc_search:
	step 2, 1
	step 3, 1
	step 0, 1
	step_end
	.balign 4, 0
_apoc_face_s:
	step 1, 1
	step_end
	.balign 4, 0
_apoc_mon_stir:
	step 75, 1
	step_end
	.balign 4, 0
_apoc_gold_alert:
	step 0, 1
	step 75, 1
	step_end
	.balign 4, 0
; Gold turns to face the wild Rattata (north of him) to make the catch.
_apoc_gold_throw:
	step 0, 1
	step_end
	.balign 4, 0
; The wild one jitters in place (struggling) before it's pulled into the ball.
_apoc_mon_shake:
	step 37, 3
	step_end
	.balign 4, 0
; Player x-normalization steps for the rescue head (snap to x=548).
_apoc_step_e1:
	step 15, 1
	step_end
	.balign 4, 0
_apoc_step_w1:
	step 14, 1
	step_end
	.balign 4, 0
_apoc_step_w2:
	step 14, 2
	step_end
	.balign 4, 0

; --- Scene 2 Part 2: outdoor ceremony at Gold's house (after the warp) ---
scr_seq_T21_014:
	scrcmd_609
	lockall
	; Place both kids and Gold while the screen is still black (the warp left it
	; faded out). clearflag->show_person->move_person_facing is robust whether the
	; actor reloaded live or hidden after the self-warp.
	clearflag FLAG_HIDE_CHERRYGROVE_FRIEND
	show_person obj_T21_friend
	move_person_facing obj_T21_friend, 557, 0, 403, DIR_NORTH
	clearflag FLAG_HIDE_CHERRYGROVE_GOLD
	show_person obj_T21_gold
	move_person_facing obj_T21_gold, 558, 0, 402, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	; Shared ceremony body. Reached two ways: (1) the dead OW==2 warp path above
	; (no longer triggered), and (2) a goto from _013 after Gold walks them home.
_T21_ceremony_body:
	npc_msg msg_0550_T21_00043
	closemsg
	npc_msg msg_0550_T21_00044
	npc_msg msg_0550_T21_00045
	buffer_players_name 0
	npc_msg msg_0550_T21_00046
	npc_msg msg_0550_T21_00047
	npc_msg msg_0550_T21_00048
	npc_msg msg_0550_T21_00049
	closemsg
	hide_person obj_T21_gold
	play_se SEQ_SE_DP_KAIDAN2
	; ~2s beat at Gold's door: the two kids glance at each other, then turn back
	; to the door as he returns.
	apply_movement obj_player, _apoc_face_w
	apply_movement obj_T21_friend, _apoc_face_e
	wait_movement
	wait 50, VAR_SPECIAL_RESULT
	apply_movement obj_player, _apoc_face_n
	apply_movement obj_T21_friend, _apoc_face_n
	wait_movement
	clearflag FLAG_HIDE_CHERRYGROVE_GOLD
	show_person obj_T21_gold
	move_person_facing obj_T21_gold, 558, 0, 402, DIR_SOUTH
	npc_msg msg_0550_T21_00050
	npc_msg msg_0550_T21_00051
	closemsg
	choose_starter
	setflag FLAG_GOT_STARTER
	; Ch1 is ending -> reveal the Route-30 opener Kestra (hidden since the cold open)
	; so she's present when the player heads onto Route 30. Her Ch2 opener is untouched.
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_1
	scrcmd_605 3, 2
	toggle_following_pokemon_movement 0
	scrcmd_608
	wait 10, VAR_SPECIAL_RESULT
	toggle_following_pokemon_movement 1
	get_partymon_species 0, VAR_TEMP_x4001
	set_starter_choice VAR_TEMP_x4001
	buffer_mon_species_name 1, 0
	npc_msg msg_0550_T21_00052
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	compare VAR_TEMP_x4001, SPECIES_CHIKORITA
	goto_if_eq _T21_friend_cynda
	compare VAR_TEMP_x4001, SPECIES_CYNDAQUIL
	goto_if_eq _T21_friend_toto
	setvar VAR_APOC_FRIEND_STARTER, SPECIES_CHIKORITA
	goto _T21_friend_named
_T21_friend_cynda:
	setvar VAR_APOC_FRIEND_STARTER, SPECIES_CYNDAQUIL
	goto _T21_friend_named
_T21_friend_toto:
	setvar VAR_APOC_FRIEND_STARTER, SPECIES_TOTODILE
_T21_friend_named:
	buffer_species_name 1, VAR_APOC_FRIEND_STARTER, 0, 0
	npc_msg msg_0550_T21_00053
	closemsg
	; Gold's begrudging gear handoff - the LIVE Running Shoes + Map Card grant
	npc_msg msg_0550_T21_00062
	give_running_shoes
	register_pokegear_card 1
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	buffer_players_name 0
	npc_msg msg_0550_T21_00063
	closemsg
	npc_msg msg_0550_T21_00054
	closemsg
	; Kestra tears off toward Route 29 (msg 54: race to Elm's lab in New Bark;
	; Gold's next line points "Route 29, straight east" after her): she rounds
	; the player via z=404, cuts north to the Route 29 road at z=400, and only
	; despawns once she's past the right edge of the frame at (568,400).
	apply_movement obj_T21_friend, _apoc_kestra_to_r29
	wait_movement
	hide_person obj_T21_friend
	setflag FLAG_HIDE_CHERRYGROVE_FRIEND
	npc_msg msg_0550_T21_00055
	closemsg
	; Gold steps from his settle tile (558,402) up onto his own front-door tile
	; (558,401) and heads inside - the standard walk-onto-door exit, with the
	; door SE moved here from Kestra (she was nowhere near a door).
	apply_movement obj_T21_gold, _apoc_gold_indoors
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T21_gold
	setflag FLAG_HIDE_CHERRYGROVE_GOLD
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 3
	releaseall
	end

	.balign 4, 0
; Ceremony farewell: Kestra's Route-29 run-off. From her ceremony tile (557,403)
; she steps S to z=404 (rounding the player, who stands at (558,403)), east along
; z=404 to x=564, north up the open x=564 column to the Route 29 road at z=400,
; then east to (568,400) - fully past the right edge of the frame - and despawns.
; Every tile verified walkable on map_matrix_0000_EVERYWHERE.bin.
_apoc_kestra_to_r29:
	step 13, 1
	step 15, 7
	step 12, 4
	step 15, 4
	step_end

	.balign 4, 0
; Ceremony farewell: Gold steps from his settle tile (558,402) one tile north
; onto his own front-door tile (558,401), tile type 0x69 - walk-onto-door, door
; SE, then hide: the standard enter-house exit.
_apoc_gold_indoors:
	step 12, 1
	step_end
	.balign 4, 0

; --- Scene 2 "walk home" choreography (recorded from the live map; collision-free).
; STEP_DOWN=13 STEP_UP=12 STEP_LEFT=14 STEP_RIGHT=15 FACE_LEFT=2 WALK_IN_PLACE=37.
_apoc_face_w:
	step 2, 1
	step_end
	.balign 4, 0
_apoc_walk_gold_a:
	step 13, 4
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step_end
	.balign 4, 0
_apoc_walk_player_a:
	step 13, 5
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step_end
	.balign 4, 0
_apoc_walk_kestra_a:
	step 37, 1
	step 13, 8
	step 15, 1
	step 13, 1
	step_end
	.balign 4, 0
_apoc_walk_gold_b:
	step 13, 2
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 3
	step 15, 2
	step_end
	.balign 4, 0
_apoc_walk_player_b:
	step 13, 2
	step 15, 1
	step 13, 2
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 2
	step_end
	.balign 4, 0
_apoc_walk_kestra_b:
	step 15, 1
	step 13, 2
	step 15, 1
	step 13, 3
	step 15, 1
	step 13, 1
	step 15, 2
	step 13, 2
	step 15, 1
	step 13, 1
	step 15, 1
	step 13, 1
	step_end
	.balign 4, 0

; ============================================================================
; APOCRYPHA Ch1 Scene 2-B: the grand tour. Auto-fires as a map-load SCENE
; script (wired in scr_seq_0623_T21_hdr.s) when the R30 rescue warps the trio
; to the north gate with VAR_SCENE_CHERRYGROVE_CITY_OW == 2. Five stops, each
; with its own beat: the Poke Center (msg 64), the Poke Mart (msg 70), the
; Route 29 mouth (msg 68), the sea (msgs 71/69), and Gold's doorstep, where
; the starter ceremony picks up (goto _T21_ceremony_body - its "that's the
; tour" opener lands as the punchline). Movement is a conga line derived from
; a collision-probed player path: leader = path minus its first step plus one
; extended step, trailer = one step into the player's start plus the path
; minus its last step. Equal step counts per leg keep the three exactly one
; tile apart the whole way. East-west walking stays on z=394 - z=393 carries
; the Mart/Center door warps; the R29 leg stops at x=573, shy of the x>=575
; map connection.
scr_seq_T21_018:
	scrcmd_609
	lockall
	; The plaza wanderers freeze wherever lockall catches them - possibly on a
	; path tile; hide them for the scene (session-only, back next map load).
	hide_person obj_T21_gsboy2
	hide_person obj_T21_gswoman2
	; Stage the trio at the north gate under the black the R30 warp held:
	; Kestra a step behind the player, Gold a step ahead, facing into town.
	clearflag FLAG_HIDE_CHERRYGROVE_FRIEND
	show_person obj_T21_friend
	move_person_facing obj_T21_friend, 549, 0, 386, DIR_SOUTH
	clearflag FLAG_HIDE_CHERRYGROVE_GOLD
	show_person obj_T21_gold
	move_person_facing obj_T21_gold, 549, 0, 388, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	; Stop 1 - the Poke Center. Down the gate path, east along the shop street
	; (z=394 - z=393 carries the Mart/Center door warps, never walk it) to the
	; Center front: player (564,394), under the door. Gold leads, overshoots to
	; (565,394), and turns back to the kids.
	apply_movement obj_T21_gold, _tour_gold_1
	apply_movement obj_player, _tour_player_1
	apply_movement obj_T21_friend, _tour_kestra_1
	wait_movement
	apply_movement obj_T21_gold, _apoc_face_w
	wait_movement
	npc_msg msg_0550_T21_00064
	closemsg
	; Stop 2 - the Poke Mart. Nine tiles straight back west on z=394; the line
	; reverses - Kestra in front - and the player lands under the Mart door at
	; (555,394). Gold calls it from the back; the kids turn to face him.
	apply_movement obj_T21_friend, _tour_kestra_2
	apply_movement obj_player, _tour_player_2
	apply_movement obj_T21_gold, _tour_gold_2
	wait_movement
	apply_movement obj_player, _apoc_face_e
	apply_movement obj_T21_friend, _apoc_face_e
	apply_movement obj_T21_gold, _apoc_face_w
	wait_movement
	npc_msg msg_0550_T21_00070
	closemsg
	; Stop 3 - the Route 29 mouth. East again, down the x=565 alley, then east
	; along z=398 to (573,398) - two tiles shy of the x>=575 map connection.
	; Gold leads; he turns back and the road east frames behind him.
	apply_movement obj_T21_gold, _tour_gold_3
	apply_movement obj_player, _tour_player_3
	apply_movement obj_T21_friend, _tour_kestra_3
	wait_movement
	apply_movement obj_T21_gold, _apoc_face_w
	wait_movement
	npc_msg msg_0550_T21_00068
	closemsg
	; Stop 4 - the sea. Back west through the alley, down x=565 to the plaza
	; row (z=402 - the only passage west; Gold's house blocks z=398-401), and
	; west to the shore: Kestra (543,402), player (544,402), Gold (545,402).
	; All three look out at the water for the sea speech.
	apply_movement obj_T21_friend, _tour_kestra_4
	apply_movement obj_player, _tour_player_4
	apply_movement obj_T21_gold, _tour_gold_4
	wait_movement
	apply_movement obj_player, _apoc_face_w
	apply_movement obj_T21_friend, _apoc_face_w
	apply_movement obj_T21_gold, _apoc_face_w
	wait_movement
	npc_msg msg_0550_T21_00071
	closemsg
	npc_msg msg_0550_T21_00069
	closemsg
	; Stop 5 - home. East along the plaza row to Gold's front door. Gold leads
	; and overshoots one tile east; the player and Kestra drop south in
	; parallel on the last beat onto their ceremony tiles.
	apply_movement obj_T21_gold, _tour_gold_5
	apply_movement obj_player, _tour_player_5
	apply_movement obj_T21_friend, _tour_kestra_5
	wait_movement
	; Doorstep staging: the walk itself lands the player at (558,403) and Kestra
	; at (557,403), one west. Only Gold needs a settle: he vacated east to
	; (559,402); pin him to (558,402) facing south - one tile south of his door,
	; so his later exit/entrance can actually use it.
	move_person_facing obj_T21_gold, 558, 0, 402, DIR_SOUTH
	apply_movement obj_player, _apoc_face_n
	apply_movement obj_T21_friend, _apoc_face_n
	wait_movement
	goto _T21_ceremony_body

	.balign 4, 0
; --- tour leg 1: (549,387) D1 R2 D6 R13 -> the Center front (564,394) ---
_tour_player_1:
	step 13, 1
	step 15, 2
	step 13, 6
	step 15, 13
	step_end
	.balign 4, 0
_tour_gold_1:
	step 15, 2
	step 13, 6
	step 15, 14
	step_end
	.balign 4, 0
_tour_kestra_1:
	step 13, 2
	step 15, 2
	step 13, 6
	step 15, 12
	step_end
	.balign 4, 0
; --- tour leg 2: straight west on z=394, L9 -> the Mart front (555,394);
; Kestra (554,394), Gold (556,394). No turns, so all three just step west. ---
_tour_kestra_2:
	step 14, 9
	step_end
	.balign 4, 0
_tour_player_2:
	step 14, 9
	step_end
	.balign 4, 0
_tour_gold_2:
	step 14, 9
	step_end
	.balign 4, 0
; --- tour leg 3: (555,394) R10 D4 R7 -> the R29 mouth (572,398); Gold ahead
; at (573,398), Kestra behind at (571,398). The x=565 column is the only
; north-south alley between the shop street and the east pocket. ---
_tour_gold_3:
	step 15, 9
	step 13, 4
	step 15, 8
	step_end
	.balign 4, 0
_tour_player_3:
	step 15, 10
	step 13, 4
	step 15, 7
	step_end
	.balign 4, 0
_tour_kestra_3:
	step 15, 11
	step 13, 4
	step 15, 6
	step_end
	.balign 4, 0
; --- tour leg 4: (572,398) L7 D4 L21 -> the shore (544,402). Back through
; the alley, down x=565 to the plaza row, then west to the water's edge.
; Kestra leads the reversed line. ---
_tour_kestra_4:
	step 14, 6
	step 13, 4
	step 14, 22
	step_end
	.balign 4, 0
_tour_player_4:
	step 14, 7
	step 13, 4
	step 14, 21
	step_end
	.balign 4, 0
_tour_gold_4:
	step 14, 8
	step 13, 4
	step 14, 20
	step_end
	.balign 4, 0
; --- tour leg 5: (544,402) R14 D1 -> (558,403), the door front. The kids
; drop south in parallel on the last beat - player (558,403), Kestra
; (557,403) - while Gold vacates east to (559,402) for his settle pin onto
; (558,402), directly below the door so he can still walk inside. ---
_tour_gold_5:
	step 15, 14
	step_end
	.balign 4, 0
_tour_player_5:
	step 15, 14
	step 13, 1
	step_end
	.balign 4, 0
_tour_kestra_5:
	step 15, 14
	step 13, 1
	step_end
	.balign 4, 0

; --- Apocrypha regionport ferry (temporary scaffolding): Cherrygrove beach
; sailor -> Canalave City, Sinnoh. Return leg lives in this same bank because
; the Sinnoh arrival header points its scriptsBank here. No dialogue in v1.
scr_seq_T21_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_APOC_SINNOH_CANALAVE_CITY, 0, 38, 743, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_T21_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_CHERRYGROVE, 0, 559, 409, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

; --- Apocrypha regionport ferry: Cherrygrove beach -> Slateport City, Hoenn
scr_seq_T21_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_APOC_HOENN_SLATEPORT_CITY, 0, 216, 272, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_T21_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_CHERRYGROVE, 0, 564, 408, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

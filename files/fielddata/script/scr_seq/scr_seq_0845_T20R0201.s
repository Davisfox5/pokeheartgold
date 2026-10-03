#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0201.h"
#include "msgdata/msg/msg_0545_T20R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0201_000
	scrdef scr_seq_T20R0201_001
	scrdef scr_seq_T20R0201_002
	scrdef scr_seq_T20R0201_003
	scrdef scr_seq_T20R0201_004
	scrdef scr_seq_T20R0201_005
	scrdef scr_seq_T20R0201_006
	scrdef scr_seq_T20R0201_007
	scrdef scr_seq_T20R0201_008
	scrdef_end

; APOCRYPHA Scene 0 - the cold open: black -> "..." -> Mom wakes you -> "our new
; home" -> brighten to reveal the new Cherrygrove house -> Kalos dialogue ->
; "go upstairs and set up your PC."
scr_seq_T20R0201_000:
	scrcmd_609
	lockall
	; The wandering post-hand-off Mom (gsmama2) spawns on a brand-new game because
	; her gate flag starts clear. Despawn her while the screen is still dark --
	; hide_person also SETS her eventFlag, so she stays gone until the hand-off
	; clears it. Only the pinned door-post Mom remains through Ch1's opening.
	hide_person obj_T20R0201_gsmama2
	; The engine already fades the map UP from black on a new game; adding our own
	; fade-to-black is what caused the house to "flash" then go black. Just wait for
	; the engine's fade to finish, then play the dialogue on the lit house.
	; (True "..."-on-black narration like Oak's intro needs oaks_speech C work.)
	wait_fade
	callstd std_play_mom_music
	; Player walks down beside Mom (5,9 -> 5,10 -> 4,10); the final westward step
	; leaves the player facing W at Mom on the door tile (3,10), so the exchange is
	; cardinal-adjacent and mutual (Mom turns E below).
	apply_movement obj_player, _apoc_player_to_mom
	wait_movement
	; Mom turns to face the player (east). She STAYS on the door tile (3,10), so she
	; physically gates the exit until the Pokegear hand-off scene moves her.
	apply_movement obj_T20R0201_gsmama, _apoc_mom_face_p
	wait_movement
	npc_msg msg_0545_T20R0201_00042
	closemsg
	npc_msg msg_0545_T20R0201_00043
	closemsg
	npc_msg msg_0545_T20R0201_00044
	closemsg
	callstd std_fade_end_mom_music
	; Hide the Route 30 Ch1-rescue Rattata + Gold until the catch reveals them
	; (their FLAG_UNK_* event-flags are clear=visible by default; set = hidden).
	setflag FLAG_UNK_234
	setflag FLAG_UNK_239
	; Also hide the Ch2 Route-30 opener Kestra (obj_R30_kestra) so she doesn't stand
	; frozen in the trees by the gate all through Ch1. She's revealed at the Ch1
	; starter ceremony (T21_014). Reuses a vacated Team Rocket hideout flag.
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_1
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 1
	releaseall
	end

	.balign 4, 0
; Cold open: player walks S one tile then W one tile, ending at (4,10) facing W
; (the last step's direction is the resting facing) -- directly at Mom on (3,10).
_apoc_player_to_mom:
	step 13, 1
	step 14, 1
	step_end

	.balign 4, 0
; Player turns to face south (down) toward Mom, who is placed one tile south.
_apoc_player_face_s:
	step 1, 1
	step_end

	.balign 4, 0
; Mom faces right (east), toward the player, for the cold-open conversation.
_apoc_mom_face_p:
	step 3, 1
	step_end

	.balign 4, 0
; Mom walks one tile south onto the front door, then faces back north into the room.
_apoc_mom_to_door:
	step 13, 1
	step 0, 1
	step_end

	.balign 4, 0
; Player walks down off the stairs into the room, out of the cramped top-left
; corner, so the send-off plays in the open instead of facing the stair wall.
_apoc_come_downstairs:
	step 13, 3
	step_end

	.balign 4, 0
; Mom walks up from her post ON the door tile (3,10) to (3,7), face-to-face with
; the player who has just walked down off the stairs to (3,6).
_apoc_cd_mom_up:
	step 12, 3
	step_end

	.balign 4, 0
; After the send-off Mom steps back toward the door and turns to face the player
; (stays visible; the door tile is reached from the east so she never blocks it).
_apoc_mom_return:
	step 13, 3
	step 0, 1
	step_end

scr_seq_T20R0201_006:
	scrcmd_609
	lockall
	; Walk the player down off the stairs into the room while Mom comes up from
	; the door, so the whole send-off plays face-to-face in the open room instead
	; of jammed in the stairs corner with the player facing the wall.
	apply_movement obj_player, _apoc_come_downstairs
	apply_movement obj_T20R0201_gsmama, _apoc_cd_mom_up
	wait_movement
	callstd std_play_mom_music
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00033
	closemsg
	; Hand over the bag/menu/Pokegear here too, so simply coming downstairs leaves
	; the player equipped (closes the door-gate hole where var==4 had no Pokegear).
	call _apoc_give_pokegear
	apply_movement obj_T20R0201_gsmama, _apoc_mom_return
	wait_movement
	call _apoc_mom_start_wandering
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 4
	releaseall
	end

scr_seq_T20R0201_001:
	; Safety net: if the player reached Mom without the Pokegear (skipped the PC
	; or left early), hand it over on talk so it can never be permanently missed.
	goto_if_set FLAG_GOT_POKEGEAR, _001_normal
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call _apoc_give_pokegear
	call _apoc_mom_start_wandering
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 4
	releaseall
	end
_001_normal:
	goto_if_set FLAG_GAME_CLEAR, _015C
	compare VAR_SCENE_ELMS_LAB, 4
	goto_if_ge _0205
	goto_if_set FLAG_GOT_STARTER, _0179
	simple_npc_msg msg_0545_T20R0201_00006
	end

_015C:
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F2
	goto _0205
	end

_0179:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_POKEGEAR, _01D4
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00007
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00008
	setflag FLAG_GOT_POKEGEAR
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0545_T20R0201_00009
	npc_msg msg_0545_T20R0201_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01C6
	npc_msg msg_0545_T20R0201_00011
	goto _01C9

_01C6:
	npc_msg msg_0545_T20R0201_00012
_01C9:
	npc_msg msg_0545_T20R0201_00013
	wait_button_or_dpad
	closemsg
	releaseall
	end

_01D4:
	npc_msg msg_0545_T20R0201_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01DF:
	simple_npc_msg msg_0545_T20R0201_00007
	end

_01F2:
	simple_npc_msg msg_0545_T20R0201_00034
	end

_0205:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL, _0275
	check_badge BADGE_ZEPHYR, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0234
	npc_msg msg_0545_T20R0201_00015
	goto _023A

_0234:
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00016
_023A:
	setflag FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	setvar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0266
	npc_msg msg_0545_T20R0201_00017
	setflag FLAG_SYS_MOMS_SAVINGS
	goto _026D

_0266:
	npc_msg msg_0545_T20R0201_00018
	clearflag FLAG_SYS_MOMS_SAVINGS
_026D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0275:
	npc_msg msg_0545_T20R0201_00020
	scrcmd_795 1, 1
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 29, 255, 0
	menu_item_add 30, 255, 1
	menu_item_add 31, 255, 2
	menu_item_add 32, 255, 3
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _02DF
	case 1, _0335
	case 2, _0398
	goto _03D1
	end

_02DF:
	bank_or_wallet_is_full 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _043A
	check_bank_balance VAR_SPECIAL_RESULT, 1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _041C
	bank_transaction 1, VAR_SPECIAL_RESULT
	scrcmd_796
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _03E0
	case 1, _0411
	releaseall
	end

_0335:
	bank_or_wallet_is_full 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _042B
	hasenoughmoneyvar VAR_SPECIAL_RESULT, 1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0389
	bank_transaction 0, VAR_SPECIAL_RESULT
	scrcmd_796
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _03FA
	case 1, _0411
	releaseall
	end

_0389:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0398:
	npc_msg msg_0545_T20R0201_00025
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	scrcmd_796
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03C2
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00017
	setflag FLAG_SYS_MOMS_SAVINGS
	goto _03C9

_03C2:
	npc_msg msg_0545_T20R0201_00018
	clearflag FLAG_SYS_MOMS_SAVINGS
_03C9:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03D1:
	scrcmd_796
	touchscreen_menu_show
	npc_msg msg_0545_T20R0201_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03E0:
	closemsg
	wait 8, VAR_SPECIAL_RESULT
	play_se SEQ_SE_GS_OKOZUKAI
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03FA:
	closemsg
	wait 8, VAR_SPECIAL_RESULT
	play_se SEQ_SE_GS_OKOZUKAI
	npc_msg msg_0545_T20R0201_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0411:
	npc_msg msg_0545_T20R0201_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_041C:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_042B:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_043A:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00035
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00036
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end

; APOCRYPHA Scene B - after the player returns downstairs, Mom comes over and
; gives the field-menu rundown + the Pokegear, then the player is free.
; Scene B - fires on RETURN to 1F after the upstairs trip (var==2, set by the 2F
; PC). Mom walks over and hands the Pokegear + menu basics. Flag-guarded so it
; runs exactly once, and sets var to 4 (no header entry) so it never re-fires.
scr_seq_T20R0201_007:
	scrcmd_609
	lockall
	goto_if_set FLAG_GOT_POKEGEAR, _007_done
	; Mom holds her post at (3,9) (movement 0 in the event data) until this moment.
	; The player walks down off the stairs while she WALKS up from the door to meet
	; them -- a real approach, no teleport pop -- then a face-to-face hand-off.
	apply_movement obj_player, _apoc_come_downstairs
	apply_movement obj_T20R0201_gsmama, _apoc_cd_mom_up
	wait_movement
	apply_movement obj_player, _apoc_player_face_s
	wait_movement
	call _apoc_give_pokegear
	; She drifts back toward the door, then finally starts pottering around the
	; room now that the move-in send-off is done.
	apply_movement obj_T20R0201_gsmama, _apoc_mom_return
	wait_movement
	call _apoc_mom_start_wandering
_007_done:
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 4
	releaseall
	end

; Swap the pinned door-post Mom (gsmama, spawn-gated on FLAG_GOT_POKEGEAR) for the
; free-roaming Mom (gsmama2, movement 3, gated on the vacated murkrow flag). Both
; live on tile (3,9), and every caller leaves gsmama there, so the swap is
; invisible. hide_person also persist-sets the hidden object's eventFlag, which is
; why gsmama never returns on later loads and gsmama2 always does.
_apoc_mom_start_wandering:
	hide_person obj_T20R0201_gsmama
	wait 8, VAR_SPECIAL_RESULT
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	show_person obj_T20R0201_gsmama2
	return

; Shared Pokegear/menu hand-off (called by Scene B and by the Mom-talk safety
; net below). Messages 45-47 deliberately use no {player name} (pre-naming).
_apoc_give_pokegear:
	callstd std_play_mom_music
	npc_msg msg_0545_T20R0201_00045
	setflag FLAG_GOT_BAG
	setflag FLAG_GOT_OPTIONS_BUTTON
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg msg_0545_T20R0201_00046
	setflag FLAG_GOT_POKEGEAR
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0545_T20R0201_00047
	closemsg
	callstd std_fade_end_mom_music
	return

	.balign 4, 0
; --- Door gate: the (3,10) door coord (gated VAR_SCENE_PLAYERS_HOUSE_1F==1, the
; only state where you have no Pokegear yet) stops you the instant you step onto the
; door, before the south step-out that warps you. You can't leave bare-handed until
; you set up the PC upstairs or talk to Mom -- both set FLAG_GOT_POKEGEAR and move
; the var off 1, which disarms this coord and opens the door. ---
scr_seq_T20R0201_008:
	scrcmd_609
	lockall
	npc_msg msg_0545_T20R0201_00048
	closemsg
	apply_movement obj_player, _apoc_door_back
	wait_movement
	releaseall
	end

	.balign 4, 0
; one tile east, back off the door tile so you can't immediately step out again
_apoc_door_back:
	step 15, 1
	step_end

	.balign 4, 0
_apoc_mom_approach:
	step 12, 5
	step 2, 1
	step_end
	.balign 4, 0

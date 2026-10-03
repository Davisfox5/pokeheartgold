#include "constants/scrcmd.h"
#include "msgdata/msg/msg_0830_APOCSIN.h"
	.include "asm/macros/script.inc"

	.rodata

; ===== APOCRYPHA: shared script bank for the ported Sinnoh region.
; 0 = Canalave->Cherrygrove return ferry; 1..N generic dialogue;
; then the HM porter, then one town/route sign per map. =====
	scrdef scr_seq_APOCSIN_000
	scrdef scr_seq_APOCSIN_001
	scrdef scr_seq_APOCSIN_002
	scrdef scr_seq_APOCSIN_003
	scrdef scr_seq_APOCSIN_004
	scrdef scr_seq_APOCSIN_005
	scrdef scr_seq_APOCSIN_006
	scrdef scr_seq_APOCSIN_007
	scrdef scr_seq_APOCSIN_008
	scrdef scr_seq_APOCSIN_009
	scrdef scr_seq_APOCSIN_010
	scrdef scr_seq_APOCSIN_011
	scrdef scr_seq_APOCSIN_012
	scrdef scr_seq_APOCSIN_013
	scrdef scr_seq_APOCSIN_014
	scrdef scr_seq_APOCSIN_015
	scrdef scr_seq_APOCSIN_016
	scrdef scr_seq_APOCSIN_017
	scrdef scr_seq_APOCSIN_018
	scrdef scr_seq_APOCSIN_019
	scrdef scr_seq_APOCSIN_020
	scrdef scr_seq_APOCSIN_021
	scrdef scr_seq_APOCSIN_022
	scrdef scr_seq_APOCSIN_023
	scrdef scr_seq_APOCSIN_024
	scrdef scr_seq_APOCSIN_025
	scrdef scr_seq_APOCSIN_026
	scrdef scr_seq_APOCSIN_027
	scrdef scr_seq_APOCSIN_028
	scrdef scr_seq_APOCSIN_029
	scrdef scr_seq_APOCSIN_030
	scrdef scr_seq_APOCSIN_031
	scrdef scr_seq_APOCSIN_032
	scrdef scr_seq_APOCSIN_033
	scrdef scr_seq_APOCSIN_034
	scrdef scr_seq_APOCSIN_035
	scrdef scr_seq_APOCSIN_036
	scrdef scr_seq_APOCSIN_037
	scrdef scr_seq_APOCSIN_038
	scrdef scr_seq_APOCSIN_039
	scrdef scr_seq_APOCSIN_040
	scrdef scr_seq_APOCSIN_041
	scrdef scr_seq_APOCSIN_042
	scrdef scr_seq_APOCSIN_043
	scrdef scr_seq_APOCSIN_044
	scrdef scr_seq_APOCSIN_045
	scrdef scr_seq_APOCSIN_046
	scrdef scr_seq_APOCSIN_047
	scrdef scr_seq_APOCSIN_048
	scrdef scr_seq_APOCSIN_049
	scrdef scr_seq_APOCSIN_050
	scrdef scr_seq_APOCSIN_051
	scrdef scr_seq_APOCSIN_052
	scrdef scr_seq_APOCSIN_053
	scrdef scr_seq_APOCSIN_054
	scrdef scr_seq_APOCSIN_055
	scrdef scr_seq_APOCSIN_056
	scrdef scr_seq_APOCSIN_057
	scrdef scr_seq_APOCSIN_058
	scrdef scr_seq_APOCSIN_059
	scrdef scr_seq_APOCSIN_060
	scrdef scr_seq_APOCSIN_061
	scrdef scr_seq_APOCSIN_062
	scrdef scr_seq_APOCSIN_063
	scrdef scr_seq_APOCSIN_064
	scrdef scr_seq_APOCSIN_065
	scrdef scr_seq_APOCSIN_066
	scrdef scr_seq_APOCSIN_067
	scrdef scr_seq_APOCSIN_068
	scrdef scr_seq_APOCSIN_069
	scrdef scr_seq_APOCSIN_070
	scrdef scr_seq_APOCSIN_071
	scrdef scr_seq_APOCSIN_072
	scrdef scr_seq_APOCSIN_073
	scrdef scr_seq_APOCSIN_074
	scrdef scr_seq_APOCSIN_075
	scrdef scr_seq_APOCSIN_076
	scrdef scr_seq_APOCSIN_077
	scrdef scr_seq_APOCSIN_078
	scrdef scr_seq_APOCSIN_079
	scrdef scr_seq_APOCSIN_080
	scrdef scr_seq_APOCSIN_081
	scrdef scr_seq_APOCSIN_082
	scrdef scr_seq_APOCSIN_083
	scrdef_end

scr_seq_APOCSIN_000:
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

scr_seq_APOCSIN_001:
	simple_npc_msg msg_0830_APOCSIN_00000
	end

scr_seq_APOCSIN_002:
	simple_npc_msg msg_0830_APOCSIN_00001
	end

scr_seq_APOCSIN_003:
	simple_npc_msg msg_0830_APOCSIN_00002
	end

scr_seq_APOCSIN_004:
	simple_npc_msg msg_0830_APOCSIN_00003
	end

scr_seq_APOCSIN_005:
	simple_npc_msg msg_0830_APOCSIN_00004
	end

scr_seq_APOCSIN_006:
	simple_npc_msg msg_0830_APOCSIN_00005
	end

scr_seq_APOCSIN_007:
	simple_npc_msg msg_0830_APOCSIN_00006
	end

scr_seq_APOCSIN_008:
	simple_npc_msg msg_0830_APOCSIN_00007
	end

scr_seq_APOCSIN_009:
	simple_npc_msg msg_0830_APOCSIN_00008
	end

scr_seq_APOCSIN_010:
	simple_npc_msg msg_0830_APOCSIN_00009
	end

scr_seq_APOCSIN_011:
	simple_npc_msg msg_0830_APOCSIN_00010
	end

scr_seq_APOCSIN_012:
	simple_npc_msg msg_0830_APOCSIN_00011
	end

scr_seq_APOCSIN_013:
	simple_npc_msg msg_0830_APOCSIN_00012
	end

scr_seq_APOCSIN_014:
	simple_npc_msg msg_0830_APOCSIN_00013
	end

scr_seq_APOCSIN_015:
	simple_npc_msg msg_0830_APOCSIN_00014
	end

scr_seq_APOCSIN_016:
	simple_npc_msg msg_0830_APOCSIN_00015
	end

scr_seq_APOCSIN_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_HM01, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _PORTER_DONE
	npc_msg msg_0830_APOCSIN_00016
	giveitem_no_check ITEM_HM01, 1
	giveitem_no_check ITEM_HM02, 1
	giveitem_no_check ITEM_HM03, 1
	giveitem_no_check ITEM_HM04, 1
	giveitem_no_check ITEM_HM05, 1
	giveitem_no_check ITEM_HM06, 1
	giveitem_no_check ITEM_HM07, 1
	giveitem_no_check ITEM_HM08, 1
	wait_button_or_walk_away
	closemsg
	releaseall
	end
_PORTER_DONE:
	npc_msg msg_0830_APOCSIN_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_025:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_026:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_027:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_028:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_029:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00029
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_030:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00030
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_031:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00031
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_032:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_033:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00033
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_034:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00034
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_035:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00035
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_036:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00036
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_037:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_038:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_039:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00039
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_040:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00040
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_041:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00041
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_042:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00042
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_043:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00043
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_044:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00044
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_045:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00045
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_046:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00046
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_047:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00047
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_048:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00048
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_049:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00049
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_050:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00050
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_051:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00051
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_052:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00052
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_053:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00053
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_054:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00054
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_055:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00055
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_056:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00056
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_057:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00057
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_058:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00058
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_059:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00059
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_060:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00060
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_061:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00061
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_062:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00062
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_063:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00063
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_064:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00064
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_065:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00065
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_066:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00066
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_067:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00067
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_068:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00068
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_069:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00069
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_070:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00070
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_071:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00071
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_072:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00072
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_073:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00073
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_074:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00074
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_075:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00075
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_076:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00076
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_077:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00077
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_078:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00078
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_079:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00079
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_080:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00080
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_081:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00081
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_082:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00082
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_APOCSIN_083:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0830_APOCSIN_00083
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0

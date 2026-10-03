    .include "macros/btlcmd.inc"

    .data

_000:
    // Apocrypha Ch1 catch demo (TUTORIAL|SAFARI): Gold's bare-handed throw is a
    // plain Poke Ball, not a Safari Ball (and no safari game-over bookkeeping).
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_TUTORIAL, _APOC_TUTORIAL_POKE_BALL
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_PAL_PARK, _SET_PARK_BALL
    CheckSafariGameDone _NO_PC_SPACE
    // {0} used one {1}!
    PrintMessage msg_0197_00857, TAG_TRNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_SAFARI_BALL
    GoTo _THROW_BALL

_APOC_TUTORIAL_POKE_BALL:
    // {0} used one {1}!
    PrintMessage msg_0197_00857, TAG_TRNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait
    // safari THROW variant (trainer winds up bare-handed - there is no sent-out
    // mon to animate from); the ball itself still renders as a plain Poke Ball
    // because the catch task takes ItemToBallId(itemTemp) = ITEM_POKE_BALL.
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_SAFARI_BALL
    GoTo _THROW_BALL

_SET_PARK_BALL:
    // {0}, come back!
    PrintGlobalMessage msg_0197_01225, TAG_NICKNAME, BATTLER_CATEGORY_ENEMY
    Wait 
    ThrowPokeball BATTLER_CATEGORY_PLAYER, GAME_THROW_PARK_BALL

_THROW_BALL:
    StartCatchMonTask CAPTURE_SAFARI
    WaitCatchMonTask 
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_CAPTURED_MON, _END
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_SAFARI_BALL_CNT, 0, _END
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_PINPON
    // Announcer: You’re out of Safari Balls! Game over!
    PrintMessage msg_0197_00850, TAG_NONE
    GoTo _END_BATTLE

_NO_PC_SPACE:
    // There is no room left in the PC!
    PrintMessage msg_0197_00874, TAG_NONE

_END_BATTLE:
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED

_END:
    End 

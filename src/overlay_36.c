#include "overlay_36.h"

#include "global.h"

#include "constants/easy_chat.h"
#include "constants/mail.h"
#include "constants/species.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"
#include "msgdata/msg/msg_0445.h"

#include "apricorn_tree.h"
#include "field_system.h"
#include "friend_group.h"
#include "heap.h"
#include "location_backup.h"
#include "mail.h"
#include "main.h"
#include "math_util.h"
#include "msgdata.h"
#include "options.h"
#include "overlay_manager.h"
#include "party.h"
#include "pokemon.h"
#include "pokewalker.h"
#include "safari_zone.h"
#include "sav_system_info.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02018380.h"
#include "unk_0202C730.h"
#include "unk_0205B3DC.h"
#include "unk_02066EDC.h"

#define HEAPID_OV36 (HEAP_ID_OV36)

extern const OverlayManagerTemplate gApplication_OakSpeech;

static BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OverlayManager *man, int *state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OverlayManager *man, int *state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppInit(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppExec(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppExit(OverlayManager *man, int *state);
static void InitGameStateAfterOakSpeech_Internal(HeapID heapId, SaveData *saveData, BOOL set_trainer_id);
static void Continue_LoadSaveData_HandleError(HeapID heapId, SaveData *saveData);
static void NewGame_InitSaveData(HeapID heapId, SaveData *saveData);

const OverlayManagerTemplate ov36_App_MainMenu_SelectOption_NewGame = {
    .init = ov36_TitleScreen_NewGame_AppInit,
    .exec = ov36_TitleScreen_NewGame_AppExec,
    .exit = ov36_TitleScreen_NewGame_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OverlayManagerTemplate ov36_App_InitGameState_AfterOakSpeech = {
    .init = ov36_App_InitGameState_AfterOakSpeech_AppInit,
    .exec = ov36_App_InitGameState_AfterOakSpeech_AppExec,
    .exit = ov36_App_InitGameState_AfterOakSpeech_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OverlayManagerTemplate ov36_App_MainMenu_SelectOption_Continue = {
    .init = ov36_App_MainMenu_SelectOption_Continue_AppInit,
    .exec = ov36_App_MainMenu_SelectOption_Continue_AppExec,
    .exit = ov36_App_MainMenu_SelectOption_Continue_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

BOOL ov36_TitleScreen_NewGame_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    CreateHeap(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_TitleScreen_NewGame_AppExec(OverlayManager *man, int *state) {
#pragma unused(state)
    SaveData *saveData = ((struct UnkStruct_02111868_sub *)OverlayManager_GetArgs(man))->saveData;
    NewGame_InitSaveData(HEAPID_OV36, saveData);

    return TRUE;
}

BOOL ov36_TitleScreen_NewGame_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_OakSpeech);

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    CreateHeap(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OverlayManager *man, int *state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub *unk_work = OverlayManager_GetArgs(man);
    SaveData *saveData = unk_work->saveData;
    InitGameStateAfterOakSpeech_Internal(HEAPID_OV36, saveData, TRUE);
    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_NewGameFieldsys);

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    CreateHeap(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OverlayManager *man, int *state) {
    struct UnkStruct_02111868_sub *unk_work = OverlayManager_GetArgs(man);
    SaveData *saveData = unk_work->saveData;
    SysInfo *sys_info = Save_SysInfo_Get(saveData);

    Continue_LoadSaveData_HandleError(HEAPID_OV36, saveData);

    Options_SetButtonModeOnMain(saveData, 0);

    if (!Save_SysInfo_MacAddressIsMine(sys_info) || !Save_SysInfo_RTCOffsetIsMine(sys_info)) {
        SysInfoRTC_HandleContinueOnNewConsole(Save_SysInfo_RTC_Get(saveData));
        Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
        Save_SysInfo_InitFromSystem(sys_info);
        Party_ResetAllShayminToLandForm(SaveArray_Party_Get(saveData));
    }

    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    DestroyHeap(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_ContinueFieldsys);

    return TRUE;
}

static void InitGameStateAfterOakSpeech_Internal(HeapID heapId, SaveData *saveData, BOOL set_trainer_id) {
#pragma unused(heapId)
    s32 i;

    Save_SysInfo_InitFromSystem(Save_SysInfo_Get(saveData));
    Save_SysInfo_RTC_Init(Save_SysInfo_RTC_Get(saveData));
    Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
    sub_0202C7C0(Save_FriendGroup_Get(saveData), 1, MTRandom());
    sub_020674BC(saveData);

    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    u32 rand = MTRandom();

    if (set_trainer_id) {
        PlayerProfile_SetTrainerID(profile, rand);
    }

    SafariZone *safari_zone = Save_SafariZone_Get(saveData);
    SafariZone_ResetAreaSetToDefaultSet(safari_zone->area_sets, rand);

    PlayerProfile_SetAvatar(profile, UnionRoomAvatarIdxToSprite(rand, PlayerProfile_GetTrainerGender(profile), 0));

    sub_0202AE0C(Save_FieldApricornTrees_Get(saveData));

    u32 *pokewalker_unk = sub_02032728(Save_Pokewalker_Get(saveData));
    for (i = 0; i < 10; i++) {
        pokewalker_unk[i] = MTRandom();
    }

    // APOCRYPHA: the vanilla "email from your friend" (Lyra/Ethan) PC mail
    // is not seeded; that character does not exist in this story.
}

static void Continue_LoadSaveData_HandleError(HeapID heapId, SaveData *saveData) {
#pragma unused(heapId)
    if (!SaveData_TryLoadOnContinue(saveData)) {
        OS_ResetSystem(0);
    }
}

static void NewGame_InitSaveData(HeapID heapId, SaveData *saveData) {
#pragma unused(heapId)
    Save_InitDynamicRegion(saveData);
    Save_SetPositionToPlayerRoom(saveData);

    PlayerProfile_SetMoney(Save_PlayerData_GetProfile(saveData), 3000);

    Save_VarsFlags_SetFishingCompetitionLengthRecord(Save_VarsFlags_Get(saveData), 56150); // 3'6"

    SetFlag960(Save_VarsFlags_Get(saveData));
}

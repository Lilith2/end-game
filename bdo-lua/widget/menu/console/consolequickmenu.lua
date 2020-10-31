local Type = {
  Inventory = 0,
  BlackSpirit = 1,
  WorldMap = 2,
  Skill = 3,
  Mail = 4,
  CharacterChallange = 5,
  ItemMarket = 6,
  Quest = 7,
  ServantCall = 8,
  ServantNavi = 9,
  CampActivate = 10,
  CampNavi = 11,
  HorseRaceInformation = 12,
  HorseRaceEnterOrCancel = 13,
  ResidenceList = 14,
  WorkerList = 15,
  GardenList = 16,
  PetList = 17,
  MaidList = 18,
  TagSetting = 19,
  Tag = 20,
  NpcFind = 21,
  MovieGuide = 22,
  Mercenary = 23,
  VillageSiegeArea = 24,
  Pvp = 25,
  RingMenuSetting = 26,
  Profile = 27,
  VoiceChat = 28,
  Knowledge = 29,
  WharfNavi = 30,
  Guild = 31,
  Friend = 32,
  PearlShop = 33,
  PartySetting = 34,
  BeautyAlbum = 35,
  PhotoGallery = 36,
  ProductNote = 37,
  GuildRank = 38,
  BlackSpiritAdventure = 39,
  Manufacture = 40,
  TogglePVP = 41,
  PearInven = 42,
  Dyeing = 43,
  ToggleChatting = 44,
  GuildWarInfo = 45,
  TogglePhotoMode = 46,
  ConsoleUIOffset = 47,
  LifeRanking = 48,
  HorseInfo = 49,
  Fairy = 50,
  PersonalMonster = 51,
  GuildPing = 52,
  PartyPing = 53,
  BloodAltar = 54,
  BloodAltarRanking = 55,
  PlatoonSetting = 56,
  UseAlchemyStone = 57,
  RestoreItem = 58,
  GuildStableList = 59,
  MasterpieceAuction = 60,
  BattleGroundPvP = 61,
  Undefined = 62
}
PaGlobal_ConsoleQuickMenu._functionTypeCount = Type.Undefined - 1
local function getTypeName(index)
  for typeName, typeIndex in pairs(Type) do
    if index == typeIndex then
      return typeName
    end
  end
  return nil
end
local ExecuteFunction = {}
function ExecuteFunction.Inventory()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_Inventory)
end
function ExecuteFunction.BlackSpirit()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_BlackSpirit)
end
function ExecuteFunction.WorldMap()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_WorldMap)
end
function ExecuteFunction.Skill()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_Skill)
end
function ExecuteFunction.Mail()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_Mail)
end
function ExecuteFunction.CharacterChallange()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_Present)
end
function ExecuteFunction.ItemMarket()
  FGlobal_ItemMarket_Open_ForWorldMap(1, true)
end
function ExecuteFunction.Quest()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_QuestHistory)
end
function ExecuteFunction.ServantCall()
  Servant_Call(0)
end
function ExecuteFunction.ServantNavi()
  Servant_Navi(0)
end
function ExecuteFunction.CampActivate()
  PaGlobalFunc_Camp_All_Open()
end
function ExecuteFunction.HorseRaceInformation()
  HandelClicked_RaceInfo_Toggle()
end
function ExecuteFunction.HorseRaceEnterOrCancel()
  HandelClicked_RaceInfo_Join()
end
function ExecuteFunction.ResidenceList()
  PaGlobal_ResidenceList:open()
end
function ExecuteFunction.WorkerList()
  if true == _ContentsGroup_NewUI_WorkerManager_All then
    PaGlobalFunc_WorkerManager_All_Open()
  else
    PaGlobalFunc_WorkerManager_Open()
  end
end
function ExecuteFunction.GardenList()
  PaGlobal_GardenList:open()
end
function ExecuteFunction.PetList()
  if true == _ContentsGroup_NewUI_Pet_All then
    PaGlobal_PetList_Toggle_All()
  else
    FGlobal_PetListNew_Toggle()
  end
end
function ExecuteFunction.MaidList()
  if false == _ContentsGroup_NewUI_Maid_All then
    PaGlobalFunc_MaidList_Open()
  else
    PaGlobalFunc_MaidList_All_Open()
  end
end
function ExecuteFunction.TagSetting()
end
function ExecuteFunction.Tag()
end
function ExecuteFunction.NpcFind()
  PaGlobal_NpcNavi_All_ShowToggle()
end
function ExecuteFunction.MovieGuide()
end
function ExecuteFunction.Mercenary()
  FGlobal_MercenaryOpen()
end
local toggleSiegeArea = false
function ExecuteFunction.VillageSiegeArea()
  toggleSiegeArea = not toggleSiegeArea
  ToClient_toggleVillageSiegeArea(toggleSiegeArea)
end
function ExecuteFunction.GuildWarInfo()
  if true == _ContentsGroup_SeigeSeason5 then
    if true == _ContentsGroup_NewUI_GuildWarInfo_All then
      PaGlobalFunc_GuildWarInfo_All_Open()
    else
      PaGlobalFunc_GuildWarInfo_Open()
    end
  else
    FGlobal_GuildWarInfo_Show()
  end
end
function ExecuteFunction.Pvp()
end
function ExecuteFunction.RingMenuSetting()
  FromClient_ConsoleQuickMenu_OpenCustomPage(2)
end
function ExecuteFunction.Profile()
  GlobalKeyBinder_MouseKeyMap(__eUiInputType_PlayerInfo)
end
function ExecuteFunction.VoiceChat()
  if true == _ContentsGroup_NewUI_SetVoiceChat_All then
    PaGlobalFunc_SetVoiceChat_All_Toggle()
  else
    FGlobal_SetVoiceChat_Toggle()
  end
end
function ExecuteFunction.Knowledge()
  PaGlobalFunc_Window_Knowledge_Show()
end
function ExecuteFunction.WharfNavi()
  if _ContentsGroup_OceanCurrent then
    PaGlobal_ShipControl_Console_Open()
  else
    Servant_Navi(1)
  end
end
function ExecuteFunction.Guild()
  Process_UIMode_CommonWindow_Guild()
end
function ExecuteFunction.Friend()
  Process_UIMode_CommonWindow_FriendList()
end
function ExecuteFunction.PearlShop()
  Process_UIMode_CommonWindow_CashShop()
end
function ExecuteFunction.PartySetting()
  Process_UIMode_CommonWindow_PartySetting()
end
function ExecuteFunction.PlatoonSetting()
  Process_UIMode_CommonWindow_PlatoonSetting()
end
function ExecuteFunction.BeautyAlbum()
  if true == _ContentsGroup_RenewUI_BeautyAlbum then
    FGlobal_CustomizingAlbum_Show(false, CppEnums.ClientSceneState.eClientSceneStateType_InGame)
  end
end
function ExecuteFunction.PhotoGallery()
  ScreenshotAlbum_Open()
end
function ExecuteFunction.ProductNote()
  Panel_ProductNote_ShowToggle()
end
function ExecuteFunction.GuildRank()
  GuildRank_Web_Show()
end
function ExecuteFunction.BlackSpiritAdventure()
  FGlobal_BlackSpiritAdventure_Open()
end
function ExecuteFunction.Manufacture()
  if false == _ContentsGroup_NewUI_Manufacture_All then
    PaGlobalFunc_ManufactureOpen(true)
  else
    PaGlobalFunc_Manufacture_All_Open(nil, CppEnums.ItemWhereType.eInventory, true)
  end
end
function ExecuteFunction.TogglePVP()
  if true == isGameServiceTypeConsole() then
    local selfProxy = getSelfPlayer()
    if nil ~= selfProxy and selfProxy:get():getLevel() < 50 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
      return
    end
  end
  requestTogglePvP(true)
end
function ExecuteFunction.PearInven()
  PaGlobalFunc_InventoryInfo_Open(2)
end
function ExecuteFunction.Dyeing()
  PaGlobalFunc_Dyeing_Open()
end
function ExecuteFunction.ToggleChatting()
  PaGlobalFunc_ChattingViewer_SetToggleHideOption()
end
function ExecuteFunction.TogglePhotoMode()
  ToClient_setTogglePhotoMode()
end
function ExecuteFunction.ConsoleUIOffset()
  PaGlobal_ConsoleUIOffset_Open()
end
function ExecuteFunction.LifeRanking()
  PaGlobal_LifeRanking_Open_All()
end
function ExecuteFunction.HorseInfo()
  if true == _ContentsGroup_NewUI_ServantInfo_All then
    PaGlobal_VehicleInfo_All_OpenHorseInfo()
  else
    PaGlobalFunc_HorseInfo_Open()
  end
end
function ExecuteFunction.Fairy()
  PaGlobal_FairyInfo_Open_All(true)
end
function ExecuteFunction.PersonalMonster()
  HandleEventLUp_PersonalMonster_All_Open()
end
function ExecuteFunction.GuildPing()
  SendPingInfo_ToConsole(true)
end
function ExecuteFunction.PartyPing()
  SendPingInfo_ToConsole(false)
end
function ExecuteFunction.BloodAltar()
  PaGlobal_HandleClicked_BloodAltar_Open()
end
function ExecuteFunction.BloodAltarRanking()
  PaGlobal_AltarRankWeb_Open()
end
function ExecuteFunction.UseAlchemyStone()
  PaGlobalFunc_AlchemyStone_All_Use()
end
function ExecuteFunction.RestoreItem()
  PaGlobalFunc_Restore_All_Open()
end
function ExecuteFunction.GuildStableList()
  if nil ~= FGlobal_GuildServantList_Open then
    FGlobal_GuildServantList_Open()
  end
end
function ExecuteFunction.MasterpieceAuction()
  PaGlobal_Masterpiece_Auction_All_ESCOpen()
end
function ExecuteFunction.BattleGroundPvP()
  if nil ~= Panel_Arena_Battle then
    local player = getSelfPlayer()
    if nil ~= player and true == player:get():isBattleGroundDefine() then
      PaGlobal_Arena_Battle_Open()
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_BATTLEGROUNPVP_CANTUSEUI"))
    end
  end
end
function PaGlobal_ConsoleQuickMenu:initialize()
end
PaGlobal_ConsoleQuickMenu._functionTypeList = {}
PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = ExecuteFunction.Inventory,
    [Type.BlackSpirit] = ExecuteFunction.BlackSpirit,
    [Type.WorldMap] = ExecuteFunction.WorldMap,
    [Type.Skill] = ExecuteFunction.Skill,
    [Type.Mail] = ExecuteFunction.Mail,
    [Type.CharacterChallange] = ExecuteFunction.CharacterChallange,
    [Type.ItemMarket] = ExecuteFunction.ItemMarket,
    [Type.Quest] = ExecuteFunction.Quest,
    [Type.ServantCall] = ExecuteFunction.ServantCall,
    [Type.ServantNavi] = ExecuteFunction.ServantNavi,
    [Type.CampActivate] = ExecuteFunction.CampActivate,
    [Type.CampNavi] = ExecuteFunction.CampNavi,
    [Type.HorseRaceInformation] = ExecuteFunction.HorseRaceInformation,
    [Type.HorseRaceEnterOrCancel] = ExecuteFunction.HorseRaceEnterOrCancel,
    [Type.ResidenceList] = ExecuteFunction.ResidenceList,
    [Type.WorkerList] = ExecuteFunction.WorkerList,
    [Type.GardenList] = ExecuteFunction.GardenList,
    [Type.PetList] = ExecuteFunction.PetList,
    [Type.MaidList] = ExecuteFunction.MaidList,
    [Type.TagSetting] = ExecuteFunction.TagSetting,
    [Type.Tag] = ExecuteFunction.Tag,
    [Type.NpcFind] = ExecuteFunction.NpcFind,
    [Type.MovieGuide] = ExecuteFunction.MovieGuide,
    [Type.Mercenary] = ExecuteFunction.Mercenary,
    [Type.VillageSiegeArea] = ExecuteFunction.VillageSiegeArea,
    [Type.Pvp] = ExecuteFunction.Pvp,
    [Type.RingMenuSetting] = ExecuteFunction.RingMenuSetting,
    [Type.Profile] = ExecuteFunction.Profile,
    [Type.VoiceChat] = ExecuteFunction.VoiceChat,
    [Type.Knowledge] = ExecuteFunction.Knowledge,
    [Type.WharfNavi] = ExecuteFunction.WharfNavi,
    [Type.Guild] = ExecuteFunction.Guild,
    [Type.Friend] = ExecuteFunction.Friend,
    [Type.PearlShop] = ExecuteFunction.PearlShop,
    [Type.PartySetting] = ExecuteFunction.PartySetting,
    [Type.BeautyAlbum] = ExecuteFunction.BeautyAlbum,
    [Type.PhotoGallery] = ExecuteFunction.PhotoGallery,
    [Type.ProductNote] = ExecuteFunction.ProductNote,
    [Type.GuildRank] = ExecuteFunction.GuildRank,
    [Type.BlackSpiritAdventure] = ExecuteFunction.BlackSpiritAdventure,
    [Type.Manufacture] = ExecuteFunction.Manufacture,
    [Type.TogglePVP] = ExecuteFunction.TogglePVP,
    [Type.PearInven] = ExecuteFunction.PearInven,
    [Type.Dyeing] = ExecuteFunction.Dyeing,
    [Type.ToggleChatting] = ExecuteFunction.ToggleChatting,
    [Type.GuildWarInfo] = ExecuteFunction.GuildWarInfo,
    [Type.TogglePhotoMode] = ExecuteFunction.TogglePhotoMode,
    [Type.ConsoleUIOffset] = ExecuteFunction.ConsoleUIOffset,
    [Type.LifeRanking] = ExecuteFunction.LifeRanking,
    [Type.HorseInfo] = ExecuteFunction.HorseInfo,
    [Type.Fairy] = ExecuteFunction.Fairy,
    [Type.PersonalMonster] = ExecuteFunction.PersonalMonster,
    [Type.GuildPing] = ExecuteFunction.GuildPing,
    [Type.PartyPing] = ExecuteFunction.PartyPing,
    [Type.BloodAltar] = ExecuteFunction.BloodAltar,
    [Type.BloodAltarRanking] = ExecuteFunction.BloodAltarRanking,
    [Type.PlatoonSetting] = ExecuteFunction.PlatoonSetting,
    [Type.UseAlchemyStone] = ExecuteFunction.UseAlchemyStone,
    [Type.RestoreItem] = ExecuteFunction.RestoreItem,
    [Type.GuildStableList] = ExecuteFunction.GuildStableList,
    [Type.MasterpieceAuction] = ExecuteFunction.MasterpieceAuction,
    [Type.BattleGroundPvP] = ExecuteFunction.BattleGroundPvP
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._icon = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 501,
      _x2 = 984,
      _y2 = 551
    },
    [Type.BlackSpirit] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 399,
      _x2 = 984,
      _y2 = 449
    },
    [Type.WorldMap] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 552,
      _x2 = 1035,
      _y2 = 602
    },
    [Type.Skill] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 450,
      _x2 = 984,
      _y2 = 500
    },
    [Type.Mail] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 501,
      _x2 = 1035,
      _y2 = 551
    },
    [Type.CharacterChallange] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 399,
      _x2 = 1035,
      _y2 = 449
    },
    [Type.ItemMarket] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 552,
      _x2 = 984,
      _y2 = 602
    },
    [Type.Quest] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 450,
      _x2 = 1035,
      _y2 = 500
    },
    [Type.ServantCall] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.ServantNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 450,
      _x2 = 1086,
      _y2 = 500
    },
    [Type.CampActivate] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.CampNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.HorseRaceInformation] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.HorseRaceEnterOrCancel] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 450,
      _x2 = 1137,
      _y2 = 500
    },
    [Type.ResidenceList] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 205,
      _y1 = 394,
      _x2 = 255,
      _y2 = 444
    },
    [Type.WorkerList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 399,
      _x2 = 1188,
      _y2 = 449
    },
    [Type.GardenList] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 205,
      _y1 = 241,
      _x2 = 255,
      _y2 = 291
    },
    [Type.PetList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 501,
      _x2 = 1188,
      _y2 = 551
    },
    [Type.MaidList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 501,
      _x2 = 1137,
      _y2 = 551
    },
    [Type.TagSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 552,
      _x2 = 1137,
      _y2 = 602
    },
    [Type.Tag] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 552,
      _x2 = 1188,
      _y2 = 602
    },
    [Type.NpcFind] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 603,
      _x2 = 984,
      _y2 = 653
    },
    [Type.MovieGuide] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 603,
      _x2 = 1137,
      _y2 = 653
    },
    [Type.Mercenary] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 654,
      _x2 = 984,
      _y2 = 704
    },
    [Type.VillageSiegeArea] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 241,
      _x2 = 306,
      _y2 = 291
    },
    [Type.Pvp] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 654,
      _x2 = 1137,
      _y2 = 704
    },
    [Type.RingMenuSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 205,
      _y1 = 445,
      _x2 = 255,
      _y2 = 495
    },
    [Type.Profile] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 292,
      _x2 = 357,
      _y2 = 342
    },
    [Type.VoiceChat] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 190,
      _x2 = 306,
      _y2 = 240
    },
    [Type.Knowledge] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 343,
      _x2 = 306,
      _y2 = 393
    },
    [Type.WharfNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 103,
      _y1 = 292,
      _x2 = 153,
      _y2 = 342
    },
    [Type.Guild] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 190,
      _x2 = 357,
      _y2 = 240
    },
    [Type.Friend] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 292,
      _x2 = 306,
      _y2 = 342
    },
    [Type.PearlShop] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 241,
      _x2 = 357,
      _y2 = 291
    },
    [Type.PartySetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 343,
      _x2 = 357,
      _y2 = 393
    },
    [Type.BeautyAlbum] = {
      _path = "Renewal/UI_Icon/Console_ESCMenuIcon.dds",
      _x1 = 173,
      _y1 = 173,
      _x2 = 228,
      _y2 = 228
    },
    [Type.PhotoGallery] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 2,
      _y1 = 250,
      _x2 = 62,
      _y2 = 310
    },
    [Type.ProductNote] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 188,
      _y1 = 64,
      _x2 = 248,
      _y2 = 124
    },
    [Type.GuildRank] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 436,
      _y1 = 250,
      _x2 = 496,
      _y2 = 310
    },
    [Type.BlackSpiritAdventure] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 126,
      _y1 = 436,
      _x2 = 186,
      _y2 = 496
    },
    [Type.Manufacture] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 241,
      _x2 = 408,
      _y2 = 291
    },
    [Type.TogglePVP] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 654,
      _x2 = 1137,
      _y2 = 704
    },
    [Type.PearInven] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 190,
      _x2 = 408,
      _y2 = 240
    },
    [Type.Dyeing] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 343,
      _x2 = 408,
      _y2 = 393
    },
    [Type.ToggleChatting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 1,
      _y1 = 1,
      _x2 = 51,
      _y2 = 51
    },
    [Type.GuildWarInfo] = {
      _path = "Renewal/UI_Icon/XboxConsole_Icon_Title.dds",
      _x1 = 116,
      _y1 = 344,
      _x2 = 171,
      _y2 = 399
    },
    [Type.TogglePhotoMode] = {
      _path = "Renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 53,
      _y1 = 1,
      _x2 = 103,
      _y2 = 51
    },
    [Type.ConsoleUIOffset] = {
      _path = "Renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 105,
      _y1 = 1,
      _x2 = 155,
      _y2 = 51
    },
    [Type.LifeRanking] = {
      _path = "Renewal/UI_Icon/XboxConsole_Icon_Title.dds",
      _x1 = 287,
      _y1 = 116,
      _x2 = 342,
      _y2 = 171
    },
    [Type.HorseInfo] = {
      _path = "Renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 156,
      _y1 = 1,
      _x2 = 206,
      _y2 = 51
    },
    [Type.Fairy] = {
      _path = "combine/icon/combine_title_icon_00.dds",
      _x1 = 287,
      _y1 = 344,
      _x2 = 342,
      _y2 = 399
    },
    [Type.PersonalMonster] = {
      _path = "combine/icon/combine_title_icon_00.dds",
      _x1 = 519,
      _y1 = 59,
      _x2 = 570,
      _y2 = 114
    },
    [Type.GuildPing] = {
      _path = "renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 309,
      _y1 = 1,
      _x2 = 359,
      _y2 = 51
    },
    [Type.PartyPing] = {
      _path = "renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 258,
      _y1 = 1,
      _x2 = 308,
      _y2 = 51
    },
    [Type.BloodAltar] = {
      _path = "Renewal/UI_Icon/Console_ESCMenuIcon.dds",
      _x1 = 285,
      _y1 = 287,
      _x2 = 342,
      _y2 = 342
    },
    [Type.BloodAltarRanking] = {
      _path = "combine/icon/combine_title_icon_00.dds",
      _x1 = 458,
      _y1 = 572,
      _x2 = 513,
      _y2 = 627
    },
    [Type.PlatoonSetting] = {
      _path = "Renewal/UI_Icon/XboxConsole_Icon_Title.dds",
      _x1 = 457,
      _y1 = 344,
      _x2 = 512,
      _y2 = 399
    },
    [Type.UseAlchemyStone] = {
      _path = "Renewal/UI_Icon/XboxConsole_Icon_Title.dds",
      _x1 = 457,
      _y1 = 2,
      _x2 = 512,
      _y2 = 57
    },
    [Type.RestoreItem] = {
      _path = "Renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 1,
      _y1 = 52,
      _x2 = 51,
      _y2 = 102
    },
    [Type.GuildStableList] = {
      _path = "Renewal/Button/Console_Btn_Main.dds",
      _x1 = 105,
      _y1 = 53,
      _x2 = 156,
      _y2 = 104
    },
    [Type.MasterpieceAuction] = {
      _path = "combine/icon/combine_title_icon_00.dds",
      _x1 = 572,
      _y1 = 116,
      _x2 = 629,
      _y2 = 171
    },
    [Type.BattleGroundPvP] = {
      _path = "renewal/Function/Console_Function_RingMenu_02.dds",
      _x1 = 53,
      _y1 = 52,
      _x2 = 103,
      _y2 = 102
    }
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._name = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BAG"),
    [Type.BlackSpirit] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"),
    [Type.WorldMap] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_WORLDMAP"),
    [Type.Skill] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_SKILL"),
    [Type.Mail] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MAIL"),
    [Type.CharacterChallange] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_DAILYCHALLENGE_TITLE"),
    [Type.ItemMarket] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ITEMMARKET"),
    [Type.Quest] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_QUESTHISTORY"),
    [Type.ServantCall] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_CALLMOUNT"),
    [Type.ServantNavi] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_FINDMOUNT"),
    [Type.CampActivate] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CAMP_TITLE"),
    [Type.CampNavi] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_FINDCAMP"),
    [Type.HorseRaceInformation] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_AlertHorseRace"),
    [Type.HorseRaceEnterOrCancel] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANT_REGISTER_BTN"),
    [Type.ResidenceList] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HOUSINGLIST_STCTXT_TITLE"),
    [Type.WorkerList] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_UiWorker"),
    [Type.GardenList] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HARVESTLIST_TITLE"),
    [Type.PetList] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PET"),
    [Type.MaidList] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_MAIDLIST_TITLE"),
    [Type.TagSetting] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TAGCHARACTERSETTING"),
    [Type.Tag] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TAGCHARACTER"),
    [Type.NpcFind] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPCNAVI_NPCNAVITEXT"),
    [Type.MovieGuide] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MOVIEGUIDE_TITLE"),
    [Type.Mercenary] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MILITIA"),
    [Type.VillageSiegeArea] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TOGGLESIEGEAREAGUIDE"),
    [Type.Pvp] = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_13"),
    [Type.RingMenuSetting] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_RINGMENUSETTING"),
    [Type.Profile] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MYINFO"),
    [Type.VoiceChat] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_VOICECHAT"),
    [Type.Knowledge] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MENTALKNOWLEDGE"),
    [Type.WharfNavi] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_FINDSHIP"),
    [Type.Guild] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_GUILD"),
    [Type.Friend] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST"),
    [Type.PearlShop] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_CASHSHOP"),
    [Type.PartySetting] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PARTYSETTING_TITLE"),
    [Type.BeautyAlbum] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BEAUTYALBUM"),
    [Type.PhotoGallery] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SCREENSHOTALBUM_TITLE"),
    [Type.ProductNote] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MEMONAME"),
    [Type.GuildRank] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_GUILDRANKER"),
    [Type.BlackSpiritAdventure] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BLACKSPIRIT_TRESURE"),
    [Type.Manufacture] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_MANUFACTURE"),
    [Type.TogglePVP] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TOGGLEPVP"),
    [Type.PearInven] = PAGetString(Defines.StringSheet_RESOURCE, "UI_INVENTORY_BTN_CASHINVENTORY"),
    [Type.Dyeing] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_DYE"),
    [Type.ToggleChatting] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TOGGLECHATTING"),
    [Type.GuildWarInfo] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_SIEGE"),
    [Type.TogglePhotoMode] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUICKMENU_TOGGLEPHOTOMODE"),
    [Type.ConsoleUIOffset] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_CONSOLEUIOFFSET"),
    [Type.LifeRanking] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_LIFERANKING_TITLE"),
    [Type.HorseInfo] = PAGetString(Defines.StringSheet_RESOURCE, "SERVANT_INFO_TEXT_TITLE"),
    [Type.Fairy] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_INFO_TITLE"),
    [Type.PersonalMonster] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PERSONALMONSTER_TITLE"),
    [Type.GuildPing] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RINGMENU_GUILDPING"),
    [Type.PartyPing] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RINGMENU_PARTYPING"),
    [Type.BloodAltar] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_BLOODALTAR_TITLE"),
    [Type.BloodAltarRanking] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ALTARRANKWEB_TITLE"),
    [Type.PlatoonSetting] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_LARGEPARTYSETTING_TITLE"),
    [Type.UseAlchemyStone] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_INTERFACE_ACTION_U"),
    [Type.RestoreItem] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RESTOREITEM_RECOVERYITEM_TITLE"),
    [Type.GuildStableList] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILDSERVANTLIST_TITLE"),
    [Type.MasterpieceAuction] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MASTERPIECEAUCTION_TITLE"),
    [Type.BattleGroundPvP] = PAGetString(Defines.StringSheet_GAME, "LUA_1ON1ARENA_TOOLTIP_NAME")
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._ContentOption = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = true,
    [Type.BlackSpirit] = true,
    [Type.WorldMap] = true,
    [Type.Skill] = true,
    [Type.Mail] = true,
    [Type.CharacterChallange] = false,
    [Type.ItemMarket] = false,
    [Type.Quest] = true,
    [Type.ServantCall] = true,
    [Type.ServantNavi] = true,
    [Type.CampActivate] = true,
    [Type.CampNavi] = false,
    [Type.HorseRaceInformation] = false,
    [Type.HorseRaceEnterOrCancel] = false,
    [Type.ResidenceList] = true,
    [Type.WorkerList] = true,
    [Type.GardenList] = true,
    [Type.PetList] = true,
    [Type.MaidList] = true,
    [Type.TagSetting] = false,
    [Type.Tag] = false,
    [Type.NpcFind] = _ContentsGroup_NewUI_NpcNavi_All,
    [Type.MovieGuide] = false,
    [Type.Mercenary] = false,
    [Type.VillageSiegeArea] = true,
    [Type.Pvp] = false,
    [Type.RingMenuSetting] = true,
    [Type.Profile] = true,
    [Type.VoiceChat] = _ContentsGroup_isXBOXUI,
    [Type.Knowledge] = true,
    [Type.WharfNavi] = true,
    [Type.Guild] = true,
    [Type.Friend] = true,
    [Type.PearlShop] = true,
    [Type.PartySetting] = true,
    [Type.BeautyAlbum] = true,
    [Type.PhotoGallery] = false,
    [Type.ProductNote] = false,
    [Type.GuildRank] = false,
    [Type.BlackSpiritAdventure] = false,
    [Type.Manufacture] = true,
    [Type.TogglePVP] = true,
    [Type.PearInven] = true,
    [Type.Dyeing] = true,
    [Type.ToggleChatting] = _ContentsGroup_RenewUI,
    [Type.GuildWarInfo] = true,
    [Type.TogglePhotoMode] = _ContentsGroup_RenewUI,
    [Type.ConsoleUIOffset] = _ContentsGroup_ConsoleUIResize,
    [Type.LifeRanking] = _ContentsGroup_isXBOXUI,
    [Type.HorseInfo] = true,
    [Type.Fairy] = _ContentsGroup_isFairy,
    [Type.PersonalMonster] = _ContentsGroup_Console_PersonalMonster,
    [Type.GuildPing] = true,
    [Type.PartyPing] = true,
    [Type.BloodAltar] = _ContentsGroup_Console_BloodAltar or _ContentsGroup_Origin_BloodAltar,
    [Type.BloodAltarRanking] = _ContentsGroup_Console_BloodAltarRanking,
    [Type.PlatoonSetting] = _ContentsGroup_LargeParty,
    [Type.UseAlchemyStone] = _ContentsGroup_AlchemyStone and _ContentsGroup_NewUI_AlchemyStone_All,
    [Type.RestoreItem] = _ContentsGroup_RestoreItem,
    [Type.GuildStableList] = _ContentsGroup_NewUI_GuildStableList_All,
    [Type.MasterpieceAuction] = _ContentsGroup_NewUI_Masterpiece_Auction_All and _ContenstGroup_MasterpieceAuction,
    [Type.BattleGroundPvP] = _ContentsGroup_BattleGroundPvP
  }
}
function varify()
  for type, index in pairs(Type) do
    local func = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[__eQuickMenuDataType_Function]
    local icon = PaGlobal_ConsoleQuickMenu._functionTypeList._icon[__eQuickMenuDataType_Function]
    local name = PaGlobal_ConsoleQuickMenu._functionTypeList._name[__eQuickMenuDataType_Function]
    _PA_ASSERT(func, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 Function \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(icon, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 icon \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(name, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 name \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
  end
end
function FromClient_ConsoleQuickMenu_ExecuteFunctionType(datatype, functionType)
  if __eQuickMenuDataType_Function ~= datatype then
    return
  end
  if Defines.UIMode.eUIMode_Default ~= GetUIMode() then
    return
  end
  local executeFunc = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[datatype][functionType]
  if nil == executeFunc then
    _PA_LOG("\237\155\132\236\167\132", "[ConsoleQuickMenu] QuickMenu.functionType \236\151\144 \237\131\128\236\158\133\236\157\180 \236\182\148\234\176\128\235\144\152\236\151\136\236\156\188\235\169\180 PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction \236\151\144 \236\182\148\234\176\128\237\149\180 \236\163\188\236\132\184\236\154\148  ")
    return
  end
  executeFunc()
end
registerEvent("FromClient_ConsoleQuickMenu_ExecuteFunctionType", "FromClient_ConsoleQuickMenu_ExecuteFunctionType")
function PaGlobal_ConsoleQuickMenu:widgetOpen(invisibleOnly)
  PaGlobal_ConsoleQuickMenu._widgetForceClose = false
  Panel_Widget_QuickMenu:SetShow(true)
  if true == invisibleOnly then
    return
  end
  ToClient_setAvailableInputWidget(true)
end
function PaGlobal_ConsoleQuickMenu:widgetClose(invisibleOnly)
  PaGlobal_ConsoleQuickMenu._widgetForceClose = true
  Panel_Widget_QuickMenu:SetShow(false)
  if true == invisibleOnly then
    return
  end
  ToClient_setAvailableInputWidget(false)
end
function PaGlobal_ConsoleQuickMenu:setDefaultSetting()
  ToClient_setDefaultQuickMenu()
end
PaGlobal_ConsoleQuickMenu:setDefaultSetting()

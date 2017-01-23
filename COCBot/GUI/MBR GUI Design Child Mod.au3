;MODded by DocOc++ Team AIO

; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$hGUI_MOD = GUICreate("", $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $frmBotEx)
;GUISetBkColor($COLOR_WHITE, $hGUI_BOT)

GUISwitch($hGUI_MOD)

$hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

Global $FirstControlToHideMOD = GUICtrlCreateDummy()

$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslated(600,73, "Switch Account"))
Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

Local $x = 25, $y = 45
$grpProfiles = GUICtrlCreateGroup(GetTranslated(637,1, "Switch Profiles"), $x - 20, $y - 20, 440, 360)
$x -= 5
$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(637,2, "Use this to switch to a different profile")& @CRLF & GetTranslated(637,3, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
_GUICtrlSetTip(-1, $txtTip)
setupProfileComboBox()
PopulatePresetComboBox()
GUICtrlSetState(-1, $GUI_SHOW)
GUICtrlSetOnEvent(-1, "cmbProfile")
$txtVillageName = GUICtrlCreateInput(GetTranslated(637,4, "MyVillage"), $x - 3, $y, 130, 22, $ES_AUTOHSCROLL)
GUICtrlSetLimit (-1, 100, 0)
GUICtrlSetFont(-1, 9, 400, 1)
_GUICtrlSetTip(-1, GetTranslated(637,5, "Your village/profile's name"))
GUICtrlSetState(-1, $GUI_HIDE)
; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed

$bIconAdd = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
$bIconConfirm = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
$bIconDelete = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
$bIconCancel = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
$bIconEdit = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
; IceCube (Misc v1.0)
$bIconRecycle = _GUIImageList_Create(24, 24, 4)
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_4.bmp")
_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
; IceCube (Misc v1.0)

$btnAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
GUICtrlSetOnEvent(-1, "btnAddConfirm")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(637,6, "Add New Profile"))
$btnConfirmAdd = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
GUICtrlSetOnEvent(-1, "btnAddConfirm")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,7, "Confirm"))
$btnConfirmRename = GUICtrlCreateButton("", $x + 135, $y, 24, 24)
_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
GUICtrlSetOnEvent(-1, "btnRenameConfirm")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,7, -1))
$btnDelete = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
GUICtrlSetOnEvent(-1, "btnDeleteCancel")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(637,8, "Delete Profile"))
$btnCancel = GUICtrlCreateButton("", $x + 164, $y, 24, 24)
_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
GUICtrlSetOnEvent(-1, "btnDeleteCancel")
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlSetTip(-1, GetTranslated(637,9, "Cancel"))
$btnRename = GUICtrlCreateButton("", $x + 194, $y, 24, 24)
_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
GUICtrlSetOnEvent(-1, "btnRenameConfirm")
_GUICtrlSetTip(-1, GetTranslated(637,10, "Rename Profile"))
; IceCube (Misc v1.0)
$btnRecycle = GUICtrlCreateButton("", $x + 223, $y + 2, 22, 22)
_GUICtrlButton_SetImageList($btnRecycle, $bIconRecycle, 4)
GUICtrlSetOnEvent(-1, "btnRecycle")
GUICtrlSetState(-1, $GUI_SHOW)
_GUICtrlSetTip(-1, GetTranslated(637,50, "Recycle Profile by removing all settings no longer suported that could lead to bad behaviour"))
If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
GUICtrlSetState(-1, $GUI_DISABLE)
Else
GUICtrlSetState(-1, $GUI_ENABLE)
EndIf
; IceCube (Misc v1.0)

GUICtrlCreateGroup("", -99, -99, 1, 1)

#include "..\functions\DocOC++Team Mod's\Misc\MBR GUI Design - SwitchAcc.au3"									;	SwitchAcc Mode - Demen
GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(600,74, "Switch Profiles"))

Local $x = 25, $y = 45

$grpGoldSwitch = GUICtrlCreateGroup(GetTranslated(674,1, "Gold Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;Gold Switch
$chkGoldSwitchMax = GUICtrlCreateCheckbox(GetTranslated(674,2, "Switch To"), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,3, "Enable this to switch profiles when gold is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, "Select which profile to be switched to when conditions met")
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMax = GUICtrlCreateLabel(GetTranslated(674,5, "When Gold is Above"), $x + 145, $y, -1, -1)
$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,6, "Set the amount of Gold to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)

$y += 30
$chkGoldSwitchMin = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,7, "Enable this to switch profiles when gold is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblGoldMin = GUICtrlCreateLabel(GetTranslated(674,8, "When Gold is Below"), $x + 145, $y, -1, -1)
$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,6, -1)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileGold = GUICtrlCreatePic(@ScriptDir & "\Images\GoldStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpElixirSwitch = GUICtrlCreateGroup(GetTranslated(674,9, "Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Elixir Switch
$chkElixirSwitchMax = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,10, "Enable this to switch profiles when Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)

$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMax = GUICtrlCreateLabel(GetTranslated(674,11, "When Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,12, "Set the amount of Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$y += 30
$chkElixirSwitchMin = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,13, "Enable this to switch profiles when Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblElixirMin = GUICtrlCreateLabel(GetTranslated(674,14, "When Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,12, -1)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 7)
$picProfileElixir = GUICtrlCreatePic(@ScriptDir & "\Images\ElixirStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpDESwitch = GUICtrlCreateGroup(GetTranslated(674,15, "Dark Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;DE Switch
$chkDESwitchMax = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,16, "Enable this to switch profiles when Dark Elixir is above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblDEMax = GUICtrlCreateLabel(GetTranslated(674,17, "When Dark Elixir is Above"), $x + 145, $y, -1, -1)
$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,18, "Set the amount of Dark Elixir to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$y += 30
$chkDESwitchMin = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,19, "Enable this to switch profiles when Dark Elixir is below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblDEMin = GUICtrlCreateLabel(GetTranslated(674,20, "When Dark Elixir is Below"), $x + 145, $y, -1, -1)
$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,18, -1)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 6)
$picProfileDE = GUICtrlCreatePic(@ScriptDir & "\Images\DEStorage.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 48
$grpTrophySwitch = GUICtrlCreateGroup(GetTranslated(674,21, "Trophy Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Trophy Switch
$chkTrophySwitchMax = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,22, "Enable this to switch profiles when Trophies are above amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMax = GUICtrlCreateLabel(GetTranslated(674,23, "When Trophies are Above"), $x + 145, $y, -1, -1)
$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,24, "Set the amount of Trophies to trigger switching Profile.")
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$y += 30
$chkTrophySwitchMin = GUICtrlCreateCheckbox(GetTranslated(674,2, -1), $x - 10, $y - 5, -1, -1)
$txtTip = GetTranslated(674,25, "Enable this to switch profiles when Trophies are below amount.")
_GUICtrlSetTip(-1, $txtTip)
$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
$txtTip = GetTranslated(674,4, -1)
_GUICtrlSetTip(-1, $txtTip)
$lblTrophyMin = GUICtrlCreateLabel(GetTranslated(674,26, "When Trophies are Below"), $x + 145, $y, -1, -1)
$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$txtTip = GetTranslated(674,24, -1)
_GUICtrlSetTip(-1, $txtTip)
GUICtrlSetLimit(-1, 4)
$picProfileTrophy = GUICtrlCreatePic(@ScriptDir & "\Images\TrophyLeague.jpg", $x + 350, $y - 40, 60, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBoxswitch()

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem(GetTranslated(600,75, "Chat"))

ChatbotReadSettings()

Local $x = 22, $y = 47

GUICtrlCreateGroup(GetTranslated(675, 1, "Global Chat"), $x - 20, $y - 20, 215, 360)
$y -= 5
$chkGlobalChat = GUICtrlCreateCheckbox(GetTranslated(675, 2, "Advertise in global"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkGlobalChat, GetTranslated(675, 3, "Use global chat to send messages"))
GUICtrlSetState($chkGlobalChat, $ChatbotChatGlobal)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkGlobalScramble = GUICtrlCreateCheckbox(GetTranslated(675, 4, "Scramble global chats"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkGlobalScramble, GetTranslated(675, 5, "Scramble the message pieces defined in the textboxes below to be in a random order"))
GUICtrlSetState($chkGlobalScramble, $ChatbotScrambleGlobal)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkSwitchLang = GUICtrlCreateCheckbox(GetTranslated(675, 6, "Switch languages"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkSwitchLang, GetTranslated(675, 7, "Switch languages after spamming for a new global chatroom"))
GUICtrlSetState($chkSwitchLang, $ChatbotSwitchLang)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
;======kychera===========
$cmbLang = GUICtrlCreateCombo("", $x + 120, $y, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "FR|DE|ES|IT|NL|NO|PR|TR|RU", "RU")
;==========================
$y += 25
$ChatbotChatDelayLabel = GUICtrlCreateLabel(GetTranslated(675, 8, "Chat Delay"), $x - 10, $y)
GUICtrlSetTip($ChatbotChatDelayLabel, GetTranslated(675, 9, "Delay chat between number of bot cycles"))
$chkchatdelay = GUICtrlCreateInput("0", $x + 50, $y - 2, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$y += 22
$editGlobalMessages1 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages1, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages1, GetTranslated(675, 10, "Take one item randomly from this list (one per line) and add it to create a message to send to global"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages2 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages2, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages2, GetTranslated(675, 10, -1))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages3 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages3, @CRLF), $x - 15, $y, 202, 65)
GUICtrlSetTip($editGlobalMessages3, GetTranslated(675, 10, -1))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
$editGlobalMessages4 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages4, @CRLF), $x - 15, $y, 202, 55)
GUICtrlSetTip($editGlobalMessages4, GetTranslated(675, 10, -1))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 65
GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 240, $y = 47

GUICtrlCreateGroup(GetTranslated(675, 11, "Clan Chat"), $x - 20, $y - 20, 218, 360)
$y -= 5
$chkClanChat = GUICtrlCreateCheckbox(GetTranslated(675, 12, "Chat in clan chat:"), $x - 10, $y, -1, -1)
_GUICtrlSetTip($chkClanChat, GetTranslated(675, 13, "Use clan chat to send messages"))
GUICtrlSetState($chkClanChat, $ChatbotChatClan)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$chkRusLang = GUICtrlCreateCheckbox(GetTranslated(675, 14, "Russian"), $x + 130, $y)
GUICtrlSetState(-1, $GUI_UNCHECKED)
_GUICtrlSetTip(-1, GetTranslated(675, 15, "On. Russian send text. Note: The input language in the Android emulator must be RUSSIAN."))
;GUICtrlSetOnEvent(-1, "chkRusLang")
$y += 22
$chkUseResponses = GUICtrlCreateCheckbox(GetTranslated(675, 16, "Use custom responses"), $x - 10, $y, -1, -1) ;GUICtrlCreateCheckbox(GetTranslated(106,18,"Use custom responses"), $x - 10, $y)
GUICtrlSetTip($chkUseResponses, GetTranslated(675, 17, "Use the keywords and responses defined below"))
GUICtrlSetState($chkUseResponses, $ChatbotClanUseResponses)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkUseGeneric = GUICtrlCreateCheckbox(GetTranslated(675, 18, "Use generic chats"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkUseGeneric, GetTranslated(675, 19, "Use generic chats if reading the latest chat failed or there are no new chats"))
GUICtrlSetState($chkUseGeneric, $ChatbotClanAlwaysMsg)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkChatPushbullet = GUICtrlCreateCheckbox(GetTranslated(675, 20, "Use remote for chatting"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkChatPushbullet, GetTranslated(675, 21, "Send and recieve chats via pushbullet or telegram. Use BOT <myvillage> GETCHATS <interval|NOW|STOP> to get the latest clan chat as an image, and BOT <myvillage> SENDCHAT <chat message> to send a chat to your clan"))
GUICtrlSetState($chkChatPushbullet, $ChatbotUsePushbullet)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 22
$chkPbSendNewChats = GUICtrlCreateCheckbox(GetTranslated(675, 22, "Notify me new clan chat"), $x - 10, $y, -1, -1)
GUICtrlSetTip($chkPbSendNewChats, GetTranslated(675, 23, "Will send an image of your clan chat via pushbullet & telegram when a new chat is detected. Not guaranteed to be 100% accurate."))
GUICtrlSetState($chkPbSendNewChats, $ChatbotPbSendNew)
GUICtrlSetOnEvent(-1, "ChatGuiCheckboxUpdate")
$y += 25

$editResponses = GUICtrlCreateEdit(_ArrayToString($ClanResponses, ":", -1, -1, @CRLF), $x - 15, $y, 206, 80)
GUICtrlSetTip($editResponses, GetTranslated(675, 24, "Look for the specified keywords in clan messages and respond with the responses. One item per line, in the format keyword:response"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
$y += 92
$editGeneric = GUICtrlCreateEdit(_ArrayToString($ClanMessages, @CRLF), $x - 15, $y, 206, 80)
GUICtrlSetTip($editGeneric, GetTranslated(675, 25, "Generic messages to send, one per line"))
GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")

ChatGuicheckboxUpdateAT()
GUICtrlCreateTabItem("")

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------

$hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem(GetTranslated(600,76, "Forecast"))

Global $grpForecast
Global $ieForecast

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 25
$ieForecast = GUICtrlCreateObj($oIE, $x, $y, 430, 310)
$y += +318
$chkForecastBoost = GUICtrlCreateCheckbox(GetTranslated(676, 1, "Boost When >"), $x, $y, -1, -1)
$txtTip = GetTranslated(676, 2, "Boost Barracks,Heroes, when the loot index.")
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastBoost")
$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 90, $y + 2, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
$txtTip = GetTranslated(676, 3, "Minimum loot index for boosting.")
GUICtrlSetLimit(-1, 3)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlSetState(-1, $GUI_DISABLE)

$y += -27
$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox(GetTranslated(676, 4, "Switch to"), $x + 155, $y + 27, -1, -1)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 225, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMax = GUICtrlCreateLabel(GetTranslated(676, 5, "When Index <"), $x + 325, $y + 28, -1, -1)
$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 400, $y + 26, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox(GetTranslated(676, 4, -1), $x + 155, $y + 55, -1, -1)
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 225, $y + 53, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblForecastHopingSwitchMin = GUICtrlCreateLabel(GetTranslated(676, 6, "When Index >"), $x + 325, $y + 58, -1, -1)
$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 400, $y + 54, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetTip(-1, $txtTip)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetLimit(-1, 3)
GUICtrlSetData(-1, 2.5)
GUICtrlSetTip(-1, $txtTip)
_GUICtrlEdit_SetReadOnly(-1, True)
setupProfileComboBox()
$cmbSwLang = GUICtrlCreateCombo("", $x, $y + 50, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "EN|RU|FR|DE|ES|IT|PT|IN", "EN")
GUICtrlSetOnEvent(-1, "cmbSwLang")
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")

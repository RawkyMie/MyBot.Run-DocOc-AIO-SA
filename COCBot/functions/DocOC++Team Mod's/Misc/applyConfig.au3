; #FUNCTION# ====================================================================================================================
; Name ..........: applyConfig.au3
; Description ...: Applies all of the  variable to the GUI
; Syntax ........: applyConfig()
; Parameters ....: $bRedrawAtExit = True, redraws bot window after config was applied
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Classic Four Finger
cmbDeployAB()
cmbDeployDB()

; CSV Deploy Speed
_GUICtrlComboBox_SetCurSel($cmbCSVSpeed[$LB], $icmbCSVSpeed[$LB])
_GUICtrlComboBox_SetCurSel($cmbCSVSpeed[$DB], $icmbCSVSpeed[$DB])

; Smart Upgarde
If $ichkSmartUpgrade = 1 Then
	GUICtrlSetState($chkSmartUpgrade, $GUI_CHECKED)
Else
	GUICtrlSetState($chkSmartUpgrade, $GUI_UNCHECKED)
EndIf
chkSmartUpgrade()

GUICtrlSetData($SmartMinGold, $iSmartMinGold)
GUICtrlSetData($SmartMinElixir, $iSmartMinElixir)
GUICtrlSetData($SmartMinDark, $iSmartMinDark)

If $ichkIgnoreTH = 1 Then
	GUICtrlSetState($chkIgnoreTH, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreTH, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreKing = 1 Then
	GUICtrlSetState($chkIgnoreKing, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreKing, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreQueen = 1 Then
	GUICtrlSetState($chkIgnoreQueen, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreQueen, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreWarden = 1 Then
	GUICtrlSetState($chkIgnoreWarden, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreWarden, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreCC = 1 Then
	GUICtrlSetState($chkIgnoreCC, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreCC, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreLab = 1 Then
	GUICtrlSetState($chkIgnoreLab, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreLab, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreBarrack = 1 Then
	GUICtrlSetState($chkIgnoreBarrack, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreBarrack, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreDBarrack = 1 Then
	GUICtrlSetState($chkIgnoreDBarrack, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreDBarrack, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreFactory = 1 Then
	GUICtrlSetState($chkIgnoreFactory, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreFactory, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreDFactory = 1 Then
	GUICtrlSetState($chkIgnoreDFactory, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreDFactory, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreGColl = 1 Then
	GUICtrlSetState($chkIgnoreGColl, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreGColl, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreEColl = 1 Then
	GUICtrlSetState($chkIgnoreEColl, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreEColl, $GUI_UNCHECKED)
EndIf

If $ichkIgnoreDColl = 1 Then
	GUICtrlSetState($chkIgnoreDColl, $GUI_CHECKED)
Else
	GUICtrlSetState($chkIgnoreDColl, $GUI_UNCHECKED)
EndIf
chkSmartUpgrade()

; CoC Stats
If $ichkCoCStats = 1 Then
	GUICtrlSetState($chkCoCStats, $GUI_CHECKED)
Else
	GUICtrlSetState($chkCoCStats, $GUI_UNCHECKED)
EndIf
GUICtrlSetData($txtAPIKey, $MyApiKey)
chkCoCStats()

; Profile Switch
If $ichkGoldSwitchMax = 1 Then
	GUICtrlSetState($chkGoldSwitchMax, $GUI_CHECKED)
Else
	GUICtrlSetState($chkGoldSwitchMax, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbGoldMaxProfile, $icmbGoldMaxProfile)
GUICtrlSetData($txtMaxGoldAmount, $itxtMaxGoldAmount)
If $ichkGoldSwitchMin = 1 Then
	GUICtrlSetState($chkGoldSwitchMin, $GUI_CHECKED)
Else
	GUICtrlSetState($chkGoldSwitchMin, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbGoldMinProfile, $icmbGoldMinProfile)
GUICtrlSetData($txtMinGoldAmount, $itxtMinGoldAmount)

If $ichkElixirSwitchMax = 1 Then
	GUICtrlSetState($chkElixirSwitchMax, $GUI_CHECKED)
Else
	GUICtrlSetState($chkElixirSwitchMax, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbElixirMaxProfile, $icmbElixirMaxProfile)
GUICtrlSetData($txtMaxElixirAmount, $itxtMaxElixirAmount)
If $ichkElixirSwitchMin = 1 Then
	GUICtrlSetState($chkElixirSwitchMin, $GUI_CHECKED)
Else
	GUICtrlSetState($chkElixirSwitchMin, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbElixirMinProfile, $icmbElixirMinProfile)
GUICtrlSetData($txtMinElixirAmount, $itxtMinElixirAmount)

If $ichkDESwitchMax = 1 Then
	GUICtrlSetState($chkDESwitchMax, $GUI_CHECKED)
Else
	GUICtrlSetState($chkDESwitchMax, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbDEMaxProfile, $icmbDEMaxProfile)
GUICtrlSetData($txtMaxDEAmount, $itxtMaxDEAmount)
If $ichkDESwitchMin = 1 Then
	GUICtrlSetState($chkDESwitchMin, $GUI_CHECKED)
Else
	GUICtrlSetState($chkDESwitchMin, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbDEMinProfile, $icmbDEMinProfile)
GUICtrlSetData($txtMinDEAmount, $itxtMinDEAmount)

If $ichkTrophySwitchMax = 1 Then
	GUICtrlSetState($chkTrophySwitchMax, $GUI_CHECKED)
Else
	GUICtrlSetState($chkTrophySwitchMax, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbTrophyMaxProfile, $icmbTrophyMaxProfile)
GUICtrlSetData($txtMaxTrophyAmount, $itxtMaxTrophyAmount)
If $ichkTrophySwitchMin = 1 Then
	GUICtrlSetState($chkTrophySwitchMin, $GUI_CHECKED)
Else
	GUICtrlSetState($chkTrophySwitchMin, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbTrophyMinProfile, $icmbTrophyMinProfile)
GUICtrlSetData($txtMinTrophyAmount, $itxtMinTrophyAmount)

; Color Android Shield
_GUICtrlSlider_SetPos($sldrTransparancyShield, $AndroidShieldTransparency)
_GUICtrlSlider_SetPos($sldrTransparancyIdleShield, $AndroidInactiveTransparency)

; Auto Hide
If $ichkAutoHide = 1 Then
	GUICtrlSetState($chkAutoHide, $GUI_CHECKED)
Else
	GUICtrlSetState($chkAutoHide, $GUI_UNCHECKED)
EndIf
GUICtrlSetData($txtAutoHideDelay, $ichkAutoHideDelay)
chkAutoHide()

; Config Apply for SwitchAcc Mode - DEMEN
If $ichkSwitchAcc = 1 Then
	GUICtrlSetState($chkSwitchAcc, $GUI_CHECKED)
Else
	GUICtrlSetState($chkSwitchAcc, $GUI_UNCHECKED)
EndIf

If $ichkTrain = 1 Then
	GUICtrlSetState($chkTrain, $GUI_CHECKED)
Else
	GUICtrlSetState($chkTrain, $GUI_UNCHECKED)
EndIf

If $ichkSmartSwitch = 1 Then
	GUICtrlSetState($radSmartSwitch, $GUI_CHECKED)
Else
	GUICtrlSetState($radNormalSwitch, $GUI_CHECKED)
EndIf

radNormalSwitch()

_GUICtrlCombobox_SetCurSel($cmbTotalAccount, $icmbTotalCoCAcc - 1)

If $ichkCloseTraining >= 1 Then
	GUICtrlSetState($chkUseTrainingClose, $GUI_CHECKED)
	If $ichkCloseTraining = 1 Then
		GUICtrlSetState($radCloseCoC, $GUI_CHECKED)
	Else
		GUICtrlSetState($radCloseAndroid, $GUI_CHECKED)
	EndIf
Else
	GUICtrlSetState($chkUseTrainingClose, $GUI_UNCHECKED)
EndIf

For $i = 0 to 7
	_GUICtrlCombobox_SetCurSel($cmbAccountNo[$i], $aMatchProfileAcc[$i]-1)
	_GUICtrlCombobox_SetCurSel($cmbProfileType[$i], $aProfileType[$i]-1)
Next

;Forecast Added by rulesss
GUICtrlSetData($txtForecastBoost, $iTxtForecastBoost)
If $iChkForecastBoost = 1 Then
	GUICtrlSetState($chkForecastBoost, $GUI_CHECKED)
Else
	GUICtrlSetState($chkForecastBoost, $GUI_UNCHECKED)
EndIf
chkForecastBoost()

If $ichkForecastHopingSwitchMax = 1 Then
	GUICtrlSetState($chkForecastHopingSwitchMax, $GUI_CHECKED)
Else
	GUICtrlSetState($chkForecastHopingSwitchMax, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbForecastHopingSwitchMax, $icmbForecastHopingSwitchMax)
GUICtrlSetData($txtForecastHopingSwitchMax, $itxtForecastHopingSwitchMax)
chkForecastHopingSwitchMax()

If $ichkForecastHopingSwitchMin = 1 Then
	GUICtrlSetState($chkForecastHopingSwitchMin, $GUI_CHECKED)
Else
	GUICtrlSetState($chkForecastHopingSwitchMin, $GUI_UNCHECKED)
EndIf
_GUICtrlComboBox_SetCurSel($cmbForecastHopingSwitchMin, $icmbForecastHopingSwitchMin)
GUICtrlSetData($txtForecastHopingSwitchMin, $itxtForecastHopingSwitchMin)
chkForecastHopingSwitchMin()

;Added Multi Switch Language by rulesss and Kychera
_GUICtrlComboBox_SetCurSel($cmbSwLang, $icmbSwLang)
$icmbSwLang = _GUICtrlComboBox_GetCurSel($cmbSwLang)

;==========Russian Languages by Kychera==========
If $ichkRusLang = 1 Then
	GUICtrlSetState($chkRusLang, $GUI_CHECKED)
ElseIf $ichkRusLang = 0 Then
	GUICtrlSetState($chkRusLang, $GUI_UNCHECKED)
EndIf

If $ichkRusLang2 = 1 Then
	GUICtrlSetState($chkRusLang2, $GUI_CHECKED)
ElseIf $ichkRusLang2 = 0 Then
	GUICtrlSetState($chkRusLang2, $GUI_UNCHECKED)
EndIf

_GUICtrlComboBox_SetCurSel($cmbLang, $icmbLang)
$icmbLang = _GUICtrlComboBox_GetCurSel($cmbLang)

;modification Chat by rulesss
GUICtrlSetData($chkchatdelay, $ichkchatdelay)

; QuicktrainCombo (Demen) - Added By NguyenAnhHD
If $iChkQuickArmy12 = 1 Then
	GUICtrlSetState($hRadio_Army12, $GUI_CHECKED)
Else
	GUICtrlSetState($hRadio_Army12, $GUI_UNCHECKED)
EndIf

If $iChkQuickArmy123 = 1 Then
	GUICtrlSetState($hRadio_Army123, $GUI_CHECKED)
Else
	GUICtrlSetState($hRadio_Army123, $GUI_UNCHECKED)
EndIf

; SimpleQuicktrain (Demen) - Added By NguyenAnhHD
If $ichkSimpleQuickTrain = 1 Then
	GUICtrlSetState($chkSimpleQuickTrain, $GUI_CHECKED)
Else
	GUICtrlSetState($chkSimpleQuickTrain, $GUI_UNCHECKED)
EndIf

If $ichkFillArcher = 1 Then
	GUICtrlSetState($chkFillArcher, $GUI_CHECKED)
Else
	GUICtrlSetState($chkFillArcher, $GUI_UNCHECKED)
EndIf
GUICtrlSetData($txtFillArcher, $iFillArcher)

If $ichkFillEQ = 1 Then
	GUICtrlSetState($chkFillEQ, $GUI_CHECKED)
Else
	GUICtrlSetState($chkFillEQ, $GUI_UNCHECKED)
EndIf

If $ichkTrainDonated = 1 Then
	GUICtrlSetState($chkTrainDonated, $GUI_CHECKED)
Else
	GUICtrlSetState($chkTrainDonated, $GUI_UNCHECKED)
EndIf
chkSimpleQuickTrain()

; Check Collectors Outside - Added By NguyenAnhHD
If $ichkDBMeetCollOutside = 1 Then
	GUICtrlSetState($chkDBMeetCollOutside, $GUI_CHECKED)
Else
	GUICtrlSetState($chkDBMeetCollOutside, $GUI_UNCHECKED)
EndIf
chkDBMeetCollOutside()
GUICtrlSetData($txtDBMinCollOutsidePercent, $iDBMinCollOutsidePercent)

; Clan Hop Setting - Added By NguyenAnhHD
If $ichkClanHop = 1 Then
	GUICtrlSetState($chkClanHop, $GUI_CHECKED)
Else
	GUICtrlSetState($chkClanHop, $GUI_UNCHECKED)
EndIf

;==========Modified Kychera==
If $NotifyAlertBOTSleep = 1 Then
	GUICtrlSetState($chkNotifyBOTSleep, $GUI_CHECKED)
ElseIf $NotifyAlertBOTSleep = 0 Then
	GUICtrlSetState($chkNotifyBOTSleep, $GUI_UNCHECKED)
EndIf

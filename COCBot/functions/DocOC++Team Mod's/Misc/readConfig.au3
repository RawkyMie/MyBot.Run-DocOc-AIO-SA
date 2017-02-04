; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Smart Upgrade
$ichkSmartUpgrade = IniRead($config, "upgrade", "chkSmartUpgrade", "0")
$ichkIgnoreTH = IniRead($config, "upgrade", "chkIgnoreTH", "0")
$ichkIgnoreKing = IniRead($config, "upgrade", "chkIgnoreKing", "0")
$ichkIgnoreQueen = IniRead($config, "upgrade", "chkIgnoreQueen", "0")
$ichkIgnoreWarden = IniRead($config, "upgrade", "chkIgnoreWarden", "0")
$ichkIgnoreCC = IniRead($config, "upgrade", "chkIgnoreCC", "0")
$ichkIgnoreLab = IniRead($config, "upgrade", "chkIgnoreLab", "0")
$ichkIgnoreBarrack = IniRead($config, "upgrade", "chkIgnoreBarrack", "0")
$ichkIgnoreDBarrack = IniRead($config, "upgrade", "chkIgnoreDBarrack", "0")
$ichkIgnoreFactory = IniRead($config, "upgrade", "chkIgnoreFactory", "0")
$ichkIgnoreDFactory = IniRead($config, "upgrade", "chkIgnoreDFactory", "0")
$ichkIgnoreGColl = IniRead($config, "upgrade", "chkIgnoreGColl", "0")
$ichkIgnoreEColl = IniRead($config, "upgrade", "chkIgnoreEColl", "0")
$ichkIgnoreDColl = IniRead($config, "upgrade", "chkIgnoreDColl", "0")
$iSmartMinGold = IniRead($config, "upgrade", "SmartMinGold", "0")
$iSmartMinElixir = IniRead($config, "upgrade", "SmartMinElixir", "0")
$iSmartMinDark = IniRead($config, "upgrade", "SmartMinDark", "0")

; CoC Stats
$ichkCoCStats = IniRead($config, "Stats", "chkCoCStats", "0")
$MyApiKey = IniRead($config, "Stats", "txtAPIKey", "")

; CSV Deploy Speed
$icmbCSVSpeed[$LB] = IniRead($config, "DeploymentSpeed", "LB", "2")
$icmbCSVSpeed[$DB] = IniRead($config, "DeploymentSpeed", "DB", "2")

; Auto Hide
IniReadS($ichkAutoHide, $config, "general", "AutoHide", "0")
IniReadS($ichkAutoHideDelay, $config, "general", "AutoHideDelay", "10")

; Profile Switch
$ichkGoldSwitchMax = IniRead($config, "profiles", "chkGoldSwitchMax", "0")
$icmbGoldMaxProfile = IniRead($config, "profiles", "cmbGoldMaxProfile", "0")
$itxtMaxGoldAmount = IniRead($config, "profiles", "txtMaxGoldAmount", "6000000")
$ichkGoldSwitchMin = IniRead($config, "profiles", "chkGoldSwitchMin", "0")
$icmbGoldMinProfile = IniRead($config, "profiles", "cmbGoldMinProfile", "0")
$itxtMinGoldAmount = IniRead($config, "profiles", "txtMinGoldAmount", "500000")

$ichkElixirSwitchMax = IniRead($config, "profiles", "chkElixirSwitchMax", "0")
$icmbElixirMaxProfile = IniRead($config, "profiles", "cmbElixirMaxProfile", "0")
$itxtMaxElixirAmount = IniRead($config, "profiles", "txtMaxElixirAmount", "6000000")
$ichkElixirSwitchMin = IniRead($config, "profiles", "chkElixirSwitchMin", "0")
$icmbElixirMinProfile = IniRead($config, "profiles", "cmbElixirMinProfile", "0")
$itxtMinElixirAmount = IniRead($config, "profiles", "txtMinElixirAmount", "500000")

$ichkDESwitchMax = IniRead($config, "profiles", "chkDESwitchMax", "0")
$icmbDEMaxProfile = IniRead($config, "profiles", "cmbDEMaxProfile", "0")
$itxtMaxDEAmount = IniRead($config, "profiles", "txtMaxDEAmount", "200000")
$ichkDESwitchMin = IniRead($config, "profiles", "chkDESwitchMin", "0")
$icmbDEMinProfile = IniRead($config, "profiles", "cmbDEMinProfile", "0")
$itxtMinDEAmount = IniRead($config, "profiles", "txtMinDEAmount", "10000")

$ichkTrophySwitchMax = IniRead($config, "profiles", "chkTrophySwitchMax", "0")
$icmbTrophyMaxProfile = IniRead($config, "profiles", "cmbTrophyMaxProfile", "0")
$itxtMaxTrophyAmount = IniRead($config, "profiles", "txtMaxTrophyAmount", "3000")
$ichkTrophySwitchMin = IniRead($config, "profiles", "chkTrophySwitchMin", "0")
$icmbTrophyMinProfile = IniRead($config, "profiles", "cmbTrophyMinProfile", "0")
$itxtMinTrophyAmount = IniRead($config, "profiles", "txtMinTrophyAmount", "1000")

; Config Read for SwitchAcc Mode - DEMEN
IniReadS($ichkSwitchAcc, $profile, "Switch Account", "Enable", "0")
IniReadS($ichkTrain, $profile, "Switch Account", "Pre-train", "0")
IniReadS($icmbTotalCoCAcc, $profile, "Switch Account", "Total Coc Account", "-1")
IniReadS($ichkSmartSwitch, $profile, "Switch Account", "Smart Switch", "0")
$ichkCloseTraining = Number(IniRead($profile, "Switch Account", "Sleep Combo", "0"))	; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep

For $i = 0 to 7
	IniReadS($aMatchProfileAcc[$i],$profile, "Switch Account", "MatchProfileAcc." & $i+1, "-1")
	IniReadS($aProfileType[$i], $profile, "Switch Account", "ProfileType." & $i+1, "-1")
	IniReadS($aAccPosY[$i], $profile, "Switch Account", "AccLocation." & $i+1, "-1")
Next

;Forecast Added by rulesss
$iChkForecastBoost = IniRead($config, "forecast", "chkForecastBoost", "0")
$iTxtForecastBoost = IniRead($config, "forecast", "txtForecastBoost", "6.0")
$ichkForecastHopingSwitchMax = IniRead($config, "profiles", "chkForecastHopingSwitchMax", "0")
$icmbForecastHopingSwitchMax = IniRead($config, "profiles", "cmbForecastHopingSwitchMax", "0")
$itxtForecastHopingSwitchMax = IniRead($config, "profiles", "txtForecastHopingSwitchMax", "2.5")
$ichkForecastHopingSwitchMin = IniRead($config, "profiles", "chkForecastHopingSwitchMin", "0")
$icmbForecastHopingSwitchMin = IniRead($config, "profiles", "cmbForecastHopingSwitchMin", "0")
$itxtForecastHopingSwitchMin = IniRead($config, "profiles", "txtForecastHopingSwitchMin", "2.5")
;Added Multi Switch Language by rulesss and Kychera
$icmbSwLang = IniRead($config, "Lang", "cmbSwLang", "0")

;==========;Russian Languages by Kychera==========
$ichkRusLang = IniRead($config, "Lang", "chkRusLang", "0")
$ichkRusLang2 = IniRead($config, "Lang", "chkRusLang2", "0")
;sw langs
$icmbLang = IniRead($config, "Lang", "cmbLang", "8")
;==========;Russian Languages by Kychera==========
;modification Chat by rulesss
$ichkchatdelay = IniRead($config, "global", "chdelay", "0")

; QuicktrainCombo (Demen) - Added By NguyenAnhHD
IniReadS($iRadio_Army12, $config, "troop", "QuickTrain12", "0")
IniReadS($iRadio_Army123, $config, "troop", "QuickTrain123", "0")

; SimpleQuicktrain (Demen) - Added By NguyenAnhHD
IniReadS($ichkSimpleQuickTrain, $config, "troop", "SimpleQuickTrain", "0")
IniReadS($ichkFillArcher, $config, "troop", "ChkFillArcher", "0")
IniReadS($iFillArcher, $config, "troop", "FillArcher", "0")
IniReadS($ichkFillEQ, $config, "troop", "FillEQ", "0")
IniReadS($ichkTrainDonated, $config, "troop", "TrainDonated", "0")

; Check Collectors Outside - Added By NguyenAnhHD
$ichkDBMeetCollOutside = IniRead($config, "search", "DBMeetCollOutside", "0")
$iDBMinCollOutsidePercent = IniRead($config, "search", "DBMinCollOutsidePercent", "50")

; Clan Hop Setting - Added By NguyenAnhHD
$ichkClanHop = IniRead($config, "Others", "ClanHop", "0")

IniReadS($NotifyAlertBOTSleep, $config, "notify", "AlertPBSleep", "0")
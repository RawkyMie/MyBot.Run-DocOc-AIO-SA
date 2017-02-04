; #FUNCTION# ====================================================================================================================
; Name ..........: SmartQuickTrain
; Description ...: This file contains the Sequence that runs all MBR Bot
; Author ........: DEMEN
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SimpleQuickTrain()

	Setlog(" »» Simple Quick Train")

	Local $CheckTroop[4] = [810, 186, 0xCFCFC8, 15] ; the gray background
	Local $FullTroopQueueSkipTrain = False
	Local $FullSpellQueueSkipTrain = False

	If $Runstate = False Then Return

	If IsTrainPage() And ISArmyWindow(False, $TrainTroopsTAB) = False Then OpenTrainTabNumber($TrainTroopsTAB)
	If _Sleep(1500) Then Return
	If ISArmyWindow(True, $TrainTroopsTAB) = False Then Return

	Local $ArmyCamp = GetOCRCurrent(48, 160)

	Setlog(" - Current queue/capacity: " & $ArmyCamp[0] & "/" & $ArmyCamp[1])

	If $ichkFillArcher = 1 Then
		$iFillArcher = GUICtrlRead($txtFillArcher)
	Else
		$iFillArcher = 0
	EndIf

	Switch $ArmyCamp[0] - $ArmyCamp[1]
		Case -$ArmyCamp[1] To -$iFillArcher-1
			SetLog(" »» Not Full Troop Camp")

		Case -$iFillArcher To 0
			If $ArmyCamp[0] - $ArmyCamp[1] < 0 Then
				SetLog(" »» Fill some Archers")
				Local $ArchToMake = $ArmyCamp[1] - $ArmyCamp[0]
				If ISArmyWindow(False, $TrainTroopsTAB) Then TrainIt($eArch, $ArchToMake, 500)
				SetLog(" » Trained " & $ArchToMake & " archer(s)!")
			Else
				SetLog(" »» Zero Queued")
			EndIf

		Case 1 To $ArmyCamp[1] - $iFillArcher - 1
			SetLog(" »» Not Full Queued. Delete Queued Troops")
			If ISArmyWindow(False, $TrainTroopsTAB) Then
				For $i = 0 To 11
				   If _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False Then
					  Local $x = 0
					  While _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False
						If _Sleep(20) Then Return
						If $Runstate = False Then Return
						PureClick($CheckTroop[0] - $i*70, 202, 2, 50)
						$x += 1
						If $x = 250 Then ExitLoop
					  WEnd
					  ExitLoop
				   EndIf
				Next
			EndIf

		Case $ArmyCamp[1] -$iFillArcher To $ArmyCamp[1]
			If $ArmyCamp[0] - $ArmyCamp[1] < $ArmyCamp[1] Then
				SetLog(" »» Fill some Archers")
				Local $ArchToMake = $ArmyCamp[1]*2 - $ArmyCamp[0]
				If ISArmyWindow(False, $TrainTroopsTAB) Then TrainIt($eArch, $ArchToMake, 500)
				SetLog(" » Trained " & $ArchToMake & " archer(s)!")
			Else
				SetLog(" »» Full Queued")
			EndIf
	EndSwitch

	If IsTrainPage() And ISArmyWindow(False, $BrewSpellsTAB) = False Then OpenTrainTabNumber($BrewSpellsTAB)
	If _Sleep(1500) Then Return
	If ISArmyWindow(True, $BrewSpellsTAB) = False Then Return

	Local $SpellCamp = GetOCRCurrent(48, 160)
	Setlog(" - Current queue/capacity: " & $SpellCamp[0] & "/" & $SpellCamp[1])

	Switch $SpellCamp[0] - $SpellCamp[1]
		Case -$SpellCamp[1] To -1
			If $ichkFillEQ = 0 OR $SpellCamp[0] - $SpellCamp[1] < -1 Then
				SetLog(" »» Not Full Spell Camp")
			Else
				SetLog(" »» Fill with 1 EQ Spell")
				If ISArmyWindow(False, $BrewSpellsTAB) Then TrainIt($eESpell, 1, 500)
				SetLog(" » Brewed 1 EQ Spell!")
			EndIf

		Case 0
			SetLog(" »» Full Spell Camp, Zero Queued")

		Case 1 To $SpellCamp[1] - 1

			If $ichkFillEQ = 0 OR $SpellCamp[0] - $SpellCamp[1] < $SpellCamp[1] - 1 Then
				SetLog(" »» Not Full Queued, Delete Queued Spells")
				If ISArmyWindow(False, $BrewSpellsTAB) Then
					SetLog(" »» Spell Tab Open")
					For $i = 0 To 11
					   If _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False Then
						 Local $x = 0
						  While _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False
							If _Sleep(20) Then Return
							If $Runstate = False Then Return
							PureClick($CheckTroop[0] - $i*70, 202, 2, 50)
							$x += 1
							If $x = 22 Then ExitLoop
						 WEnd
						 ExitLoop
					  EndIf
					Next
				EndIf
			Else
				SetLog(" »» Fill with 1 EQ Spell")
				If ISArmyWindow(False, $BrewSpellsTAB) Then TrainIt($eESpell, 1, 500)
				SetLog(" » Brewed 1 EQ Spell!")
			EndIf

		Case $SpellCamp[1]
			SetLog(" »» Full Queued")
	EndSwitch

	MakeQuickTrain()

EndFunc

Func MakeQuickTrain()
	If GUICtrlRead($hRadio_Army12) = $GUI_CHECKED Or GUICtrlRead($hRadio_Army123) = $GUI_CHECKED Then				;	QuickTrainCombo - Demen
		QuickTrain(1, False, false)
		QuickTrain(2, False, false)
		If GUICtrlRead($hRadio_Army123) = $GUI_CHECKED Then QuickTrain(3, False, False)
		ClickP($aAway, 2, 0, "#0346") ;Click Away
	Else																											;	QuickTrainCombo - Demen
		CheckCamp()
	EndIf

EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: AutoHide
; Description ...: This file contains all functions of AutoHide feature
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: nguyenanhhd
; Modified ......: 03/09/2016
; Remarks .......: This file is part of MyBotRun. Copyright 2016
;                  MyBotRun is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......:  =====================================================================================================================

Func AutoHide()
	If $ichkAutoHide = 1 Then
		SetLog("Bot Auto Hide in " & $ichkAutoHideDelay & " seconds", $COLOR_RED)
		Sleep($ichkAutoHideDelay * 1000)
		btnHide()
	EndIf
EndFunc   ;==>AutoHide

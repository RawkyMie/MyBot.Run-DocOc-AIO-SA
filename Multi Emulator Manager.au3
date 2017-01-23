#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=images\MyBot.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>

Global $ProfileName[6] = [0, 0, 0, 0, 0, 0]
Global $InstanceName[6] = [0, 0, 0, 0, 0, 0]
Global $Launch[6] = [0, 0, 0, 0, 0, 0]
Global $EmulatorName = "MEmu"
Global $ManagerConfig = @ScriptDir & "\ManagerConfig.ini"

; ================================================== GUI PART ================================================== ;

GUICreate("@RoroTiti Multi Emulator Manager v0.2", 542, 353, 192, 124)
GUISetIcon(@ScriptDir & "\images\MyBot.ico")

GUICtrlCreateGroup("Instance 1", 5, 65, 531, 51)
$InstanceName[1] = GUICtrlCreateInput("Instance 1 Name", 15, 85, 211, 21)
$ProfileName[1] = GUICtrlCreateInput("Profile 1 Name", 240, 85, 211, 21)
$Launch[1] = GUICtrlCreateButton("Launch !", 460, 85, 71, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 2", 5, 115, 531, 51)
$InstanceName[2] = GUICtrlCreateInput("Instance 2 Name", 15, 135, 211, 21)
$ProfileName[2] = GUICtrlCreateInput("Profile 2 Name", 240, 135, 211, 21)
$Launch[2] = GUICtrlCreateButton("Launch !", 460, 135, 71, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 3", 5, 165, 531, 51)
$InstanceName[3] = GUICtrlCreateInput("Instance 3 Name", 15, 185, 211, 21)
$ProfileName[3] = GUICtrlCreateInput("Profile 3 Name", 240, 185, 211, 21)
$Launch[3] = GUICtrlCreateButton("Launch !", 460, 185, 71, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 4", 5, 215, 531, 51)
$InstanceName[4] = GUICtrlCreateInput("Instance 4 Name", 15, 235, 211, 21)
$ProfileName[4] = GUICtrlCreateInput("Profile 4 Name", 240, 235, 211, 21)
$Launch[4] = GUICtrlCreateButton("Launch !", 460, 235, 71, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Instance 5", 5, 265, 531, 51)
$InstanceName[5] = GUICtrlCreateInput("Instance 5 Name", 15, 285, 211, 21)
$ProfileName[5] = GUICtrlCreateInput("Profile 5 Name", 240, 285, 211, 21)
$Launch[5] = GUICtrlCreateButton("Launch !", 460, 285, 71, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateLabel("@RoroTiti Multi Instances Manager 0.2", 240, 15, 295, 23)
GUICtrlSetFont(-1, 12, 800, 0, "Arial")

GUICtrlCreateGroup("Choose your Emulator...", 5, 5, 226, 36)
$Radio1 = GUICtrlCreateRadio("MEmu", 10, 20, 48, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("Droid4X", 60, 20, 58, 17)
$Radio3 = GUICtrlCreateRadio("Nox", 120, 20, 38, 17)
$Radio4 = GUICtrlCreateRadio("LeapDroid", 160, 20, 68, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateLabel("Emulator Instance Name", 15, 45, 159, 20, $SS_CENTER)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")

GUICtrlCreateLabel("Profile Name", 240, 45, 87, 20, $SS_CENTER)
GUICtrlSetFont(-1, 10, 800, 0, "Arial")

$OpenMultiMEmu = GUICtrlCreateButton("Open Multi MEmu", 5, 320, 126, 26)
$OpenMultiDroid4X = GUICtrlCreateButton("Open Multi Droid4X", 140, 320, 126, 26)
$OpenMultiNox = GUICtrlCreateButton("Open Multi Nox", 275, 320, 126, 26)
$OpenMultiLeapDroid = GUICtrlCreateButton("Open Multi LeapDroid", 410, 320, 126, 26)
$ImportConfig = GUICtrlCreateButton("Import Instances for selected Emulator", 340, 40, 196, 26)

ReadnApplyConfig()

GUISetState(@SW_SHOW)

; ================================================== FUNCTIONS PART ================================================== ;

Func SaveConfig()

	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[1]", GUICtrlRead($ProfileName[1]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[2]", GUICtrlRead($ProfileName[2]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[3]", GUICtrlRead($ProfileName[3]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[4]", GUICtrlRead($ProfileName[4]))
	IniWrite($ManagerConfig, "ProfileNames", "ProfileName[5]", GUICtrlRead($ProfileName[5]))

	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[1]", GUICtrlRead($InstanceName[1]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[2]", GUICtrlRead($InstanceName[2]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[3]", GUICtrlRead($InstanceName[3]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[4]", GUICtrlRead($InstanceName[4]))
	IniWrite($ManagerConfig, "InstanceNames", "InstanceName[5]", GUICtrlRead($InstanceName[5]))

	If GUICtrlRead($Radio1) = $GUI_CHECKED Then
		IniWrite($ManagerConfig, "EmulatorID", "MEmu", 1)
	Else
		IniWrite($ManagerConfig, "EmulatorID", "MEmu", 0)
	EndIf

	If GUICtrlRead($Radio2) = $GUI_CHECKED Then
		IniWrite($ManagerConfig, "EmulatorID", "Droid4X", 1)
	Else
		IniWrite($ManagerConfig, "EmulatorID", "Droid4X", 0)
	EndIf

	If GUICtrlRead($Radio3) = $GUI_CHECKED Then
		IniWrite($ManagerConfig, "EmulatorID", "Nox", 1)
	Else
		IniWrite($ManagerConfig, "EmulatorID", "Nox", 0)
	EndIf

	If GUICtrlRead($Radio4) = $GUI_CHECKED Then
		IniWrite($ManagerConfig, "EmulatorID", "LeapDroid", 1)
	Else
		IniWrite($ManagerConfig, "EmulatorID", "LeapDroid", 0)
	EndIf

EndFunc   ;==>SaveConfig

Func ReadnApplyConfig()

	GUICtrlSetData($ProfileName[1], IniRead($ManagerConfig, "ProfileNames", "ProfileName[1]", "Profile 1 Name"))
	GUICtrlSetData($ProfileName[2], IniRead($ManagerConfig, "ProfileNames", "ProfileName[2]", "Profile 2 Name"))
	GUICtrlSetData($ProfileName[3], IniRead($ManagerConfig, "ProfileNames", "ProfileName[3]", "Profile 3 Name"))
	GUICtrlSetData($ProfileName[4], IniRead($ManagerConfig, "ProfileNames", "ProfileName[4]", "Profile 4 Name"))
	GUICtrlSetData($ProfileName[5], IniRead($ManagerConfig, "ProfileNames", "ProfileName[5]", "Profile 5 Name"))

	GUICtrlSetData($InstanceName[1], IniRead($ManagerConfig, "InstanceNames", "InstanceName[1]", "Instance 1 Name"))
	GUICtrlSetData($InstanceName[2], IniRead($ManagerConfig, "InstanceNames", "InstanceName[2]", "Instance 2 Name"))
	GUICtrlSetData($InstanceName[3], IniRead($ManagerConfig, "InstanceNames", "InstanceName[3]", "Instance 3 Name"))
	GUICtrlSetData($InstanceName[4], IniRead($ManagerConfig, "InstanceNames", "InstanceName[4]", "Instance 4 Name"))
	GUICtrlSetData($InstanceName[5], IniRead($ManagerConfig, "InstanceNames", "InstanceName[5]", "Instance 5 Name"))

	$iRadio1 = IniRead($ManagerConfig, "EmulatorID", "MEmu", "1")
	$iRadio2 = IniRead($ManagerConfig, "EmulatorID", "Droid4X", "0")
	$iRadio3 = IniRead($ManagerConfig, "EmulatorID", "Nox", "0")
	$iRadio4 = IniRead($ManagerConfig, "EmulatorID", "LeapDroid", "0")

	If $iRadio1 = 1 Then
		GUICtrlSetState($Radio1, $GUI_CHECKED)
	Else
		GUICtrlSetState($Radio1, $GUI_UNCHECKED)
	EndIf

	If $iRadio2 = 1 Then
		GUICtrlSetState($Radio2, $GUI_CHECKED)
	Else
		GUICtrlSetState($Radio2, $GUI_UNCHECKED)
	EndIf

	If $iRadio3 = 1 Then
		GUICtrlSetState($Radio3, $GUI_CHECKED)
	Else
		GUICtrlSetState($Radio3, $GUI_UNCHECKED)
	EndIf

	If $iRadio4 = 1 Then
		GUICtrlSetState($Radio4, $GUI_CHECKED)
	Else
		GUICtrlSetState($Radio4, $GUI_UNCHECKED)
	EndIf

EndFunc   ;==>ReadnApplyConfig

Func SetEmulator()

	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $EmulatorName = "MEmu"
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $EmulatorName = "Droid4X"
	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $EmulatorName = "Nox"
	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $EmulatorName = "LeapDroid"

EndFunc   ;==>SetEmulator

; ================================================== USER ACTIONS PART ================================================== ;

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			SaveConfig()
			Exit
		Case $ImportConfig
			SetEmulator()
			Switch $EmulatorName
				Case "MEmu"
					$InstancesNames = _FileListToArray("C:\Program Files\Microvirt\MEmu\MemuHyperv VMs")
					If UBound($InstancesNames, $UBOUND_ROWS) >= 6 Then
						$xmax = 5
					Else
						$xmax = (UBound($InstancesNames, $UBOUND_ROWS) - 1)
					EndIf
					For $x = 1 To 5
						GUICtrlSetData($InstanceName[$x], "Instance " & $x & " Name")
					Next
					For $x = 1 To $xmax
						GUICtrlSetData($InstanceName[$x], $InstancesNames[$x])
					Next
				Case "Droid4X"
					$InstancesNames = _FileListToArray("C:\Users\Romaric\AppData\Local\Droid4X\vms")
					If UBound($InstancesNames, $UBOUND_ROWS) >= 6 Then
						$xmax = 5
					Else
						$xmax = (UBound($InstancesNames, $UBOUND_ROWS) - 1)
					EndIf
					For $x = 1 To 5
						GUICtrlSetData($InstanceName[$x], "Instance " & $x & " Name")
					Next
					For $x = 1 To $xmax
						GUICtrlSetData($InstanceName[$x], $InstancesNames[$x])
					Next
				Case "Nox"
					$InstancesNames = _FileListToArray("C:\Users\Romaric\AppData\Roaming\Nox\bin\BignoxVMS")
					If UBound($InstancesNames, $UBOUND_ROWS) >= 6 Then
						$xmax = 5
					Else
						$xmax = (UBound($InstancesNames, $UBOUND_ROWS) - 1)
					EndIf
					For $x = 1 To 5
						GUICtrlSetData($InstanceName[$x], "Instance " & $x & " Name")
					Next
					For $x = 1 To $xmax
						GUICtrlSetData($InstanceName[$x], $InstancesNames[$x])
					Next
				Case "LeapDroid"
					$InstancesNames = _FileListToArray("C:\Users\" & @UserName & "\Documents\Leapdroid\VMs")
					If UBound($InstancesNames, $UBOUND_ROWS) >= 6 Then
						$xmax = 5
					Else
						$xmax = (UBound($InstancesNames, $UBOUND_ROWS) - 1)
					EndIf
					For $x = 1 To 5
						GUICtrlSetData($InstanceName[$x], "Instance " & $x & " Name")
					Next
					For $x = 1 To $xmax
						GUICtrlSetData($InstanceName[$x], $InstancesNames[$x])
					Next
			EndSwitch
		Case $OpenMultiMEmu
			$MEmuExists = FileExists("C:\Program Files\Microvirt\MEmu\MEmuConsole.exe")
			If $MEmuExists = 1 Then
				ShellExecute("C:\Program Files\Microvirt\MEmu\MEmuConsole.exe")
			Else
				MsgBox(16, "Error", "Warning, MEmu is not installed on this computer...")
			EndIf
		Case $OpenMultiDroid4X
			$Droid4XExists = FileExists("C:\Program Files (x86)\Droid4X\MultiMgr.exe")
			If $Droid4XExists = 1 Then
				ShellExecute("C:\Program Files (x86)\Droid4X\MultiMgr.exe")
			Else
				MsgBox(16, "Error", "Warning, Droid4X is not installed on this computer...")
			EndIf
		Case $OpenMultiNox
			$NoxExists = FileExists("C:\Users\" & @UserName & "\AppData\Roaming\Nox\bin\MultiPlayerManager.exe")
			If $NoxExists = 1 Then
				ShellExecute("C:\Users\" & @UserName & "\AppData\Roaming\Nox\bin\MultiPlayerManager.exe")
			Else
				MsgBox(16, "Error", "Warning, Nox is not installed on this computer...")
			EndIf
		Case $OpenMultiLeapDroid
			MsgBox(64, "Coming soon...", "No manager available for now for LeapDroid, we are waiting for DEVs news... For now, only instances names which exists are ""vm1"" and ""vm2""")
		Case $Launch[1]
			SetEmulator()
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[1]) & """" & " " & $EmulatorName & " " & """" & GUICtrlRead($InstanceName[1]) & """")
		Case $Launch[2]
			SetEmulator()
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[2]) & """" & " " & $EmulatorName & " " & """" & GUICtrlRead($InstanceName[2]) & """")
		Case $Launch[3]
			SetEmulator()
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[3]) & """" & " " & $EmulatorName & " " & """" & GUICtrlRead($InstanceName[3]) & """")
		Case $Launch[4]
			SetEmulator()
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[4]) & """" & " " & $EmulatorName & " " & """" & GUICtrlRead($InstanceName[4]) & """")
		Case $Launch[5]
			SetEmulator()
			ShellExecute(@ScriptDir & "\MyBot.run.exe", """" & GUICtrlRead($ProfileName[5]) & """" & " " & $EmulatorName & " " & """" & GUICtrlRead($InstanceName[5]) & """")
	EndSwitch
WEnd

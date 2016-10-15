#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , H ;if unstable, comment or remove this line
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

#SingleInstance Force #NoEnv
DetectHiddenWindows, On
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir% 

Start:
	{
	SetFormat, Float, 4.1
	IniRead, Kills, Scripts\DEPTH_KD.ini, GUI_Counter, Kills
	IniRead, Deaths, Scripts\DEPTH_KD.ini, GUI_Counter,Deaths
	IniRead, Kdr, Scripts\DEPTH_KD.ini, GUI_Counter,KDR
	CounterType := "Local"
	DeathDetect := 0
	IniWrite, %DeathDetect%, Scripts\DEPTH_KD.ini, ScriptComm, DeathDetect
	DeathClock := 0
	IniWrite, %DeathClock%, Scripts\DEPTH_KD.ini, ScriptComm, DeathClock
	DeathScreen := 0
	IniWrite, %DeathScreen%, Scripts\DEPTH_KD.ini, ScriptComm, Deathscreen
	AfterDeath := 0
	IniWrite, %AfterDeath%, Scripts\DEPTH_KD.ini, ScriptComm, AfterDeath
	KillDetect := 0
	IniWrite, %KillDetect%, Scripts\DEPTH_KD.ini, ScriptComm, KillDetect
	DoubleKill := 0
	IniWrite, %DoubleKill%, Scripts\DEPTH_KD.ini, ScriptComm, DoubleKill
	Suicide := 0
	IniWrite, %Suicide%, Scripts\DEPTH_KD.ini, ScriptComm, Suicide
	KillClock := 0
	IniWrite, %KillClock%, Scripts\DEPTH_KD.ini, ScriptComm, KillClock
	SetFormat, Float, 4.1	
	IniWrite, %DeathScreen%, Scripts\DEPTH_KD.ini, ScriptComm,DeathScreen
	Run, Scripts\DEPTH_KD_Counter.ahk,,hide
	Run, Scripts\Check_for_Deathscreen.ahk,, hide
	Run, Scripts\DeathClock.ahk,,hide
	Run, Scripts\KillClock.ahk, hide
	Run, Scripts\IfWinExist.ahk, hide
		ifExist, Scripts\itanimulli.ahk
		{
		Run, Scripts\itanimulli.ahk, hide
		}
	Run, Scripts\ScreenSize.ahk, hide
	ToggleFlag := 0
	FSize := SM_CXFULLSCREEN / 128
	FSize := Round (FSize, 0)
	Gui, -caption +AlwaysOnTop +LastFound +E0x20 +ToolWindow -DPIscale
	Gui, Color, 000000
	Gui, Font, s%FSize% bold, Lucida Console
	Gui, Add, Text, cRed,  Kills  =
	Gui, Add, Text, cPurple, Deaths =
	Gui, Add, Text, cSilver vStroke x0 y38, _______________
	Gui, Add, Text, cGreen x0 y60 w100, K/D    =
	Gui, Add, Text, cYellow vKiller x100 y0 w100 Left,%Kills%
	Gui, Add, Text, cYellow vTod x100 y25 w100 Left,%Deaths%
	Gui, Add, Text, cYellow vMyKd x100 y60 w100 Left,%Kdr% 
	Gui, Add, Text, cSilver vStroke_2 x0 y75, _______________
	Gui, Add, Text, cSilver vCounter x0 y95,%CounterType%
	Gui, Add, Text, cWhite, DeathScreen =
	Gui, Add, Text, cWhite vDS, %Deathscreen%
	Gui, Add, Text, cWhite, DeathDetect =	
	Gui, Add, Text, cWhite vDD, %DeathDetect%
	Gui, Add, Text, cWhite, KillDetect =	
	Gui, Add, Text, cWhite vKD, %KillDetect%
	Gui, Add, Text, cWhite, AfterDeath =
	Gui, Add, Text, cWhite vAD, %AfterDeath%
	Gui, Add, Text, cWhite, KillClock =
	Gui, Add, Text, cWhite vKC, %KillClock%
	Gui, Add, Text, cWhite, Suicide =	
	Gui, Add, Text, cWhite vSC, %Suicide%
	Gui, Add, Text, cWhite, DeathNumber =	
	Gui, Add, Text, cWhite vDN, %DeathNumber%
	Gui, Add, Text, cWhite, KillNumber =
	Gui, Add, Text, cWhite vKN, %KillNumber%
	Gui, Add, Text, cWhite, DoubleKill =
	Gui, Add, Text, cWhite vDK, %DoubleKill%	
	WinSet, TransColor, White
	WinSet, Transparent, 220
	goto, GUI_Refresh
	return
	}
	
	
Show_Hide_Gui:
{
	if (On_air_flag = TRUE)
	{
	Gui, Show, x0 y0 w170, COUNTER
	WinActivate, Depth Game
	}
	else if (On_air_flag = FALSE)
	{
	Gui, Hide
	}
	return
}

GUI_Refresh:
{
vBreaker := 0
while (vBreaker = 0)
{	
	if (ToggleFlag = False)
	{
	IniRead, Kills, Scripts\DEPTH_KD.ini, GUI_Counter, Kills
	IniRead, Deaths, Scripts\DEPTH_KD.ini, GUI_Counter,Deaths
	IniRead, Kdr, Scripts\DEPTH_KD.ini, GUI_Counter,KDR	
	IniRead, DeathScreen, Scripts\DEPTH_KD.ini, ScriptComm, DeathScreen 
	IniRead, DeathDetect, Scripts\DEPTH_KD.ini, ScriptComm, DeathDetect
	IniRead, KillDetect, Scripts\DEPTH_KD.ini, ScriptComm, KillDetect
	IniRead, AfterDeath, Scripts\DEPTH_KD.ini, ScriptComm, AfterDeath
	IniRead, KillClock, Scripts\DEPTH_KD.ini, ScriptComm, KillClock
	IniRead, Suicide, Scripts\DEPTH_KD.ini, ScriptComm, Suicide
	IniRead, DeathNumber, Scripts\DEPTH_KD.ini, ScriptComm, DeathNumber
	IniRead, KillNumber, Scripts\DEPTH_KD.ini, ScriptComm, KillNumber
	IniRead, DoubleKill, Scripts\DEPTH_KD.ini, ScriptComm, DoubleKill

	GuiControl,, Killer,%Kills%	 		
	GuiControl,, Tod,%Deaths%  
	GuiControl,, MyKd,%Kdr% 
	GuiControl,, Counter, %CounterType%
	GuiControl,, DS, %Deathscreen%
	GuiControl,, DD, %DeathDetect%
	GuiControl,, KD, %KillDetect%
	GuiControl,, AD, %AfterDeath%
	GuiControl,, KC, %KillClock%
	GuiControl,, SC, %Suicide%
	GuiControl,, DN, %DeathNumber%
	GuiControl,, KN, %KillNumber%
	GuiControl,, DK, %DoubleKill%
	GuiControl, move, MyKd, x100
	}
	else if (ToggleFlag = True)
	{
	IniRead, Kills, Scripts\Depth_KD_global.ini, GUI_Counter, Kills
	IniRead, Deaths, Scripts\Depth_KD_global.ini, GUI_Counter,Deaths
	IniRead, Kdr, Scripts\Depth_KD_global.ini, GUI_Counter,KDR
	GuiControl,, Killer,%Kills%	 		
	GuiControl,, Tod,%Deaths%  
	GuiControl,, MyKd,%Kdr% 
	GuiControl,, Counter, %CounterType%
	GuiControl, move, MyKd, x100
	}
	sleep, 100
}
}

	
NumPadAdd::
{
On_air_flag := TRUE
GuiControl,, MyKd,%Kdr%   
goto, Show_Hide_Gui
return
}


NumpadSub::
{
On_air_flag := FALSE
goto, Show_Hide_Gui
return
}


^DEL::
{
				vBreaker := 1
				Kdr := "N/A"
				IniWrite, 0, Scripts\DEPTH_KD.ini,GUI_Counter,Kills
				IniWrite, 0, Scripts\DEPTH_KD.ini,GUI_Counter,Deaths
				IniWrite, %Kdr%, Scripts\DEPTH_KD.ini,GUI_Counter,KDR
				KillClock := 0
				IniWrite, %KillClock%, Scripts\DEPTH_KD.ini, ScriptComm, KillClock
				GuiControl,, Killer,%Kills%	 		
				GuiControl,, Tod,%Deaths%   		
				GuiControl,, MyKd,%Kdr% 				
				GuiControl, move, MyKd, x100				
				vBreaker := 0
				return
}


Shift & Tab::
{
	if (ToggleFlag = False)
	{
	CounterType := "TOTAL"
	ToggleFlag := True
	}
	else if (ToggleFlag = True)
	{
	CounterType := "LOCAL"
	ToggleFlag := False
	}
}
return





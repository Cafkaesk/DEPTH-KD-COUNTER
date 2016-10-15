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

#NoEnv 
SendMode Input 
SetWorkingDir %A_ScriptDir%  
DetectHiddenWindows, On
#SingleInstance Force
#NoTrayIcon

Start:
SetFormat, Float, 4.1	
DeathDetect := 0
IniWrite, %DeathDetect%, DEPTH_KD.ini, ScriptComm, DeathDetect

DeathClock:
loop,
{
IniRead, DeathDetect, DEPTH_KD.ini, ScriptComm, DeathDetect
IniRead, AfterDeath, DEPTH_KD.ini, ScriptComm, AfterDeath

	if (DeathDetect = 1) AND (AfterDeath = 0)
	{ 
	IniRead, Deaths, DEPTH_KD.ini, GUI_Counter, Deaths	
	Deaths := Deaths + 1
	GlobalDeaths := Deaths
	IniWrite, %Deaths%, DEPTH_KD.ini,GUI_Counter,Deaths
	IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
	Kdr := KDR(Kills, Deaths)
	IniWrite, %Kdr%, DEPTH_KD.ini, GUI_Counter, KDR
	GlobalDeaths := Deaths
	IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
	Deaths := Deaths + 1
	IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
	Kills := Kills
	Kdr := KDR(Kills, Deaths)
	IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
	IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
	IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
	sleep, 6000
	KillClock := 0
	IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
	DeathDetect := 0
	IniWrite, %DeathDetect%, DEPTH_KD.ini, ScriptComm, DeathDetect
	}
sleep, 500
}
return

KDR(Kills,Deaths)
{
if (Kills = 0) OR (Deaths = 0)
	{
	Kdr := "N/A"
	}
	else
	{
	Kdr := Kills / Deaths
	}
return Kdr
}
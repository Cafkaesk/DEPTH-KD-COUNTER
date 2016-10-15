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
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
#SingleInstance Force
#NoTrayIcon


{
Start:
sleep 1000
SearchDeath := 0
SetFormat, Float, 4.1	
TimeReset:
		TimeA := 0
		TimeB := 99999999999


DeathScreenSearch:
loop,
{
sleep, 200
IniRead, DeathDetect, DEPTH_KD.ini, ScriptComm, DeathDetect
IniRead, Resolution, DEPTH_KD.ini, ScriptComm, Resolution
IniRead, Endscreen, DEPTH_KD.ini, ScriptComm, Endscreen
if (Resolution = 1)
{
IniRead, DXA, DEPTH_KD.ini, WindowSize, DXA
IniRead, DYA, DEPTH_KD.ini, WindowSize, DYA
IniRead, DXB, DEPTH_KD.ini, WindowSize, DXB
IniRead, DYB, DEPTH_KD.ini, WindowSize, DYB
}

if (DeathDetect = 1) AND (Endscreen = 0)
	{
	SearchDeath := 1
	
		while (SearchDeath = 1)
		{
		PixelSearch,,,419, 94, 437, 110, 0xf5f5f5,3,fast
		DeathScreen := ErrorLevel
		
			if (DeathScreen > 0)
			{
			TimeA := a_tickcount
			DeathScreen := 0
			IniWrite, %DeathScreen%, DEPTH_KD.ini,ScriptComm,DeathScreen
			}
			else if (DeathScreen = 0)
			{
			TimeB := a_tickcount
			DeathScreen := 1
			IniWrite, %DeathScreen%, DEPTH_KD.ini,ScriptComm,DeathScreen
			DeathScreenFlag := True
			} 
			if (TimeA > TimeB)
			{
			AfterDeath := 1
			IniWrite, %AfterDeath%, DEPTH_KD.ini, ScriptComm, AfterDeath
			sleep, 100
			AfterDeath := 0
			IniWrite, %AfterDeath%, DEPTH_KD.ini, ScriptComm, AfterDeath
			sleep, 500
			TimeA := 0
			TimeB := 99999999999
			SearchDeath := 0
			IniRead, Endscreen, DEPTH_KD.ini, ScriptComm, Endscreen
			}
		}
	}
}
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
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
SetFormat, Float, 4.1	
sleep, 1000
IniRead, EXA, DEPTH_KD.ini, WindowSize, EXA
IniRead, EYA, DEPTH_KD.ini, WindowSize, EYA
IniRead, EXB, DEPTH_KD.ini, WindowSize, EXB
IniRead, EYB, DEPTH_KD.ini, WindowSize, EYB

KillClock:
loop,
{
	IniRead, AfterDeath, DEPTH_KD.ini, ScriptComm, AfterDeath
	IniRead, DoubleKill, DEPTH_KD.ini, ScriptComm, DoubleKill
	IniRead, KillClock, DEPTH_KD.ini, ScriptComm, KillClock
	Total := AfterDeath + DoubleKill
	
	while (Total < KillClock)
	{
	IniRead, Resolution, DEPTH_KD.ini, WindowSize, Resolution
	
		if (Resolution = 1)
		{
		IniRead, EXA, DEPTH_KD.ini, WindowSize, EXA
		IniRead, EYA, DEPTH_KD.ini, WindowSize, EYA
		IniRead, EXB, DEPTH_KD.ini, WindowSize, EXB
		IniRead, EYB, DEPTH_KD.ini, WindowSize, EYB
		}

	IniRead, Suicide, DEPTH_KD.ini, ScriptComm, Suicide
	IniRead, DeathNumber, DEPTH_KD.ini, ScriptComm, DeathNumber
	IniRead, KillNumber, DEPTH_KD.ini, ScriptComm, KillNumber
	
		
EndscreenDetect:
		PixelSearch,,,%EXA%, %EYA%, %EXB%, %EYB%, 0xf7333f,3, Fast
		Endscreen := ErrorLevel
		
			if (Endscreen > 0)
			{
			Endscreen := 0
			IniWrite, %Endscreen%, DEPTH_KD.ini, Endscreen, Endscreen
			}
			else
			{
			Endscreen := 1
			IniWrite, %Endscreen%, DEPTH_KD.ini, Endscreen, Endscreen
			}
	
Conditions:
		if (KillNumber < 4)
		{	
			if (KillNumber = 3) AND (Suicide = 0) AND (DeathNumber = 4)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 1		
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
			IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
			IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
			Kills := Kills + 1
			Kdr := KDR(Kills, Deaths)
			IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
			IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
			IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			KillNumber := 4
			DeathNumber := 4
			Suicide := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
			IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
			IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide

			}
				
			else if (KillNumber = 3) AND (Suicide = 1) AND (DeathNumber = 3)
			{
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			KillNumber := 4
			DeathNumber := 4
			Suicide := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
			IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
			IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
			}
				
			else if (KillNumber = 2) AND (Suicide = 0) AND (DeathNumber = 4)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 2	
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			DoubleKill := 1
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 2
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			sleep, 8000	
			DoubleKill := 0
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			KillNumber := 4
			DeathNumber := 4
			Suicide := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
			IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
			IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
			}
				
			else if (KillNumber = 2) AND (Suicide = 1) AND (DeathNumber = 3)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 1
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 1
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
				KillClock := 0
				IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
				KillNumber := 4
				DeathNumber := 4
				Suicide := 0
				KillDetect := 0
				IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
				IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
				IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
				IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
			}
				
			else if (KillNumber = 1) AND (Suicide = 1) AND (DeathNumber = 3)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 2
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
			DoubleKill := 1
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 2
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR		
				KillClock := 0
				IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock				
			sleep, 8000
			DoubleKill := 0
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			KillNumber := 4
			DeathNumber := 4
			Suicide := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
			IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
			IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
			}
		}
			
		
		if (DeathNumber = 3) AND (KillNumber = 4)
		{
		KillClock := 0
		IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
		KillNumber := 4
		DeathNumber := 4
		Suicide := 0
		IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
		IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
		IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
		}
		KillClock := 0
		IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
		KillNumber := 4
		DeathNumber := 4
		Suicide := 0
		IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
		IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
		IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
		KillDetect := 0
		IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
		; IniRead, AfterDeath, DEPTH_KD.ini, ScriptComm, AfterDeath
		; IniRead, DoubleKill, DEPTH_KD.ini, ScriptComm, DoubleKill
		; Total := AfterDeath + DoubleKill	
		; if (KillNumber = 4) AND (Deathscreen = 1)
		
		
		if (Endscreen = 1)
		{
		IniRead, KillNumberEnd, DEPTH_KD.ini, Endscreen, DeathNumberEnd
		IniRead, DeathNumberEnd, DEPTH_KD.ini, Endscreen, DeathNumberEnd

ConditionsEnd:
		if (KillNumberEnd < 4)
		{	
			if (KillNumberEnd = 3) AND (SuicideEnd = 0) AND (DeathNumberEnd = 4)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 1		
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
			IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
			IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
			Kills := Kills + 1
			Kdr := KDR(Kills, Deaths)
			IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
			IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
			IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			KillNumberEnd := 4
			DeathNumberEnd := 4
			SuicideEnd := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
			IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
			IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd

			}
				
			else if (KillNumberEnd = 3) AND (SuicideEnd = 1) AND (DeathNumberEnd = 3)
			{
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			KillNumberEnd := 4
			DeathNumberEnd := 4
			SuicideEnd := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
			IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
			IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
			}
				
			else if (KillNumberEnd = 2) AND (SuicideEnd = 0) AND (DeathNumberEnd = 4)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 2	
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			DoubleKill := 1
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 2
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
			KillClock := 0
			IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
			sleep, 8000	
			DoubleKill := 0
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			KillNumberEnd := 4
			DeathNumberEnd := 4
			SuicideEnd := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
			IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
			IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
			}
				
			else if (KillNumberEnd = 2) AND (SuicideEnd = 1) AND (DeathNumberEnd = 3)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 1
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 1
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR
				KillClock := 0
				IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
				KillNumberEnd := 4
				DeathNumberEnd := 4
				SuicideEnd := 0
				KillDetect := 0
				IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
				IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
				IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
				IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
			}
				
			else if (KillNumberEnd = 1) AND (SuicideEnd = 1) AND (DeathNumberEnd = 3)
			{
			IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
			IniRead, Deaths, DEPTH_KD.ini, GUI_Counter,Deaths
			IniRead, Kdr, DEPTH_KD.ini, GUI_Counter,KDR
			Kills := Kills + 2
			IniWrite, %Kills%, DEPTH_KD.ini,GUI_Counter,Kills
			Kdr:= KDR(Kills,Deaths)
			IniWrite, %Kdr%, DEPTH_KD.ini,GUI_Counter,KDR
			DoubleKill := 1
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
				IniRead, Deaths, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniRead, Kills, DEPTH_KD_global.ini, GUI_Counter, Kills
				Kills := Kills + 2
				Kdr := KDR(Kills, Deaths)
				IniWrite, %Deaths%, DEPTH_KD_global.ini, GUI_Counter, Deaths
				IniWrite, %Kills%, DEPTH_KD_global.ini, GUI_Counter, Kills
				IniWrite, %Kdr%, DEPTH_KD_global.ini, GUI_Counter, KDR		
				KillClock := 0
				IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock				
			sleep, 8000
			DoubleKill := 0
			IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
			KillNumberEnd := 4
			DeathNumberEnd := 4
			SuicideEnd := 0
			KillDetect := 0
			IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
			IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
			IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
			IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
			}
		}
			
		
		if (DeathNumberEnd = 3) AND (KillNumberEnd = 4)
		{
		KillClock := 0
		IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
		KillNumberEnd := 4
		DeathNumberEnd := 4
		SuicideEnd := 0
		IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
		IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
		IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
		}
		
		KillClock := 0
		IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
		KillNumberEnd := 4
		DeathNumberEnd := 4
		SuicideEnd := 0
		IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
		IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
		IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
		KillDetect := 0
		IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
		; IniRead, AfterDeath, DEPTH_KD.ini, Endscreen, AfterDeath
		; IniRead, DoubleKill, DEPTH_KD.ini, Endscreen, DoubleKill
		; Total := AfterDeath + DoubleKill	
		; if (KillNumberEnd = 4) AND (Deathscreen = 1)		
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
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On
#SingleInstance Force
#NoTrayIcon

Start:
SetFormat, Float, 4.1	
KillAlpha := 0
FlagON := 1

KillLimiter
loop,
{
	IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
	KillsA := Kills
	sleep, 20
	IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
	KillsB := Kills		
	
	KillsDifference := KillsB-KillsA
	
		if (KillsDifference = 2)
		{
		DoubleKill := 1
		IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
		}
		
		if (KillsDifference = 1)
		{
			if (FlagON = 1)
			{
			TimeCutA := a_tickcount
			KillAlpha := KillAlpha + 1
			FlagON := 2
			goto, Jumper
			}
			
			if FlagON := 2
			{
			TimeCutB  := a_tickcount
			KillBeta := KillBeta + 1
			FlagON := 3
			goto, Jumper
			}
			
			if FlagON := 3
			{
			TimeCutC  := a_tickcount
			KillGamma := KillGamma + 1
			FlagON := 1
			goto, Jumper
			}
			
Jumper:
			if (KillAlpha > KillBeta AND KillAlpha > KillGamma)
				{
				AlphaLead := 1
				BetaLead := 0
				GammaLead := 0
				Distance := KillAlpha - KillGamma
					if (Distance = 2)
					{
					DoubleKill := 1
					IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
					}
					
					if (Distance = 1)
					{
					TimeCut := TimeCutA - TimeCutC
						
						if TimeCut < 8000
					}
				}
			if (KillBeta > KillAlpha AND KillBeta > KillGamma)
				{
				AlphaLead := 0
				BetaLead := 1
				GammaLead := 0
				Distance := KillBeta - KillAlpha
					if (Distance = 2)
					{
					DoubleKill := 1
					IniWrite, %DoubleKill%, DEPTH_KD.ini, ScriptComm, DoubleKill
					}
				}
			if (KillGamma > KillAlpha AND KillGamma > KillBeta)
				{
				AlphaLead := 0
				BetaLead := 0
				GammaLead := 1
				}

				
		}
	
	; IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
	; while (KillDetect = 0)
	; {
	; IniRead, KillDetect, DEPTH_KD.ini, ScriptComm, KillDetect
	; }

	; while (KillDetect = 1)
	; {
	; IniRead, KillDetect, DEPTH_KD.ini, ScriptComm, KillDetect
	; }

	; while (KillDetect = 0)
	; {
	; IniRead, KillDetect, DEPTH_KD.ini, ScriptComm, KillDetect
	; }
	
	; {
	; }
	; KillLimiter := 1
	; IniWrite, %KillLimiter%, DEPTH_KD.ini, ScriptComm, KillLimiter
	
	

sleep, 500
}
return

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
DetectHiddenWindows, On
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir% 
#SingleInstance Force
#NoTrayIcon
Detect:
SetFormat, Float, 4.1	
{
sleep, 1000
IniRead, GX1, DEPTH_KD.ini, WindowSize, GX1
IniRead, GY1, DEPTH_KD.ini, WindowSize, GY1
IniRead, GX2, DEPTH_KD.ini, WindowSize, GX2
IniRead, GY2, DEPTH_KD.ini, WindowSize, GY2
IniRead, KXAA, DEPTH_KD.ini, WindowSize, KXAA
IniRead, KXAB, DEPTH_KD.ini, WindowSize, KXAB
IniRead, SXG, DEPTH_KD.ini, WindowSize, SXG
IniRead, SYAA, DEPTH_KD.ini, WindowSize, SYAA
IniRead, SYAB, DEPTH_KD.ini, WindowSize, SYAB
IniRead, SYBA, DEPTH_KD.ini, WindowSize, SYBA
IniRead, SYBB, DEPTH_KD.ini, WindowSize, SYBB
IniRead, SYCA, DEPTH_KD.ini, WindowSize, SYCA
IniRead, SYCB, DEPTH_KD.ini, WindowSize, SYCB
IniRead, SYDA, DEPTH_KD.ini, WindowSize, SYDA
IniRead, SYDB, DEPTH_KD.ini, WindowSize, SYDB
DeathNumber := 4
StartJumper:
loop,
	{
	IniRead, DeathScreen, DEPTH_KD.ini, ScriptComm, DeathScreen
	IniRead, AfterDeath, DEPTH_KD.ini, ScriptComm, AfterDeath
	IniRead, DoubleKill, DEPTH_KD.ini, ScriptComm, DoubleKill
	IniRead, KillClock, DEPTH_KD.ini, ScriptComm, KillClock
	while (DeathScreen = 0) AND (DoubleKill = 0) AND (AfterDeath = 0) AND (KillClock = 0)
	{
	IniRead, Resolution, DEPTH_KD.ini, WindowSize, Resolution
	
		if (Resolution = 1)
		{
		IniRead, GX1, DEPTH_KD.ini, WindowSize, GX1
		IniRead, GY1, DEPTH_KD.ini, WindowSize, GY1
		IniRead, GX2, DEPTH_KD.ini, WindowSize, GX2
		IniRead, GY2, DEPTH_KD.ini, WindowSize, GY2
		IniRead, KXAA, DEPTH_KD.ini, WindowSize, KXAA
		IniRead, KXAB, DEPTH_KD.ini, WindowSize, KXAB
		IniRead, SXG, DEPTH_KD.ini, WindowSize, SXG
		IniRead, SYAA, DEPTH_KD.ini, WindowSize, SYAA
		IniRead, SYAB, DEPTH_KD.ini, WindowSize, SYAB
		IniRead, SYBA, DEPTH_KD.ini, WindowSize, SYBA
		IniRead, SYBB, DEPTH_KD.ini, WindowSize, SYBB
		IniRead, SYCA, DEPTH_KD.ini, WindowSize, SYCA
		IniRead, SYCB, DEPTH_KD.ini, WindowSize, SYCB
		IniRead, SYDA, DEPTH_KD.ini, WindowSize, SYDA
		IniRead, SYDB, DEPTH_KD.ini, WindowSize, SYDB
		}
		
GeneralDetect:	
		PixelSearch,,,%KXAB%, %GY1%, %GX2%, %GY2%, 0x33fD33,2, Fast
		GeneralDetect := ErrorLevel
		IniWrite, %GeneralDetect%, DEPTH_KD.ini, ScriptComm, GeneralDetect
		sleep, 500 ;minimum time to detect	
	
			if (GeneralDetect = 0)
			{
EndscreenKill:
			PixelSearch,,,%SXG%, %GY1%, %GX2%, %SYAB%, 0x33fD33,2, Fast
			DeathDetectEnd:= ErrorLevel
			sleep, 500
				if (DeathDetectEnd >= 1)
				{
				DeathDetectEnd := 0
				IniWrite, %DeathDetectEnd%, DEPTH_KD.ini, Endscreen, DeathDetectEnd
				}
				else
				{
				DeathDetectEnd := 1
				IniWrite, %DeathDetectEnd%, DEPTH_KD.ini, Endscreen, DeathDetectEnd	
					if (Endscreen = 1)
					{
					DeathDetect := 1
					IniWrite, %DeathDetect%, DEPTH_KD.ini, ScriptComm, DeathDetect
					}
				}
				
				if (DeathDetectEnd = 1)
				{				
				PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %GY2%, 0x33fD33,2, Fast
				KillDetectEnd:= ErrorLevel
					if (KillDetectEnd >= 1)
					{
					KillDetectEnd := 0
					IniWrite, %KillDetectEnd%, DEPTH_KD.ini, Endscreen, KillDetectEnd
					}
					else
					{
					KillDetectEnd := 1
					IniWrite, %KillDetectEnd%, DEPTH_KD.ini, Endscreen, KillDetectEnd
					}
					
DeathPosDetectEnd:
					PixelSearch,,,%SXG%, %SYAA%, %GX2%, %SYAB%, 0x33fD33,2, Fast
					SaveDeathA := ErrorLevel
					PixelSearch,,,%SXG%, %SYBA%, %GX2%, %SYBB%, 0x33fD33,2, Fast
					SaveDeathB := ErrorLevel			
					PixelSearch,,,%SXG%, %SYCA%, %GX2%, %SYCB%, 0x33fD33,2, Fast
					SaveDeathC := ErrorLevel		
					PixelSearch,,,%SXG%, %SYDA%, %GX2%, %SYDB%, 0x33fD33,2, Fast
					SaveDeathD := ErrorLevel
					DeathNumberEnd := SaveDeathA + SaveDeathB + SaveDeathC + SaveDeathD
					IniWrite, %DeathNumberEnd%, DEPTH_KD.ini, Endscreen, DeathNumberEnd
KillPosDetectEnd:
					PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %SYAB%, 0x33fD33,2, Fast
					SaveKillA := ErrorLevel
						if (SaveKillA >= 1)
						{
						SaveKillA := 1
						}
					PixelSearch,,,%KXAB%, %SYBA%, %KXAA%, %SYBB%, 0x33fD33,2, Fast
					SaveKillB := ErrorLevel		
						if (SaveKillB >= 1)
						{
						SaveKillB := 1
						}		
					PixelSearch,,,%KXAB%, %SYCA%, %KXAA%, %SYCB%, 0x33fD33,2, Fast
					SaveKillC := ErrorLevel		
						if (SaveKillC >= 1)
						{
						SaveKillC := 1
						}		
					PixelSearch,,,%KXAB%, %SYDA%, %KXAA%, %SYDB%, 0x33fD33,2, Fast
					SaveKillD := ErrorLevel
						if (SaveKillD >= 1)
						{
						SaveKillD := 1
						}
					KillNumberEnd := SaveKillA + SaveKillB + SaveKillC + SaveKillD	
					IniWrite, %KillNumberEnd%, DEPTH_KD.ini, Endscreen, KillNumberEnd
					
SuicideTestEnd:		
					SuicideTestA := SaveKillA + SaveDeathA
					SuicideTestB := SaveKillB + SaveDeathB
					SuicideTestC := SaveKillC + SaveDeathC
					SuicideTestD := SaveKillD + SaveDeathD
					
						if (SuicideTestA = 0 OR SuicideTestB = 0 OR SuicideTestC = 0 OR SuicideTestD = 0)
						{
						SuicideEnd := 1
						IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
						}
						
						else
						{
						SuicideEnd := 0
						IniWrite, %SuicideEnd%, DEPTH_KD.ini, Endscreen, SuicideEnd
						}	
						
OutputEnd:				
						if ((KillNumberEnd < 4 && DeathNumberEnd >=4) || (KillNumberEnd < 3 && DeathNumberEnd >= 3))
						{
						IniRead, Endscreen, DEPTH_KD.ini, Endscreen, Endscreen
								if (Endscreen = 1)
								{
								KillClock := 1
								IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
								IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
								}
								}		
								else
								{
								KillClock := 0
								IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
						}
					}
				
						
			sleep, 3100 ;DeathDelay vorher 3600, unter 1333x768 geänder, davor wiederum 3300
			
		
DeathDetect:
			PixelSearch,,,%SXG%, %GY1%, %GX2%, %SYAB%, 0x33fD33,2, Fast
			DeathDetect:= ErrorLevel
				if (DeathDetect >= 1)
				{
				DeathDetect := 0
				IniWrite, %DeathDetect%, DEPTH_KD.ini, ScriptComm, DeathDetect
				}
				else
				{
				DeathDetect := 1
				IniWrite, %DeathDetect%, DEPTH_KD.ini, ScriptComm, DeathDetect	
				}
				
				if (DeathDetect = 1)
				{				
				PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %GY2%, 0x33fD33,2, Fast
				KillDetect:= ErrorLevel
					if (KillDetect >= 1)
					{
					KillDetect := 0
					IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
					}
					else
					{
					KillDetect := 1
					IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
					}
					
DeathPosDetect:
					PixelSearch,,,%SXG%, %SYAA%, %GX2%, %SYAB%, 0x33fD33,2, Fast
					SaveDeathA := ErrorLevel
					PixelSearch,,,%SXG%, %SYBA%, %GX2%, %SYBB%, 0x33fD33,2, Fast
					SaveDeathB := ErrorLevel			
					PixelSearch,,,%SXG%, %SYCA%, %GX2%, %SYCB%, 0x33fD33,2, Fast
					SaveDeathC := ErrorLevel		
					PixelSearch,,,%SXG%, %SYDA%, %GX2%, %SYDB%, 0x33fD33,2, Fast
					SaveDeathD := ErrorLevel
					DeathNumber := SaveDeathA + SaveDeathB + SaveDeathC + SaveDeathD
					IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
KillPosDetect:
					PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %SYAB%, 0x33fD33,2, Fast
					SaveKillA := ErrorLevel
						if (SaveKillA >= 1)
						{
						SaveKillA := 1
						}
					PixelSearch,,,%KXAB%, %SYBA%, %KXAA%, %SYBB%, 0x33fD33,2, Fast
					SaveKillB := ErrorLevel		
						if (SaveKillB >= 1)
						{
						SaveKillB := 1
						}		
					PixelSearch,,,%KXAB%, %SYCA%, %KXAA%, %SYCB%, 0x33fD33,2, Fast
					SaveKillC := ErrorLevel		
						if (SaveKillC >= 1)
						{
						SaveKillC := 1
						}		
					PixelSearch,,,%KXAB%, %SYDA%, %KXAA%, %SYDB%, 0x33fD33,2, Fast
					SaveKillD := ErrorLevel
						if (SaveKillD >= 1)
						{
						SaveKillD := 1
						}
					KillNumber := SaveKillA + SaveKillB + SaveKillC + SaveKillD	
					IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
					
SuicideTest:		
					SuicideTestA := SaveKillA + SaveDeathA
					SuicideTestB := SaveKillB + SaveDeathB
					SuicideTestC := SaveKillC + SaveDeathC
					SuicideTestD := SaveKillD + SaveDeathD
					
						if (SuicideTestA = 0 OR SuicideTestB = 0 OR SuicideTestC = 0 OR SuicideTestD = 0)
						{
						Suicide := 1
						IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
						}
						
						else
						{
						Suicide := 0
						IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
						}	
						
Output:			
						if ((KillNumber < 4 && DeathNumber >=4) || (KillNumber < 3 && DeathNumber >= 3))
						{
						KillClock := 1
						IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
						}		
						else
						{
						KillClock := 0
						IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
						}
				}		
				else if (DeathDetect = 0)
				{
				sleep, 520 ;DeathDelay-KillDelay ;1220 ;20 + 300 +100 + 100
				PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %GY2%, 0x33fD33,2, Fast
				KillDetect:= ErrorLevel
					if (KillDetect >= 1)
					{
					KillDetect := 0
					IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
					}
					else
					{
					KillDetect := 1
					IniWrite, %KillDetect%, DEPTH_KD.ini, ScriptComm, KillDetect
					}
					
DeathPosDetectA:
					PixelSearch,,,%SXG%, %SYAA%, %GX2%, %SYAB%, 0x33fD33,2, Fast
					SaveDeathA := ErrorLevel
					PixelSearch,,,%SXG%, %SYBA%, %GX2%, %SYBB%, 0x33fD33,2, Fast
					SaveDeathB := ErrorLevel			
					PixelSearch,,,%SXG%, %SYCA%, %GX2%, %SYCB%, 0x33fD33,2, Fast
					SaveDeathC := ErrorLevel		
					PixelSearch,,,%SXG%, %SYDA%, %GX2%, %SYDB%, 0x33fD33,2, Fast
					SaveDeathD := ErrorLevel
					DeathNumber := SaveDeathA + SaveDeathB + SaveDeathC + SaveDeathD
					IniWrite, %DeathNumber%, DEPTH_KD.ini, ScriptComm, DeathNumber
KillPosDetectA:
					PixelSearch,,,%KXAB%, %SYAA%, %KXAA%, %SYAB%, 0x33fD33,2, Fast
					SaveKillA := ErrorLevel
						if (SaveKillA >= 1)
						{
						SaveKillA := 1
						}
					PixelSearch,,,%KXAB%, %SYBA%, %KXAA%, %SYBB%, 0x33fD33,2, Fast
					SaveKillB := ErrorLevel		
						if (SaveKillB >= 1)
						{
						SaveKillB := 1
						}		
					PixelSearch,,,%KXAB%, %SYCA%, %KXAA%, %SYCB%, 0x33fD33,2, Fast
					SaveKillC := ErrorLevel		
						if (SaveKillC >= 1)
						{
						SaveKillC := 1
						}		
					PixelSearch,,,%KXAB%, %SYDA%, %KXAA%, %SYDB%, 0x33fD33,2, Fast
					SaveKillD := ErrorLevel
						if (SaveKillD >= 1)
						{
						SaveKillD := 1
						}
					KillNumber := SaveKillA + SaveKillB + SaveKillC + SaveKillD	
					IniWrite, %KillNumber%, DEPTH_KD.ini, ScriptComm, KillNumber
					
SuicideTestA:		
					SuicideTestA := SaveKillA + SaveDeathA
					SuicideTestB := SaveKillB + SaveDeathB
					SuicideTestC := SaveKillC + SaveDeathC
					SuicideTestD := SaveKillD + SaveDeathD
					
						if (SuicideTestA = 0 OR SuicideTestB = 0 OR SuicideTestC = 0 OR SuicideTestD = 0)
						{
						Suicide := 1
						IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
						}
						
						else
						{
						Suicide := 0
						IniWrite, %Suicide%, DEPTH_KD.ini, ScriptComm, Suicide
						}	
						
OutputA:			
						if ((KillNumber < 4 && DeathNumber >=4) || (KillNumber < 3 && DeathNumber >= 3))
						{
						KillClock := 1
						IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
						}		
						else
						{
						KillClock := 0
						IniWrite, %KillClock%, DEPTH_KD.ini, ScriptComm, KillClock
						}
				}		
			}
	}				
}			
}	
return
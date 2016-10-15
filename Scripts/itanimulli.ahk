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

{
Illuminati := FALSE
X := 0
Y := 0
IniRead, Width, DEPTH_KD.ini, WindowSize, Width
IniRead, Height, DEPTH_KD.ini, WindowSize, Height
SetFormat, Float, 4.0
HeightY := Height - 135
WidthChange := Width + 150 
WidthLook := Width - 100
Pixar := (Width/2) - 85
RA := 1/64 * Width
TimeLapse := (Width - Pixar + 300 + Width + 300 + Width + 150)/RA
TexAA := Pixar - 200
TexBB := Pixar + 250


loop,
{
sleep, 1000
IniRead, Kills, DEPTH_KD.ini, GUI_Counter, Kills
	if (Kills = 23) AND (Illuminati = FALSE)
	{	
		Gui FIT: -caption +AlwaysOnTop +LastFound +E0x20 +ToolWindow -DPIscale
		Gui FIT: Font, s14 bold, Verdana
		Gui FIT: Add, Picture, y0 x0 h144 w150 vBild, 23.png
		TetA:= "23 Kills"
		Gui FIT: Add, Text, cRed vTetA x0 y0, `n`n`n`n`n%TetA%
		Gui FIT: Add, Text, cRed vTetB x0 y0,`n`n`n`n`n%TetA%
		Gui FIT: Color, 000000
		T := Pixar
		WinSet, TransColor, 000000
		GuiControl, FIT: Move, TetA, x%TexAA%
		GuiControl, FIT: Move, TetB, x%TexBB%
		GuiControl, FIT: Move, Bild, x%Pixar%
		Gui FIT: Show, x0 y%HeightY% h%Height% w%Width%
		WinActivate, Depth Game

		SoundPlay, 23.mp3
		sleep, 2000
		GuiControl FIT:, TetA,
		GuiControl FIT:, TetB,
		; Gui NEW: -caption +AlwaysOnTop +LastFound +E0x20 +ToolWindow -DPIscale
		; Gui NEW: Color, 000000
		; WinSet, TransColor, 000000
		; Gui NEW: Add, Text, cRed vTEST x0 y0, 23 KILLS
		; Gui NEW: Show, x0 y%HeightY% h%Height% w%Width%
		; WinActivate, Depth Game
		
			while (Illuminati = FALSE)
			{
			T:= T + RA
			; Random, POSIX, 0, 1600
			; Random, POSIY, 0, 1020
			; Random, TOOT, 0, 100000
			; GuiControl, NEW: Move, TEST, x%POSIX% y%POSIY%
			
			if (T > WidthChange)
			{
			T := -150
			}
			GuiControl, FIT: Move, Bild, x%T%
			X:= X + 1
			sleep, 30
				if (X >= TimeLapse)
				{	
					T := Width + 150
					GuiControl, FIT: Move, Bild, x%T%
					
					while (Illuminati = FALSE)
					{
					GuiControl, FIT: Move, Bild, x%T%
					T := T - 1
					Y := Y + 1
					sleep, 25
						if (T < WidthLook) 
						{
						sleep, 1000
							while (Illuminati = FALSE)
							{
							T := T + 5
							Y := Y - 1
							GuiControl, FIT: Move, Bild, x%T%
							sleep, 35
								if (Y = 0)
								{
								GuiControl, FIT: hide, Bild
								Illuminati := TRUE
								}
							}
						}
					}
				}
			}
	}
}
}
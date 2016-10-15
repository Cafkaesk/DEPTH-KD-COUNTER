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
WinGetPos,,, Width,Height, Depth Game
IniWrite, %Width%, DEPTH_KD.ini, WindowSize, Width
IniWrite, %Height%, DEPTH_KD.ini, WindowSize, Height
ResolutionA := Width / Height

NewResolution:
SixteenNine := 16 / 9
SixteenTen := 16 / 10
WeirdLaptop := 1366 / 768
FiveFour := 5/4
FourThree := 4/3

if (ResolutionA = SixteenNine)
{
GXA := 1575/1920 	;left corner of notification area
GXB := 1900/1920 	;right corner of notification area
GYA := 20/1080 		;top position of 1st notification and notification area
GYB := 123/1080 	;bottom position of 4th notification
KXA := 1812/1920 	;KillDetectArea right border 
KXB := 1409/1920 	;KillDetectArea left border

SXGA := 1874/1920 	;DeathDetectArea left border
SYABV := 49/1080 	;bottom position of 1st notification
SYBAV := 50/1080 	;top position of 2nd notification
SYBBV := 76/1080 	;bottom position of 2nd notification
SYCAV := 80/1080 	;top position of 3rd notification
SYCBV := 105/1080 	;bottom position of 3rd notification
SYDAV := 106/1080 	;top position of 4th notification
SYDBV := 130/1080 	;bottom position of 4th notification

EXAV := 874/1920	;left corner of endscreen area
EYAV := 886/1080	;top position of endscreen area
EXBV := 891/1920	;right corner of endscreen area
EYBV :=  909/1080	;bottom position of endscreen area

DXAV := 419/1920	;left corner of deathscreen area
DYAV := 94/1080		;top position of deathscreen area
DXBV := 437/1920	;right corner of deathscreen area
DYBV := 110/1080	;bottom position of deathscreen area
}

if (ResolutionA = SixteenTen)
{
GXA := 1350/1680 	;left corner of notification area
GYA := 22/1050 		;top position of 1st notification and notification area
GXB := 1662/1680 	;right corner of notification area
GYB := 121/1050 	;bottom position of 4th notification
KXA := 1550/1680 	;KillDetectArea right border 
KXB := 1240/1680 	;KillDetectArea left border

SXGA := 1628/1680 	;DeathDetectArea left border
SYABV := 43/1050 	;bottom position of 1st notification
SYBAV := 44/1050 	;top position of 2nd notification
SYBBV := 74/1050 	;bottom position of 2nd notification
SYCAV := 75/1050 	;top position of 3rd notification
SYCBV := 102/1050 	;bottom position of 3rd notification
SYDAV := 103/1050 	;top position of 4th notification
SYDBV := 120/1050 	;bottom position of 4th notification

EXAV := 759/1680	;left corner of endscreen area
EYAV := 866/1050	;top position of endscreen area
EXBV := 891/1680	;right corner of endscreen area
EYBV :=  897/1050	;bottom position of endscreen area

DXAV := 401/1680	;left corner of deathscreen area
DYAV := 94/1050		;top position of deathscreen area
DXBV := 420/1680	;right corner of deathscreen area
DYBV := 112/1050	;bottom position of deathscreen area
}

if (ResolutionA = WeirdLaptop)
{
GXA := 1018/1366 	;left corner of notification area
GYA := 16/768 		;top position of 1st notification and notification area
GXB := 1352/1366 	;right corner of notification area
GYB := 90/768	 	;bottom position of 4th notification
KXA := 1301/1366 	;KillDetectArea right border 
KXB := 1002/1366 	;KillDetectArea left border

SXGA := 1333/1366 	;DeathDetectArea left border
SYABV := 34/768 	;bottom position of 1st notification
SYBAV := 35/768 	;top position of 2nd notification
SYBBV := 55/768 	;bottom position of 2nd notification
SYCAV := 56/768 	;top position of 3rd notification
SYCBV := 77/768 	;bottom position of 3rd notification
SYDAV := 78/768 	;top position of 4th notification
SYDBV := 90/768 	;bottom position of 4th notification

EXAV := 623/1366	;left corner of endscreen area
EYAV := 634/768		;top position of endscreen area
EXBV := 632/1366	;right corner of endscreen area
EYBV := 642/768		;bottom position of endscreen area

DXAV := 297/1366	;left corner of deathscreen area
DYAV := 66/768		;top position of deathscreen area
DXBV := 310/1366	;right corner of deathscreen area
DYBV := 78/768		;bottom position of deathscreen area
}

if (ResolutionA = FiveFour)
{
GXA := 864/1280 	;left corner of notification area
GYA := 21/1024 		;top position of 1st notification and notification area
GXB := 1261/1280 	;right corner of notification area
GYB := 119/1024	 	;bottom position of 4th notification
KXA := 1207/1280 	;KillDetectArea right border 
KXB := 865/1280 	;KillDetectArea left border

SXGA := 1235/1280 	;DeathDetectArea left border
SYABV := 44/1024 	;bottom position of 1st notification
SYBAV := 45/1024 	;top position of 2nd notification
SYBBV := 73/1024 	;bottom position of 2nd notification
SYCAV := 74/1024 	;top position of 3rd notification
SYCBV := 99/1024 	;bottom position of 3rd notification
SYDAV := 100/1024 	;top position of 4th notification
SYDBV := 113/1024 	;bottom position of 4th notification

EXAV := 567/1280	;left corner of endscreen area
EYAV := 784/1024		;top position of endscreen area
EXBV := 576/1280	;right corner of endscreen area
EYBV := 795/1024		;bottom position of endscreen area

DXAV := 373/1280	;left corner of deathscreen area
DYAV := 90/1024		;top position of deathscreen area
DXBV := 393/1280	;right corner of deathscreen area
DYBV := 107/1024	;bottom position of deathscreen area
}

if (ResolutionA = FourThree)
{
GXA := 706/1024 	;left corner of notification area
GYA := 14/768 		;top position of 1st notification and notification area
GXB := 1011/1024 	;right corner of notification area
GYB := 89/768	 	;bottom position of 4th notification
KXA := 971/1024 	;KillDetectArea right border 
KXB := 694/1024 	;KillDetectArea left border

SXGA := 990/1024 	;DeathDetectArea left border
SYABV := 33/768 	;bottom position of 1st notification
SYBAV := 34/768 	;top position of 2nd notification
SYBBV := 53/768 	;bottom position of 2nd notification
SYCAV := 54/768 	;top position of 3rd notification
SYCBV := 75/768 	;bottom position of 3rd notification
SYDAV := 76/768 	;top position of 4th notification
SYDBV := 87/768 	;bottom position of 4th notification

EXAV := 453/1024	;left corner of endscreen area
EYAV := 627/768		;top position of endscreen area
EXBV := 462/1024	;right corner of endscreen area
EYBV := 636/768		;bottom position of endscreen area

DXAV := 281/1024	;left corner of deathscreen area
DYAV := 67/768		;top position of deathscreen area
DXBV := 296/1024	;right corner of deathscreen area
DYBV := 81/768		;bottom position of deathscreen area
}

loop,
{
WinGetPos,,, Width,Height, Depth Game
IniWrite, %Width%, DEPTH_KD.ini, WindowSize, Width
IniWrite, %Height%, DEPTH_KD.ini, WindowSize, Height
ResolutionB := Width / Height

GeneralDetect:
GX1 := GXA * Width
GY1 := GYA * Height
GX2 := GXB * Width
GY2 := GYB * Height

KillDetect:
KXAA := KXA * Width
KXAB := KXB * Width

SaveDeath:
SXG := SXGA * Width
SYAA := GY1
SYAB := SYABV * Height
SYBA := SYBAV * Height
SYBB := SYBBV * Height
SYCA := SYCAV * Height
SYCB := SYCBV * Height
SYDA := SYDAV * Height
SYDB := SYDBV * Height

EndScreenDetect:
EXA := EXAV * Width
EYA := EYAV * Height
EXB := EXBV * Width
EYB := EYBV * Height 

DeathSreen:
DXA := DXAV * Width
DYA := DYAV * Height
DXB := DXBV * Width
DYB := DYBV * Height

IniWrite, %GX1%, DEPTH_KD.ini, WindowSize, GX1
IniWrite, %GY1%, DEPTH_KD.ini, WindowSize, GY1
IniWrite, %GX2%, DEPTH_KD.ini, WindowSize, GX2
IniWrite, %GY2%, DEPTH_KD.ini, WindowSize, GY2

IniWrite, %KXAA%, DEPTH_KD.ini, WindowSize, KXAA
IniWrite, %KXAB%, DEPTH_KD.ini, WindowSize, KXAB

IniWrite, %SXG%, DEPTH_KD.ini, WindowSize, SXG
IniWrite, %SYAA%, DEPTH_KD.ini, WindowSize, SYAA
IniWrite, %SYAB%, DEPTH_KD.ini, WindowSize, SYAB
IniWrite, %SYBA%, DEPTH_KD.ini, WindowSize, SYBA
IniWrite, %SYBB%, DEPTH_KD.ini, WindowSize, SYBB
IniWrite, %SYCA%, DEPTH_KD.ini, WindowSize, SYCA
IniWrite, %SYCB%, DEPTH_KD.ini, WindowSize, SYCB
IniWrite, %SYDA%, DEPTH_KD.ini, WindowSize, SYDA
IniWrite, %SYDB%, DEPTH_KD.ini, WindowSize, SYDB

IniWrite, %EXA%, DEPTH_KD.ini, WindowSize, EXA
IniWrite, %EYA%, DEPTH_KD.ini, WindowSize, EYA
IniWrite, %EXB%, DEPTH_KD.ini, WindowSize, EXB
IniWrite, %EYB%, DEPTH_KD.ini, WindowSize, EYB

IniWrite, %DXA%, DEPTH_KD.ini, WindowSize, DXA
IniWrite, %DYA%, DEPTH_KD.ini, WindowSize, DYA
IniWrite, %DXB%, DEPTH_KD.ini, WindowSize, DXB
IniWrite, %DYB%, DEPTH_KD.ini, WindowSize, DYB

sleep, 5000
Resolution := 0
IniWrite, %Resolution%, DEPTH_KD.ini, WindowSize, Resolution

	while (ResolutionB = ResolutionA)
		{
		WinGetPos,,, Width,Height, Depth Game
		ResolutionB := Width / Height
		sleep, 1000
		}
IniWrite, %Width%, DEPTH_KD.ini, WindowSize, Width
IniWrite, %Height%, DEPTH_KD.ini, WindowSize, Height
Resolution := 1
IniWrite, %Resolution%, DEPTH_KD.ini, WindowSize, Resolution
goto, NewResolution
}
}
return
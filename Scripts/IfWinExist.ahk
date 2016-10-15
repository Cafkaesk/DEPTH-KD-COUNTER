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
loop,
{
sleep, 1000
IfWinNotExist, Depth KDR Counter
	{
	WinClose, DeathClock
	WinClose, KillClock
	WinClose, Check
	WinClose, itanimulli
	WinClose, ScreenSize
	WinClose, Depth_KD_Counter,,,DEPTH-KDR-COUNTER
	Exit
	}
}
}
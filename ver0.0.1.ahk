#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
SetBatchLines -1

#Include func.ahk
#Include Classes.ahk

FileSelectFolder, WhichFolder  ; Ask the user to pick a folder.
if(ErrorLevel){
	MsgBox, Error occured
	ExitApp
}
SplashTextOn,500,30,processing...,on directory `"%WhichFolder%`"
IfExist, %A_WorkingDir%\result.txt
	FileDelete, %A_WorkingDir%\result.txt










SplashTextOff
MsgBox, Done

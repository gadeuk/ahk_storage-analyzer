/*
파일 속성에 따른 분석 구분 (숨김, 읽기 전용, 시스템 파일)

서브 폴더 구성
트리뷰 구성
프로그래스 바

분석 프로그램 기본 구조
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
SetBatchLines -1

#Include func.ahk

FileSelectFolder, WhichFolder  ; Ask the user to pick a folder.
if(ErrorLevel){
	MsgBox, Error occured
	ExitApp
}
SplashTextOn,500,30,processing...,on directory `"%WhichFolder%`"
IfExist, %A_WorkingDir%\result.txt
	FileDelete, %A_WorkingDir%\result.txt
s .= "directory : " WhichFolder "`n`n"
/*
Create the array that contains file name and size as elements
*/
total = 0
Arr := [[]]
Loop, %WhichFolder%\*.*,1
{
	Arr[A_Index,1] := A_LoopFileName
	Arr[A_Index,2] := GetSize(A_LoopFileFullPath)
	total += Arr[A_Index, 2]
}


/*
Sort the elements of array with descending order
*/
length := Arr.Length()
temp := []
Loop %Length%
{
	i := A_Index
	count := length - i
	Loop %count%
	{
		j := i + A_Index
		if (Arr[i][2] < Arr[j][2])
		{
			temp := Arr[i]
			Arr[i] := Arr[j]
			Arr[j] := temp
		}
	}
}


/*
print as txt file
*/
SetArr := []
Loop %length%
{
	SetArr := SetSize(Arr[A_Index,2])
	name := Arr[A_Index, 1]
	size := SetArr[1]
	unit := SetArr[2]
	s .= name " : " size " " unit "`n"
}
SetArr := SetSize(total)
SplashTextOff
s .= "`n`ntotal size : " SetArr[1] " " SetArr[2]

FileAppend, %s%, %A_WorkingDir%\result.txt
run, %A_Workingdir%\result.txt
free()
ExitApp

^z::
free()
ExitApp

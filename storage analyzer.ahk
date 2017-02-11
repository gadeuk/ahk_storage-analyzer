/*
파일 속성에 따른 분석 구분 (숨김, 읽기 전용, 시스템 파일)
트리뷰 구성
프로그래스 바
보안 인증 및 암호화

분석 프로그램 기본 구조
	시각화(도식화)
    
    재귀
*/

#SingleInstance Force
#NoTrayIcon
version = 0.0
Menu, HelpMenu, Add, &Help, Help
Menu, HelpMenu, Add
Menu, HelpMenu, Add, &About, About
Menu, MenuBar, Add, &Menu, :HelpMenu

Gui, Menu, MenuBar
Gui, Margin, -2, 2
Gui, Add, GroupBox, x12 y9 w360 h80 , Search Folder
Gui, Add, Edit, x22 y29 w340 h20 +ReadOnly vdir,
Gui, Add, Button, x232 y59 w60 h20 gload, load
Gui, Add, Button, x302 y59 w60 h20 gstart, start
Gui, Add, GroupBox, x12 y99 w360 h60 , Process
Gui, Add, Text, x22 y119 w330 h20 , current file
Gui, Add, Progress, x22 y139 w330 h10 , 100
Gui, Add, Text, x1 y169 w384 h2 +0x1006, 
Gui, Add, Link, x10 y172 w200 h15 +Left, <a href="http://korea.ac.kr/">Help</a>
Gui, Show,, storage analyzer %version%
Return

load:
FileSelectFolder, WhichFolder
GuiControl,, dir, %WhichFolder%
return

start:
MsgBox, 16, ???, under construction
return

Help:
MsgBox, 옵션 설명`nGUI로 구현
return

About:
MsgBox, 64, About,
(
Storage Analyzer

Version:
   <%version%>

Made By:
   ???
)
return

GuiClose:
ExitApp
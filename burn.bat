@echo off

rem positioning
set TOP_LEFT='10:10'
set TOP_RIGHT='main_w-overlay_w-10:10'
set BUTTOM_LEFT='10:main_h-overlay_h-10'
set BUTTOM_RIGHT='main_w-overlay_w-10:main_h-overlay_h-10'

set Logo="E:\Pictures\Logo.ico"
set video=%1
set ass=%~n2%~x2
set output=%3
set pos=%TOP_LEFT%

title burn ass and logo into video

rem help manual
if [%1]==[] (
	echo Usage: burn.bat {video} {ass} {output}
	echo The logo file is hard coded as "E:\Pictures\Logo.ico",
	echo if you want to change it, edit bat file manually.
	echo The position of logo is top left corner, again, if you
	echo want to change if, edit bat file manually.
	exit
)

:burn
ffmpeg.exe -i %video% -i %Logo% -filter_complex "[1]scale=200:200[logo];[0][logo]overlay=%pos%[taged];[taged]ass='%ass%'[sub]" -map [sub] -map 0:a %output%
exit

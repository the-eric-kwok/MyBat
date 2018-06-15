@echo off

if [%1]==[] (
	echo Usage: merge_av.bat {video} {audio} {output}
	exit
)

set video=%1
set audio=%2
set output=%3

:merge
ffmpeg -i %video% -i %audio% -c:v copy %output%
exit

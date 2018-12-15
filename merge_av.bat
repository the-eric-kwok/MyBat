@echo off

if [%1]==[] (
	echo Usage: merge_av.bat {video} {audio}
	exit
)

set video=%1
set audio=%2
set output=out.mp4

:merge
ffmpeg -i %video% -i %audio% -c:v copy -c:a copy %output%
exit

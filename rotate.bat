@echo off

title rotate video
set input=%1
set switch=%2
set output=%~n1.rot.mp4

if [%1]==[] (
	goto help
)

if [%switch%] == [clock] or if [%switch%] == [clockwise] (
	goto clockwise
	exit
) else if [%switch%] == [counter] or if [%switch%] == [counterclockwise] (
	goto counterclockwise
	exit
) else goto help

:help
rem help manual

echo;
echo Usage: rotate.bat {video} {clock/counter}
echo;
echo Use switch clock to rotate video clockwise for 90 degress, 
echo counter switch to rotate it counterclockwise for 90 degress
echo;
exit

:clockwise
ffmpeg -i %input% -vf "transpose=1" %output%
exit

:counterclockwise
ffmpeg -i %input% -vf "transpose=2" %output%
exit
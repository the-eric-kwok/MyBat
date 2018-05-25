@echo off

set video=%1
set audio=%2
set output=%3

if exist %output% (
	choice /N /M "文件已存在，是否继续？  是（Y）否（N）"
	if errorlevel 2 (
		echo 操作终止！
		goto end
	)
	if errorlevel 1 goto merge
)

:merge
ffmpeg -i %video% -i %audio% -c:v copy -y %output%

:end
exit

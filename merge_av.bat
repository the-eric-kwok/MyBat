@echo off

set video=%1
set audio=%2
set output=%3

if exist %output% (
	choice /N /M "�ļ��Ѵ��ڣ��Ƿ������  �ǣ�Y����N��"
	if errorlevel 2 (
		echo ������ֹ��
		goto end
	)
	if errorlevel 1 goto merge
)

:merge
ffmpeg -i %video% -i %audio% -c:v copy -y %output%

:end
exit

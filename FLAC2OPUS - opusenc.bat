@echo off
call :treeProcess
goto :eof

:treeProcess
for %%f in (*.flac); do opusenc --music --bitrate 192 "%%f" "%%~nf.ogg" && del /f "%%f"
for /D %%d in (*) do (
	cd %%d
	call :treeProcess
	cd ..
)

exit /b
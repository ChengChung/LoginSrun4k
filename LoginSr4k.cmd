@echo off

SET /A retry=0
SET /A max_retry=10
SET /A http_status=000

set username=XXXXX
set password={B}XXXXXX

:check_network
for /f %%i in ('curl -s -o nul -m 2 -w %%{http_code} http://portal.joshu.moe/generate_204') do set http_status=%%i
echo http status is %http_status%
IF %http_status% NEQ 204 GOTO connect_network
goto:eof

:connect_network
if %retry% LSS %max_retry% (	
	SET /A retry+=1
	curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.9 Safari/537.36" -d "action=login&username=%username%&password=%password%&ac_id=1&ajax=1&nas_ip=&user_ip=&user_mac=&save_me=1" "https://gw.buaa.edu.cn:801/include/auth_action.php" -k
	echo.
	echo %time%
	TIMEOUT 2 > nul
	GOTO check_network
)
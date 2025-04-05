@echo off
title A7X
color 0A

set "PC_NAME=%USERNAME%%"

:MENU
cls
echo.          
echo.          
echo.          
echo       .d$$$******$$$$c.        
echo    .d$P"            "$$c      
echo   $$$$$.           .$$$*$.                   [1] Limpar arquivos temporarios
echo .$$ 4$L*$$.     .$$Pd$  '$b                  [2] Ativar modo de alto desempenho
echo $F   *$. "$$e.e$$" 4$F   ^$b                  [3] Desativar efeitos visuais
echo d$     $$   z$$$e   $$     '$.               [4] Encerrar processos desnecessarios
echo $P     `$L$$P` `"$$d$"      $$               [5] Limpar cache DNS
echo $$     e$$F       4$$b.     $$               [6] Desfragmentar disco (HD)
echo $b  .$$" $$      .$$ "4$b.  $$               [7] Modo Turbo (fazer tudo)
echo $$e$P"    $b     d$`    "$$c$F               [0] Sair
echo '$P$$$$$$$$$$$$$$$$$$$$$$$$$$  
echo  "$c.      4$.  $$       .$$   
echo   ^$$.      $$ d$"      d$P    
echo     "$$c.   `$b$F    .d$P"     
echo       `4$$$c.$$$..e$$P"        
echo           `^^^^^^^`
echo.
echo       A7X - %PC_NAME%
echo.
set /p op=Select: 

if "%op%"=="1" goto TEMP
if "%op%"=="2" goto POWER
if "%op%"=="3" goto VISUAL
if "%op%"=="4" goto TASKS
if "%op%"=="5" goto DNS
if "%op%"=="6" goto DEFRAG
if "%op%"=="7" goto TURBO
if "%op%"=="0" exit
goto MENU

:TEMP
cls
echo Limpando arquivos temporarios...
del /s /f /q %temp%\* >nul
del /s /f /q C:\Windows\Temp\* >nul
rd /s /q %temp% >nul
md %temp% >nul
echo Concluido!
pause
goto MENU

:POWER
cls
echo Ativando modo de alto desempenho...
powercfg -setactive SCHEME_MIN
echo Concluido!
pause
goto MENU

:VISUAL
cls
echo Desativando efeitos visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
echo Concluido!
pause
goto MENU

:TASKS
cls
echo Encerrando processos desnecessarios...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im SkypeApp.exe >nul 2>&1
taskkill /f /im Teams.exe >nul 2>&1
taskkill /f /im Cortana.exe >nul 2>&1
echo Concluido!
pause
goto MENU

:DNS
cls
echo Limpando cache DNS...
ipconfig /flushdns
echo Concluido!
pause
goto MENU

:DEFRAG
cls
echo Desfragmentando disco C:...
defrag C: /O
echo Concluido!
pause
goto MENU

:TURBO
cls
echo === MODO TURBO ATIVADO ===
call :TEMP
call :POWER
call :VISUAL
call :TASKS
call :DNS
echo Tudo feito, Hax. Seu PC ta voando agora 🚀
pause
goto MENU

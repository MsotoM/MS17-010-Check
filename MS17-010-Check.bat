@echo off
setlocal enabledelayedexpansion
set patch_list='KB4012598','KB4012212','KB4015549','KB4012215','KB4012213','KB4012216','KB4012214','KB4012217','KB4012216','KB4012606','KB4013198','KB4013429'
::source: https://support.microsoft.com/en-us/help/4013389/title

echo Lectura de la lista de parches instalada...
set patch_found=false
echo Procesando lista de parches instalados...
for /f %%k in ('wmic qfe get hotfixid') do (
  echo %patch_list% | findstr /C:"'%%k'" >nul
  if errorlevel 1 (
    rem
  ) else (
    echo Actualizacion MS17-010 encontrado: '%%k'. El sistema esta protegido.
    set patch_found=true
	pause
	exit
	)
)
if not "%patch_found%"=="true" echo Actualizacion MS17-010 NO encontrada. Sistem no esta protegido!
echo Contacte a soporte llamando 240780
echo enviando los siguientes datos:
echo Nombre de usuario: %USERNAME%
echo IP del usuario: 
ipconfig | findstr /i "ipv4"

set patch_list=
set patch_found=
pause

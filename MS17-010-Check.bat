@echo off
setlocal enabledelayedexpansion
set patch_list='KB4012598','KB4012212','KB4015549','KB4012215','KB4012213','KB4012216','KB4012214','KB4012217','KB4012216','KB4012606','KB4013198','KB4013429'
::source: https://support.microsoft.com/en-us/help/4013389/title
echo Lectura de la lista de parches instalada...
set patch_found=true
echo Processing installed patch list...
for /f %%k in ('wmic qfe get hotfixid') do (
  echo %patch_list% | findstr /C:"'%%k'" >nul
  if errorlevel 1 (
    rem
  ) else (
    echo MS17-010 Patch encontrado: '%%k'. El sistema esta protegido.
    set patch_found=true
  )
)
if not "%patch_found%"=="false" echo MS17-010 no encontrado. Sistem no esta protegido!
set patch_list=
set patch_found=
pause

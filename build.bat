@echo off

echo Building Vivado projeect from TCL file
echo ----------------------------------------

set VivadoPath="C:\Xilinx\Vivado\2018.2\bin\vivado.bat"
:: chcek if vivado path is valid
if not exist %VivadoPath% (
    echo Vivado path is not valid
    exit /b 1
)

set TCL="build.tcl"
:: check if TCL file is valid
if not exist %TCL% (
    echo TCL file is not valid
    exit /b 1
)

:: run vivado in batch mode to build project
call %VivadoPath% -mode batch -source %TCL%

echo ----------------------------------------

:: wait for a keypress
PAUSE

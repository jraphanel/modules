@echo off

:: define Modules-specific environment variables
for %%i in ("%~dp0..") do set "MODULESHOME=%%~dpni"
set "MODULES_CMD=%MODULESHOME%\libexec\modulecmd.tcl"

:: ensure module.cmd batch file can be found in PATH
for %%i in (module.cmd) do (
   if "x%%~$PATH:i" EQU "x" (
      set "PATH=%MODULESHOME%\bin;%PATH%"
   )
)

:: define module command and surrounding initial environment (default value
:: for MODULESHOME, MODULEPATH, LOADEDMODULES and parse of init config files)
call module autoinit
:: enable a default modulepath directory
call module use "%MODULESHOME%\modulefiles"

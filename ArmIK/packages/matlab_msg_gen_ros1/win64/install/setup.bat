@echo off
REM generated from catkin/cmake/template/setup.bat.in

REM Sets various environment variables and sources additional environment hooks.
REM It tries it's best to undo changes from a previously sourced setup file before.
REM Supported command line options:
REM --extend: skips the undoing of changes from a previously sourced setup file
REM --local: only considers this workspace but not the chained ones

set _SETUP_UTIL=C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/install/_setup_util.py

if NOT EXIST "%_SETUP_UTIL%" (
  echo "Missing Python script: %_SETUP_UTIL%"
  exit 22
)

REM set the Python executable
set _PYTHON="C:/Users/trbin/AppData/Roaming/MathWorks/MATLAB/R2021b/ros1/win64/venv/Scripts/python2.exe"

REM compute Python home and normalize Python executable path
if NOT "%PYTHON_VENV_PATH%" == "" (
    goto GenerateTempFilename
)

set PYTHONHOME=
set _PYTHONEXE=
for /f "usebackq tokens=*" %%a in ('%_PYTHON%') do (
  set PYTHONHOME=%%~dpa
  set _PYTHONEXE=%%~nxa
  set _PYTHON="%%~dpa%%~nxa"
)

REM add Python home to PATH if necessary to avoid using the wrong Python executable
setlocal enabledelayedexpansion
set _PYTHON_FOUND=
for %%i in (%_PYTHONEXE%) do (
  set _PYTHON_FOUND="%%~$PATH:i"
)

REM delayed expansion is needed since there could be special characters in the PATH variable
if not "!_PYTHON_FOUND!" == "!_PYTHON!" (
  set PATH=%PYTHONHOME%;%PYTHONHOME%Scripts;!PATH!
)
endlocal & set PATH=%PATH%

REM generate pseudo random temporary filename
:GenerateTempFilename
REM replace leading space of time with zero
set _SETUP_TMP=%Time: =0%
REM remove time delimiters
set _SETUP_TMP=%_SETUP_TMP::=%
set _SETUP_TMP=%_SETUP_TMP:.=%
set _SETUP_TMP=%_SETUP_TMP:,=%
set _SETUP_TMP=%Temp%\setup.%_SETUP_TMP%.bat
if EXIST "%_SETUP_TMP%" do goto GenerateTempFilename
type NUL > "%_SETUP_TMP%"
if NOT EXIST "%_SETUP_TMP%" (
  echo "Could not create temporary file: %_SETUP_TMP%"
  exit 1
)

REM invoke Python script to generate necessary exports of environment variables
%_PYTHON% "%_SETUP_UTIL%" %* > "%_SETUP_TMP%"
if NOT EXIST "%_SETUP_TMP%" (
  echo "Could not create temporary file: %_SETUP_TMP%"
  return 1
)
call "%_SETUP_TMP%"
del "%_SETUP_TMP%"

REM source all environment hooks
set _HOOK_COUNT=0
:hook_loop
if %_HOOK_COUNT% LSS %_CATKIN_ENVIRONMENT_HOOKS_COUNT% (
  REM set workspace for environment hook
  call set CATKIN_ENV_HOOK_WORKSPACE=%%_CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%_WORKSPACE%%
  set _CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%_WORKSPACE=

  REM call environment hook
  call "%%_CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%%%"
  set _CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%=

  set CATKIN_ENV_HOOK_WORKSPACE=

  set /a _HOOK_COUNT=%_HOOK_COUNT%+1
  goto :hook_loop
)

REM unset temporary variables
set _SETUP_UTIL=
set _PYTHON=
set _PYTHONEXE=
set _PYTHON_FOUND=
set _SETUP_TMP=
set _CATKIN_ENVIRONMENT_HOOKS_COUNT=
set _HOOK_COUNT=
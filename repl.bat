@echo off
rem C++ REPL

where cl.exe > NUL 2>&1
if not "%ERRORLEVEL%" == "0" (
  echo could not find cl.exe 1>&2
  exit /b 1
)

setlocal 

set WORKFILE=work.cpp

del %WORKFILE% > NUL 2>&1
set /p "input=>"

echo int main() { %input% return 0; }>%WORKFILE%
cl.exe -Fework.exe %WORKFILE%
if not "%ERRORLEVEL%" == "0" (
  echo compilation failed!
  goto finish
)

call work.exe

:finish
endlocal

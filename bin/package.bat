@echo off
cd..
call mvn -U clean package -DskipTests
cd bin
pause
pause
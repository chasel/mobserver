@echo off
echo [INFO] Use maven tomcat-plugin run the project.

cd %~dp0
cd ..

rem call mvn clean compile -e

call mvn clean compile -e -o

echo --------------------- Set Jrebel ---------------------
set REBEL_HOME=.\bin
set REBEL_CLASS_PATH=.\target\classes
set MAVEN_OPTS=%MAVEN_OPTS% -javaagent:%REBEL_HOME%\jrebel.jar -noverify -Drebel.spring_plugin=true -Drebel.hibernate_plugin=true
set MAVEN_OPTS=%MAVEN_OPTS% -Drebel.dirs=%REBEL_CLASS_PATH%
echo %MAVEN_OPTS%

echo --------------------- Set Jmxremote ---------------------
set JMX_OPTS=
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote=true
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.port=9090
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.ssl=false
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.authenticate=false
echo %JMX_OPTS%

echo --------------------- Set Maven ---------------------
set MAVEN_OPTS=%JMX_OPTS% %MAVEN_OPTS% -XX:MaxPermSize=256m
rem set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=256m
echo %MAVEN_OPTS%

echo --------------------- RUN ---------------------
call mvn tomcat:run -Dmaven.test.skip=true -e -o

cd bin
pause
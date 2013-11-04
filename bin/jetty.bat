@echo off
echo [INFO] Use maven jetty-plugin run the project.

cd %~dp0
cd ..

call mvn compile -o -e

echo --------------------- Set Jrebel ---------------------
set REBEL_HOME=.\bin
set REBEL_CLASS_PATH=.\target\classes
set REBEL_RESOURCES_PATH=.\src\main\webapp
set MAVEN_OPTS=%MAVEN_OPTS% -javaagent:%REBEL_HOME%\jrebel.jar -noverify -Drebel.spring_plugin=true -Drebel.hibernate_plugin=true
set MAVEN_OPTS=%MAVEN_OPTS% -Drebel.dirs=%REBEL_CLASS_PATH%
echo %MAVEN_OPTS%

echo --------------------- Set Jmxremote ---------------------
set JMX_OPTS=
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote=true
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.port=8099
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.ssl=false
set JMX_OPTS=%JMX_OPTS% -Dcom.sun.management.jmxremote.authenticate=false
echo %JMX_OPTS%

echo --------------------- Set Maven ---------------------
set MAVEN_OPTS=%JMX_OPTS% %MAVEN_OPTS% -XX:MaxPermSize=128m
rem set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m
echo %MAVEN_OPTS%

echo --------------------- RUN ---------------------
call mvn -Djetty.port=9091 jetty:run -Dmaven.test.skip=true

cd bin
pause
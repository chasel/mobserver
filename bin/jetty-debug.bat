@echo off
echo [INFO] Use maven jetty-plugin run the project, with debug options.

cd %~dp0
cd ..

call mvn compile -e -o

echo --------------------- Set Jrebel ---------------------
set REBEL_HOME=.\bin
set REBEL_CLASS_PATH=.\target\classes
rem set REBEL_CLASS_PATH=.\src\main\webapp\WEB-INF\classes
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

echo --------------------- Set Maven Debug ---------------------
set MAVEN_OPTS=%JMX_OPTS% %MAVEN_OPTS% -XX:MaxPermSize=128m  -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005
rem set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m  -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000
echo %MAVEN_OPTS%

echo --------------------- RUN ---------------------
call mvn -Djetty.port=9091 jetty:run -Dmaven.test.skip=true -e -o

cd bin
pause

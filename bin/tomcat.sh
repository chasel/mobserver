#!/bin/sh
CWD=`pwd`
cd $CWD
cd ..
echo $CWD
mvn clean compile -e -o
export REBEL_HOME=./bin
export REBEL_CLASS_PATH=./target/classes
MAVEN_OPTS="$MAVEN_OPTS -javaagent:$REBEL_HOME/jrebel.jar -noverify -Drebel.spring_plugin=true -Drebel.hibernate_plugin=true"
MAVEN_OPTS="$MAVEN_OPTS -Drebel.dirs=$REBEL_CLASS_PATH"
export MAVEN_OPTS=" $MAVEN_OPTS -XX:MaxPermSize=256m"
echo $MAVEN_OPTS
mvn tomcat:run -Dmaven.test.skip=true -e -o

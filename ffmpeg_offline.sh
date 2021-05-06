#!/bin/sh
wget ftp://teste:@192.168.10.238/packages.tar.gz
tar -xzf packages.tar.gz
sudo dpkg -i archives/*.deb
#git clone https://github.com/bytedeco/javacpp-presets.git --branch 1.5.4
cd ffmpeg/javacpp-presets/
xmlstarlet ed --inplace -d "/_:project/_:profiles/_:profile[_:id='javacpp-platform-linux-armhf']/_:modules/_:module" pom.xml
xmlstarlet ed --inplace -s "/_:project/_:profiles/_:profile[_:id='javacpp-platform-linux-armhf']/_:modules" -t elem -n "module" -v "ffmpeg" pom.xml
# JAVA_HOME="/usr/lib/jvm/java-11-openjdk-armhf/bin/java"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
mvn install -Djavacpp.platform=linux-armhf -Dmaven.javadoc.skip=true

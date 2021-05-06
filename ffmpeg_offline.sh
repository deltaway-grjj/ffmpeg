#!/bin/sh
wget ftp://teste:@192.168.10.238/packages.tar.gz
tar -xzf packages.tar.gz
sudo dpkg -i archives/*.deb
cd ffmpeg/javacpp-presets/
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
mvn install -Djavacpp.platform=linux-armhf -Dmaven.javadoc.skip=true
cd ffmpeg/target/
ls -l

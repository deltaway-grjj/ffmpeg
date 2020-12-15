#!/bin/sh
sudo apt update && sudo apt -y install \
ant \
autoconf \
autoconf-archive \
automake \
build-essential \
bzip2 \
ccache \
clang \
cmake \
file \
freeglut3-dev \
gfortran \
git \
git-core \
gzip \
libass-dev \
libfreetype6-dev \
libgnutls28-dev \
libgtk2.0-dev \
libsdl2-dev \
libtool \
libusb-dev \
libva-dev \
libvdpau-dev \
libvorbis-dev \
libx264-dev \
libxcb1-dev \
libxcb-shm0-dev \
libxcb-xfixes0-dev \
libasound2-dev \
make \
maven \
nasm \
openjdk-8-jdk \
patch \
perl \
pkg-config \
python \
swig \
tar \
texinfo \
unzip \
wget \
xmlstarlet \
yasm \
zlib1g \
zlib1g-dev
git clone https://github.com/bytedeco/javacpp-presets.git --branch 1.5.4
cd javacpp-presets
xmlstarlet ed --inplace -d "/_:project/_:profiles/_:profile[_:id='javacpp-platform-linux-armhf']/_:modules/_:module" pom.xml
xmlstarlet ed --inplace -s "/_:project/_:profiles/_:profile[_:id='javacpp-platform-linux-armhf']/_:modules" -t elem -n "module" -v "ffmpeg" pom.xml
# JAVA_HOME="/usr/lib/jvm/java-11-openjdk-armhf/bin/java"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
mvn install -Djavacpp.platform=linux-armhf -Dmaven.javadoc.skip=true

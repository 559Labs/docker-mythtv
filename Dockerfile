FROM debian:jessie

MAINTAINER Andrew Marconi <andrew@559labs.com>

RUN apt-get update && \
  echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && \
  apt-get -y upgrade

RUN apt-get install -y \
    git build-essential ccache yasm help2man qtdeclarative5-dev libqt5webkit5-dev libqt5opengl5-dev \
    qtscript5-dev qt5-qmake po-debconf linux-kernel-headers libdvdnav-dev libfreetype6-dev libavc1394-dev \
    libiec61883-dev liblircclient-dev libxinerama-dev libxxf86vm-dev libxvmc-dev libxext-dev libimlib2-dev \
    libasound2-dev libmp3lame-dev libvorbis-dev libdts-dev lsb-release libpulse-dev libxrandr-dev libfftw3-dev \
    libva-dev libvdpau-dev libudev-dev libclass-dbi-perl libnet-upnp-perl libio-socket-inet6-perl \
    libdbd-mysql-perl libjson-perl libwww-perl python python-oauth python-lxml python-mysqldb python-pycurl \
    python-urlgrabber libgl1-mesa-dev libdvdread-dev fftw-dev libvorbis-dev libflac-dev libmad0-dev libcdaudio-dev \
    libcdio-dev libcdparanoia-dev libsdl1.2-dev libfaad-dev libexif-dev libtiff5-dev libxv-dev libtag1-dev \
    libvisual-0.4-dev libmysqlclient-dev libdate-manip-perl libxml-simple-perl libimage-size-perl \
    libdatetime-format-iso8601-perl libsoap-lite-perl libx264-dev libvpx-dev libavahi-compat-libdnssd-dev libssl-dev \
    libcdio-cdda-dev libcdio-paranoia-dev libxml2-dev libass-dev libcec-dev libexiv2-dev uuid-dev libxml-xpath-perl \
    hello libtool-bin debhelper quilt dh-python

RUN mkdir /build && cd /build && \
  git clone https://github.com/MythTV/mythtv.git mythtv && \
  cd mythtv && \
  git checkout fixes/0.28 && \
  cd mythtv && \
  ./configure && \
  make -j 5 && \
  make install && \
  cd / && \
  rm /build -R
  




# ENV LLVM_CONFIG /simit/Release+Asserts/bin/llvm-config
# RUN apt-get -y install cmake git subversion
# RUN mkdir /simit && cd /simit && \
#    svn co https://llvm.org/svn/llvm-project/llvm/branches/release_36/ llvm-3.6.1 && \
#    cd llvm-3.6.1 && \
#    ./configure --disable-terminfo --enable-optimized --enable-assertions --enable-targets=x86 && \
#    make -j8

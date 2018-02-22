# 编译ijkplayer源码，docker 环境
FROM openjdk:8
MAINTAINER pokercc <pokercc@sina.com>

ENV ANDROID_SDK /opt/android_sdk
ENV ANDROID_NDK /opt/android_ndk_r14b
ENV ANDROID_HOME $ANDROID_SDK
ENV NDK_HOME $ANDROID_NDK
ENV PATH $ANDROID_SDK/tools/bin:$PATH

RUN apt update\
      && apt install -y make\
      && apt install -y yasm\
      && apt install -y git

RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip\
    && unzip -o sdk-tools-linux-3859397.zip -d /opt/android_sdk
RUN wget https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip\
    && unzip -o android-ndk-r14b-linux-x86_64.zip -d /opt/

COPY build_ijk.sh /app/
WORKDIR /app
CMD sdkmanager --version
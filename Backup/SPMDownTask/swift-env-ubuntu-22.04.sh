#!/usr/bin/env bash 

echo "Ubuntu 22.04 Swift 运行环境安装"

apt-get install \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4-openssl-dev \
          libedit2 \
          libgcc-9-dev \
          libpython3.8 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2-dev \
          libz3-dev \
          pkg-config \
          tzdata \
          unzip \
          curl \
          wget \
          zlib1g-dev

echo "Ubuntu 22.04 Swift 运行环境安装完毕！！！！！"





# 下载Swift 5.7 arm64
installSiwft()
{
    mkdir -p ../swiftlang
    wget https://download.swift.org/swift-5.7-release/ubuntu2204-aarch64/swift-5.7-RELEASE/swift-5.7-RELEASE-ubuntu22.04-aarch64.tar.gz 
    tar xzf ./swift-5.7-RELEASE-ubuntu22.04-aarch64.tar.gz
    mv ./swift-5.7-RELEASE-ubuntu22.04-aarch64 ../swiftlang/5.7
    echo "swift 5.7 安装完毕。"
}


# 将Swift加入环境变量中
exportSwift()
{
    export PATH=$(pwd)/../swiftlang/5.7/usr/bin:"${PATH}"
    echo "swift 5.7 加入环境变量中成功"
}

# swiftBin=$(pwd)/../swiftlang/5.7/usr/bin
# if [[ -d "$swiftBin" ]]; then
#     echo "缓存中找到Swift 5.7"
#     exportSwift
# else
#     echo "缓存中没有找到Swift 5.7"
#     installSiwft
#     exportSwift
# fi

installSiwft
exportSwift



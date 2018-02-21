#!/bin/bash
. ./env_vars

if ! [ -d ~/packages/otp/${OTP_VERSION} ]; then
  mkdir -p ~/packages/otp/${OTP_VERSION}
fi

# OTP
echo "Install OTP-${OTP_VERSION}"
OTP_DOWNLOAD_URL="https://github.com/erlang/otp/archive/OTP-${OTP_VERSION}.tar.gz"
curl -fSL -o otp-src.tar.gz "$OTP_DOWNLOAD_URL"
tar -xzf otp-src.tar.gz -C ~/packages/otp/${OTP_VERSION} --strip-components=1
rm otp-src.tar.gz
cd ~/packages/otp/${OTP_VERSION}
./otp_build autoconf
./configure --disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --enable-darwin-64bit --without-javac --with-ssl=/usr/local
make -j${nproc}
echo "Finished"

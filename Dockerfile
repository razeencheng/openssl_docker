FROM debian:jessie
MAINTAINER razeen <razeen.cheng@trustasia.com>

# 安装基础环境
RUN apt-get update \
&& apt-get install -y --no-install-recommends g++ gcc libc6-dev make pkg-config perl wget tar \
&& rm -rf /var/lib/apt/lists/*

# 下载文件
WORKDIR /var/lib/openssl
RUN wget --no-check-certificate https://codeload.github.com/openssl/openssl/tar.gz/OpenSSL_1_1_1-pre9 \
&& tar -zxvf OpenSSL_1_1_1-pre9  \
&& mv openssl-OpenSSL_1_1_1-pre9 openssl \
&& rm -rf OpenSSL_1_1_1-pre9

RUN cd /var/lib/openssl/openssl \
&& ./config \
&& make \
&& make test \
&& make install

# Done
RUN  ln -s /usr/local/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1 \
&& ln -s /usr/local/lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1

# 
RUN apt-get update && apt-get install -y ca-certificates


ADD docker-entrypoint.sh /usr/local/bin
WORKDIR /usr/local/ssl/bin
ENTRYPOINT ["docker-entrypoint.sh"]

# openssl_docker
编译好的Openssl docker.

#### 已编译版本
- 1.1.1
- 1.1.1-pre9


#### 使用方法

```
$ docker run --rm razeencheng/openssl:version cmd
```

如：

```
$ docker run --rm razeencheng/openssl:1.1.1-pre9 version
OpenSSL 1.1.1-pre9 (beta) 21 Aug 2018

$ docker run --rm razeencheng/openssl:1.1.1-pre9 s_client -connect razeen.me:443
```

#### 已知问题

```
Q: Verify return code: 20 (unable to get local issuer certificate)
A: -CApath /etc/ssl/certs/ 
eg: docker run --rm razeencheng/openssl:1.1.1-pre9 s_client -CApath /etc/ssl/certs/  -connect razeen.me:443 -tls1_3
```

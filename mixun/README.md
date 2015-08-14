# 介绍
密讯相关的Docker,方便部署和更新

# 组成
## base
加密服务的基础系统,包括OpenJDK,Openssl,APR

## server
加密服务,包括两个部分:
* java服务
* 硬件调用Openssl引擎 

## ejb
证书服务

## mysql
一般化mysql数据库,可用于支持server或ejb
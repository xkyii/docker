# 注意
* 编译apr时务必加上`HAVE_ENGINE_LOAD_BUILTIN_ENGINES`参数
* docker run 映射端口务必与mx.server一致
* docker run 需要映射SJK加密卡`--device /dev/en30 --device /dev/en31 --device /dev/en32 --device /dev/en33`,否则openssl engine无法打开设备

# Sample
_Server_示例运行:

	docker run -it --rm -p 4443:4443 --device /dev/en30  328afe2e0424 java -jar mx.server-all-1.0.jar -cert testKeyRSA/localhost.crt -key testKeyRSA/localhost.key -keypass secret -e SJK0817400RE

对应的_Client_:

	openssl s_client -connect 192.168.8.134:4443 -key user.key -cert user.crt -CAfile ca.crt

注意相关_key_都从`docker.mixun//usr/local/mixun/testKeyRSA`取得.
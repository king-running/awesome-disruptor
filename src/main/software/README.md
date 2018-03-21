/* 
# 愚蠢的人类,你们是看不见这个项目的
*/



### scala stack
 - [sbt](sbt) : 构建工具
 - [scala](scala): scala sdk && 编译器
 - [akka](http://akka.io/): 渣渣 

### proxy stack 
 - [shadowsocks](shadowsocks): 跨越长城
 - [squid](squid) : http && https 代理软件
 - [ss5](ss5): socks5 代理软件
 - [privoxy](privoxy): socks代理 转 http代理 
 - ~~[danted](danted): socks5 代理软件~~ 不可以与dynamic ip machine 共用

### linux stack 
 - [ansible](https://www.ansible.com/):无所不能
 - [httpie](https://github.com/jkbrzt/httpie): http 请求
 - [mirror](mirrors): 一些国内的源
 - [ifstat](linux/ifstat-install.sh): 看机器流量
 - [nslookup](linux/nslookup.sh): 测试域名解析
 - ~~[btsync](https://www.getsync.com/):用于同步或分享数据: 各种用法请自行挖掘~~
 - [rsync](https://www.ansible.com/): linux 下文件 or 文件夹 同步,可用于更新,上传,备份 之类 ; **ansible 已集成此功能** 

### java stack 
 - [jdk](jdk)
 - **[jstatd](jdk/jstatd.sh)** : 用于监控jvm运行状态,配合`visualvm` 一起使用
 - **[visualvm](https://visualvm.github.io/) : 用于监控jvm运行状态** ,配合`jstatd` 一起使用
 - [startup-parameters](jdk/startup-parameters.md): 这是药 
 
### monitor stack 
 - [telegraf](telegraf): 就是一个坑, 有想不开的人可以往里跳
 - [influxdb](https://www.influxdata.com/): 时序库, 性能渣渣
 - **[grafana](http://grafana.org/) : [install](monitor/grafana-install.sh): 前端图像界面显示**
 - [zookeeper](zookeeper): 动物园
 - [kafka](kafka): 提高文学修养
 

### db : 
 - [redis](redis): 奇异人生
 
### other : 
 - [config](https://github.com/typesafehub/config)
 - [protobuf](https://github.com/google/protobuf)
   - [scalapb](http://trueaccord.github.io/ScalaPB/)
   
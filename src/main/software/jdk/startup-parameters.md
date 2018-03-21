
###  gc log 
 - -XX:+PrintGC
 - -XX:+PrintGCDetails
 - -XX:+PrintGCTimeStamps
 - -XX:+PrintGCDateStamps //gc.log 输出时间为日期格式
 - -Xloggc:gc.log

### memory 
 - -XX:NewSize=512m //最小新生代内存大小
 - -Xms600m //最小堆内存大小

### 回收器 
 - -XX:+UseParallelGC //设置新生代为并行回收
 - -XX:+UseConcMarkSweepGC  //设置年老代为CMS 回收器 
 - -XX:+UseG1GC  // G1回收器 
 
### 启动远程jmx 配合 `visualvm` 使用
 - -Dcom.sun.management.jmxremote.port=4567
 - -Dcom.sun.management.jmxremote.ssl=false
 - -Dcom.sun.management.jmxremote.authenticate=false
 - -Djava.rmi.server.hostname=`wget http://ipinfo.io/ip -qO -`
 
### other 
 - -XX:+HeapDumpOnOutOfMemoryError  //oom 的时候dump堆 配合[jProfiler](https://www.ej-technologies.com/products/jprofiler/overview.html) 或 [yourKit](https://yourkit.com/)
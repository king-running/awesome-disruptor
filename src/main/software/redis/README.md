
reids cluster 血的教训: 
 - 如果运维把主从放到一台机器上, **把他打到死为止**
 - 单独分配块磁盘给redis 
 - 机器上起的redis实例数应该 < (机器总数 / 2) && 机器总数 >= 3 
outConfFile=/etc/telegraf/telegraf.conf

echo '
[global_tags]

[agent]
  interval = "1s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "1s"
  flush_jitter = "0s"
  debug = false
  quiet = false
' > ${outConfFile}
echo 'hostname = "'`cat /data/config/name`'"' >> ${outConfFile}
echo 'omit_hostname = false'                  >> ${outConfFile}

echo '
[[outputs.influxdb]]
  urls = ["http://121.42.180.48:8086"] # required
  database = "proxy_pool_master" # required
  precision = "s"
  retention_policy = "default"
  write_consistency = "any"
  timeout = "5s"
  username = "proxy_pool"
  password = "467njkyi8yi846kj78"
'>> ${outConfFile}

echo '
[[inputs.cpu]]
  percpu = true
  totalcpu = true
  fielddrop = ["time_*"]

[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs"]

[[inputs.diskio]]

[[inputs.mem]]

' >> ${outConfFile}

echo '
[[inputs.redis]]
  servers = [ "121.42.182.201:7000","10.251.46.109:7000","121.42.177.15:7000","10.251.32.182:7000","121.42.175.237:7000","10.251.29.161:7000" ]
' >> ${outConfFile}


outConfFile=/etc/telegraf/telegraf.conf

echo '
[global_tags]

[agent]
  interval = "2s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "3s"
  flush_jitter = "0s"
  debug = true
  quiet = false
' > ${outConfFile}
echo 'hostname = "'`cat /data/config/name`'"' >> ${outConfFile}
echo 'omit_hostname = false'                  >> ${outConfFile}

#out put
echo '
[[outputs.influxdb]]
  urls = ["http://121.42.180.48:8086"] # required
  database = "proxy_pool_slave" # required
  precision = "s"
  retention_policy = "default"
  write_consistency = "any"
  timeout = "5s"
  username = "proxy_pool"
  password = "467njkyi8yi846kj78"
'>> ${outConfFile}

#in put
echo '
[[inputs.cpu]]
  percpu = false
  totalcpu = true
  fielddrop = ["time_*"]

[[inputs.disk]]
  interval = "10s"
  ignore_fs = ["tmpfs", "devtmpfs"]

[[inputs.mem]]

[[inputs.net]]

[[inputs.tail]]
  interval = "1s"
  files = ["/var/log/squid/telegraf.log"]
  from_beginning = false
  data_format = "influx"

[[inputs.ping]]
  urls = ["121.42.180.48"] # required
  ping_interval = 0.0
  interface = ""

[[inputs.http_response]]
  interval = "3s"
  address = "http://mail.163.com/"
  response_timeout = "10s"
  method = "GET"
  follow_redirects = true

' >> ${outConfFile}

pkill telegraf
service telegraf stop
pkill telegraf
nohup telegraf start >> telegraf.out 2>&1  &

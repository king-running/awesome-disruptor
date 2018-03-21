
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
  debug = true
  quiet = false
' > ${outConfFile}
echo 'hostname = "'`cat /data/config/name`'"' >> ${outConfFile}
echo 'omit_hostname = false'                  >> ${outConfFile}

echo '
[[outputs.influxdb]]
  urls = ["http://121.42.180.48:8086"] # required
  database = "proxy_pool_slave_test" # required
  precision = "s"
  retention_policy = "default"
  write_consistency = "any"
  timeout = "5s"
  username = "proxy_pool"
  password = "467njkyi8yi846kj78"
'>> ${outConfFile}

echo '
[[inputs.cpu]]
  percpu = false
  totalcpu = true
  fielddrop = ["time_*"]

[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs"]

[[inputs.mem]]

[[inputs.tail]]
  files = ["/var/log/squid/telegraf.log"]
  from_beginning = false
  data_format = "influx"

[[inputs.ping]]
  ## NOTE: this plugin forks the ping command. You may need to set capabilities
  ## via setcap cap_net_raw+p /bin/ping
  #
  ## urls to ping
  urls = ["121.42.180.48"] # required
  ## number of pings to send per collection (ping -c <COUNT>)
  count = 1 # required
  ## interval, in s, at which to ping. 0 == default (ping -i <PING_INTERVAL>)
  ping_interval = 0.0
  ## per-ping timeout, in s. 0 == no timeout (ping -W <TIMEOUT>)
  timeout = 1.0
  ## interface to send ping from (ping -I <INTERFACE>)
  interface = ""

# HTTP/HTTPS request given an address a method and a timeout
[[inputs.http_response]]
  ## Server address (default http://localhost)
  address = "http://mail.163.com/"
  ## Set response_timeout (default 5 seconds)
  response_timeout = "5s"
  ## HTTP Request Method
  method = "GET"
  ## Whether to follow redirects from the server (defaults to false)
  follow_redirects = true
  ## HTTP Request Headers (all values must be strings)
  # [inputs.http_response.headers]
  #   Host = "github.com"
  ## Optional HTTP Request Body
  # body = ""
  ## Optional SSL Config
  # ssl_ca = "/etc/telegraf/ca.pem"
  # ssl_cert = "/etc/telegraf/cert.pem"
  # ssl_key = "/etc/telegraf/key.pem"
  ## Use SSL but skip chain & host verification
  # insecure_skip_verify = false
' >> ${outConfFile}

pkill telegraf
service telegraf stop
pkill telegraf
nohup telegraf start >> telegraf.out 2>&1  &

import tailer
import re
import os
import datetime as dt
import time, datetime

f = open('/var/log/squid-discharge.log', 'w')

for line in tailer.follow(open(r'nethogs.log')):
    if 'squid' in line:
        now_time = int(float(time.time() * 1000))
        x = re.search(".squid.[0-9|\|/]+[\t| ]*([0-9|.]*)[\t| ]*([0-9|.]*)", line)
        out_line = 'squid ' + 'out=' + x.group(1) + ',' + 'in=' + x.group(2) + ' ' + str(now_time) + "000000 \n"
        f.write(out_line)
        f.flush()

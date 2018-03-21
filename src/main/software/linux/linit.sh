#!/usr/bin/env bash
limitsFile=/etc/security/limits.conf
echo '
* soft nofile 65535
* hard nofile 65535
' >> ${limitsFile}



source ${limitsFile}
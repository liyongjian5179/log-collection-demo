#!/bin/bash
# liyongjian5179@163.com
set -euo pipefail
config=/etc/filebeat/filebeat.yml
env
echo "Filebeat init process done. Ready for start up."
echo "Using the following configuration:"
cat ${config}
exec "$@"
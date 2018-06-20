#!/bin/bash

echo "set redis config"
sed -i "s/REDIS_PASS/${REDIS_PASS}/g" /etc/redis/redis.conf

[ $DEBUG ] && set -x

source /tmp/bin/set_config_file.sh

set -e

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec su-exec redis "$0" "$@"
fi

exec "$@"


#!/bin/bash

set -xe

sed -i "s/PORT/${PORT}/g" /usr/local/etc/redis/redis.conf

if [ ! -z "$REDIS_PASS" ];then
    echo "set redis password"
    sed -i "s/# requirepass REDIS_PASS/requirepass ${REDIS_PASS}/g" /usr/local/etc/redis/redis.conf
fi
if [ "$1" = "/bin/bash" ];then
    exec /bin/bash
else
    exec redis-server /usr/local/etc/redis/redis.conf
fi

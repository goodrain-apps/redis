#!/bin/sh
echo "set redis password"
sed -i "s/REDIS_PASS/${REDIS_PASS}/g" /usr/local/etc/redis/redis.conf
sed -i "s/PORT/${PORT}/g" /usr/local/etc/redis/redis.conf
redis-server /usr/local/etc/redis/redis.conf

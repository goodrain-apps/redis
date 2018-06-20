#!/bin/bash

set -xe

sed -i "s/PORT/${PORT}/g" /usr/local/etc/redis/redis.conf
sed -i "s/REDIS_PASS/${REDIS_PASS}/g" /usr/local/etc/redis/redis.conf
sed -i "s/TCP_KEEPALIVE/${TCP_KEEPALIVE}/g" /usr/local/etc/redis/redis.conf
sed -i "s/TIMEOUT/${TIMEOUT}/g" /usr/local/etc/redis/redis.conf
sed -i "s/LOGLEVEL/${LOGLEVEL}/g" /usr/local/etc/redis/redis.conf
sed -i "s/DATABASES/${DATABASES}/g" /usr/local/etc/redis/redis.conf
sed -i "s/SLOWLOG_LOG_SLOWER_THAN/${SLOWLOG_LOG_SLOWER_THAN}/g" /usr/local/etc/redis/redis.conf
sed -i "s/SLOWLOG_MAX_LEN/${SLOWLOG_MAX_LEN}/g" /usr/local/etc/redis/redis.conf
sed -i "s/MAXCLIENTS/${MAXCLIENTS}/g" /usr/local/etc/redis/redis.conf
sed -i "s/DBFILENAME/${DBFILENAME}/g" /usr/local/etc/redis/redis.conf

if [ "$1" = "/bin/bash" ];then
    exec /bin/bash
else
    exec redis-server /usr/local/etc/redis/redis.conf
fi

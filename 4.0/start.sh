#!/bin/sh
echo "set redis config"
chmod +x /usr/bin/env2config
env2config conversion -f /usr/local/etc/redis/redis.conf
redis-server /usr/local/etc/redis/redis.conf

FROM redis:3.2.11
ENV PORT=6379
ENV TZ=Asia/Shanghai
ENV REDIS_PASS=password
ENV TCP_KEEPALIVE=300
ENV TIMEOUT=0
ENV LOGLEVEL=notice
ENV DATABASES=16
ENV SLOWLOG_LOG_SLOWER_THAN=10000
ENV SLOWLOG_MAX_LEN=128
ENV MAXCLIENTS=10000
ENV DBFILENAME=dump.rdb

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
VOLUME /data
EXPOSE 6379
CMD [ "bash","/start.sh"]

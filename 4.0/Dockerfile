FROM redis:4-alpine
RUN apk add --no-cache bash tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
       echo "Asia/Shanghai" >  /etc/timezone && \
       apk del --no-cache tzdata && \
       wget https://github.com/barnettZQG/env2file/releases/download/0.1.1/env2file-linux -O /usr/bin/env2config
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE  6379
ENV PORT=6379
ENV REDIS_PASS=password
ENV TIMEOUT=0
ENV DBFILENAME=dump.rdb
ENV LOGLEVEL=notice
ENV TCP_KEEPALIVE=300
ENV DATABASES=16
ENV SLOWLOG_LOG_SLOWER_THAN=10000
ENV SLOWLOG_MAX_LEN=128
ENV PROTECTED_MODE=yes
ENV MAXCLIENTS=10000
VOLUME /data
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD [ "sh","/start.sh" ]

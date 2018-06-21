FROM redis:4-alpine
# china repositories mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add --no-cahce bash tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
       echo "Asia/Shanghai" >  /etc/timezone && \
       apk del --no-cache tzdata && \
       wget http://rainbond-pkg.oss-cn-shanghai.aliyuncs.com/env2config -O /usr/bin/env2config 
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

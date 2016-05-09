FROM alpine:3.3

# ENV
ENV REDIS_VERSION 3.0.7
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-3.0.7.tar.gz
ENV REDIS_DOWNLOAD_SHA1 e56b4b7e033ae8dbf311f9191cf6fdf3ae974d1c

# add redis user and group (addgroup -g 200 -S redis)
RUN sed -i -r 's/nofiles/redis/' /etc/group && \
    adduser -u 200 -D -S -G redis redis

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2' curl

# change timezone to Asia/Shanghai
RUN apk add --no-cache tzdata && \
    cp  /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && \
    echo "Asia/Shanghai" >  /etc/timezone && \
    apk del --no-cache tzdata

# add bash and libc6-compat
RUN apk add --no-cache bash libc6-compat && \
    ln -s /lib /lib64 && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# for redis-sentinel see: http://redis.io/topics/sentinel
RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		gcc \
		linux-headers \
		make \
		musl-dev \
		tar \
	&& wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL" \
	&& echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
	&& mkdir -p /usr/src/redis \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& rm redis.tar.gz \
	&& make -C /usr/src/redis \
	&& make -C /usr/src/redis install \
	&& rm -r /usr/src/redis \
	&& apk del .build-deps

RUN mkdir /data && chown redis:redis /data
VOLUME /data

COPY 3.0/bin /tmp/bin
COPY 3.0/etc /etc
COPY 3.0/docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD [ "redis-server","/etc/redis/redis.conf" ]

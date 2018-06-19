FROM redis:3.2.11

ENV PORT=6379

ENV TZ=Asia/Shanghai

COPY redis.conf /usr/local/etc/redis/redis.conf

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 6379

CMD [ "bash","/start.sh"]

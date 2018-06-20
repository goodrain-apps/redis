# Dockerfile for Redis

version: 3.2.11

### 环境变量配置说明

* REDIS_PASS

  Redis连接密码

* DBFILENAME    

  本地持久化数据库文件名

* MAXCLIENTS

  客户端最大连接数

* TIMEOUT    

  设置客户端连接时的超时时间，单位为秒。当客户端在这段时间内没有发出任何指令，那么关闭该连接，0是关闭此设置

* LOGLEVEL

  指定日志记录级别。Redis总共支持四个级别：debug、verbose、notice、warning

* DATABASES

  可用数据库数，默认值为16，默认数据库为0，数据库范围在0至（database-1）之间

* TCP_KEEPALIVE

  是否开启长链接，0为关闭

* SLOWLOG_LOG_SLOWER_THAN

  以微秒为单位，因此1000000代表一分钟 注意制定一个负数将关闭慢日志，而设置为0将强制每个命令都会记录

* SLOWLOG_MAX_LEN

  slowlog 的长度

  

### 内部依赖应用访问 

#### 并发客户端数:50, 请求数:10000,内容:3 bytes 时各操作每秒请求次数 

> ```
> PING_INLINE: 196078.44 requests per second
> PING_BULK: 26881.72 requests per second
> SET: 47846.89 requests per second
> GET: 36363.64 requests per second
> INCR: 49261.09 requests per second
> LPUSH: 33898.30 requests per second
> LPOP: 35714.29 requests per second
> SADD: 35842.29 requests per second
> SPOP: 42372.88 requests per second
> LPUSH (needed to benchmark LRANGE): 34482.76 requests per second
> LRANGE_100 (first 100 elements): 37037.04 requests per second
> LRANGE_300 (first 300 elements): 27777.78 requests per second
> LRANGE_500 (first 450 elements): 34965.04 requests per second
> LRANGE_600 (first 600 elements): 31746.03 requests per second
> MSET (10 keys): 12771.39 requests per second
> ```

### 外部网络访问

#### 并发客户端数:50, 请求数:10000,内容:3 bytes 时各操作每秒请求次数

> ```
> PING_INLINE: 1516.07 requests per second
> PING_BULK: 1604.11 requests per second
> SET: 1669.73 requests per second
> GET: 1725.03 requests per second
> INCR: 1718.21 requests per second
> LPUSH: 1679.54 requests per second
> LPOP: 1618.12 requests per second
> SADD: 1578.03 requests per second
> SPOP: 1647.99 requests per second
> LPUSH (needed to benchmark LRANGE): 1675.60 requests per second
> LRANGE_100 (first 100 elements): 1686.34 requests per second
> LRANGE_300 (first 300 elements): 1686.63 requests per second
> LRANGE_500 (first 450 elements): 1706.19 requests per second
> LRANGE_600 (first 600 elements): 1684.07 requests per second
> MSET (10 keys): 1674.48 requests per second
> 

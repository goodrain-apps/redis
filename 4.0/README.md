## Redis version:4.0

### 环境变量配置说明

* REDIS_PASS

  Redis连接密码

* DBFILENAME    

  本地持久化数据库文件名

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

* PROTECTED_MODE

  禁止公网访问redis cache，加强redis安全。它启用的条件有两个： 1. 没有bind IP   2 .没有设置访问密码



### 内部依赖应用访问 

#### 并发客户端数:50, 请求数:10000,内容:3 bytes 时各操作每秒请求次数 

> ```
> PING_INLINE: 101010.10 requests per second
> PING_BULK: 57142.86 requests per second
> SET: 53475.93 requests per second
> GET: 55248.62 requests per second
> INCR: 66666.66 requests per second
> LPUSH: 56497.18 requests per second
> LPOP: 54644.81 requests per second
> SADD: 54054.05 requests per second
> SPOP: 68493.15 requests per second
> LPUSH (needed to benchmark LRANGE): 54945.05 requests per second
> LRANGE_100 (first 100 elements): 52631.58 requests per second
> LRANGE_300 (first 300 elements): 53763.44 requests per second
> LRANGE_500 (first 450 elements): 72463.77 requests per second
> LRANGE_600 (first 600 elements): 53475.93 requests per second
> MSET (10 keys): 49504.95 requests per second
> ```

### 外部网络访问

#### 并发客户端数:50, 请求数:10000,内容:3 bytes 时各操作每秒请求次数

> ```
> PING_INLINE: 1586.04 requests per second
> PING_BULK: 1543.92 requests per second
> SET: 1266.78 requests per second
> GET: 1283.37 requests per second
> INCR: 1603.33 requests per second
> LPUSH: 1564.21 requests per second
> LPOP: 1519.06 requests per second
> SADD: 1557.15 requests per second
> SPOP: 1511.26 requests per second
> LPUSH (needed to benchmark LRANGE): 1529.75 requests per second
> LRANGE_100 (first 100 elements): 1615.25 requests per second
> LRANGE_300 (first 300 elements): 1418.24 requests per second
> LRANGE_500 (first 450 elements): 1426.53 requests per second
> LRANGE_600 (first 600 elements): 1523.00 requests per second
> MSET (10 keys): 1550.63 requests per second
> ```


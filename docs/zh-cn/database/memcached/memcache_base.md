Memcached
---
# Memcached基础 
## 1.存储命令
参数说明如下：
	- key：键值 key-value 结构中的 key，用于查找缓存值。
	- flags：可以包括键值对的整型参数，客户机使用它存储关于键值对的额外信息 。
	- exptime：在缓存中保存键值对的时间长度（以秒为单位，0 表示永远）
	- bytes：在缓存中存储的字节数
	- unique_cas_token通过 gets 命令获取的一个唯一的64位值。
	- noreply（可选）： 该参数告知服务器不需要返回数据
	- value：存储的值（始终位于第二行）（可直接理解为key-value结构中的value）
	- set    向key中设置value值，存在则更新

- set key flags exptime bytes [noreply]
value
 
- add 向key中添加value值，存在不更新，获得响应 NOT_STORED
	add key flags exptime bytes [noreply] value
- replace 替换已存在的 key(键) 的 value(数据值) key 不存在，替换失败，获得响应 NOT_STORED
	replace key flags exptime bytes [noreply] value
- append 向已存在 key(键) 的 value(数据值) 后面追加数据 
	append key flags exptime bytes [noreply] value
- prepend  向已存在 key(键) 的 value(数据值) 前面追加数据 
	prepend key flags exptime bytes [noreply] value
- cas 命令 检查并设置，其它客户端没有操作时，修改 key(键) 的 value(数据值)
	cas key flags exptime bytes unique_cas_token [noreply] value

## 2.查找命令
- get  获取存储在 key(键) 中的 value(数据值) ，如果 key 不存在，则返回空
- get key            #单个key查找
- get key1 key2 key3          #多个key查找
- gets获取带有 CAS 令牌存 的 value(数据值) ，如果 key 不存在，则返回空
- gets key     #单个key查找
- gets key1 key2 key3    #多个key查找
- delete  删除已存在的 key(键)
- delete key [noreply]
- incr/decr  对已存在的 key(键) 的数字值进行自增或自减操作
- incr key increment_value
- decr key decrement_value
 
## 3.统计命令
stats  用于返回统计信息

- stats
	- stats items   显示各个 slab 中 item 的数目和存储时长(最后一次访问距离现在的秒数)
	- stats items
	- stats slabs    命令用于显示各个slab的信息，包括chunk的大小、数目、使用情况等
	- stats slabs
	- stats sizes    显示所有item的大小和个数
	- stats sizes
	- flush_all     清理缓存中的所有 key=>value(键=>值) 对
	- flush_all [time] [noreply]
 

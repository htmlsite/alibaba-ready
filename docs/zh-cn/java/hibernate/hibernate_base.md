## session获取数据库数据
load 与 get方法

### 不同

- load 延迟加载,在获取对象属性时才执行sql
- get 在每次获取对象都会执行sql

### 缓存机制
1. 一级缓存 session级别
2. 二级缓存 sessionFactory级别

### 检索策略
1. 立即检索
2. 延迟检索

## 锁机制

排他性

类型:悲观锁、乐观锁

### 数据库锁
利用数据库的锁机制实现
### oracle语句select ... for update
- `for update`对符合条件的数据进行加锁操作,针对当前的session
- `for upadate of 表主键` 子句用于多个表之间,对指定的表进行加锁
- `update nowait|for update wait 3` 在获取锁之前已经被锁,返回错误|等待时间后进行锁获取

## 悲观锁
大部分依赖于数据库锁

### Hibernate 的加锁模式有：
- LockMode.NONE ： 无锁机制。
- LockMode.WRITE ： Hibernate 在 Insert 和 Update 记录的时候会自动获取。
- LockMode.READ ： Hibernate 在读取记录的时候会自动获取。
注意:以上这三种锁机制一般由 Hibernate 内部使用，如 Hibernate 为了保证 Update过程中对象不会被外界修改，会在 save 方法实现中自动为目标对象加上 WRITE 锁。

- LockMode.UPGRADE ：利用数据库的 for update 子句加锁。
- LockMode. UPGRADE_NOWAIT ： Oracle 的特定实现，利用 Oracle 的 for update nowait 子句实现加锁。

### 实现方法
```sql
Criteria.setLockMode
Query.setLockMode
Session.lock

```

## 乐观锁
大多是基于数据版本（ Version ）记录机制实现

### Hibernate 的加锁方式
进行数据事物的时候,判断数据版本是否一致,一致进行事物获取,不一致,重新获取数据再进行事物处理
对象映射object.xml中配置

`optimistic-lock="xx"`

optimistic-lock 属性有如下可选取值：

- none：无乐观锁
- version：通过版本机制实现乐观锁
- dirty：通过检查发生变动过的属性实现乐观锁
- all：通过检查所有属性实现乐观锁

### 实现方法
```sql
<hibernate-mapping>
<class name="org.hibernate.sample.XX" table="xxtable" dynamic-update="true"
dynamic-insert="true" optimistic-lock="version">
 ...

<version column="version" name="version" type="java.lang.Integer"/> // 操作事物时,对字段值进行累加   版本字段必须放在主键映射之后
</class>
</hibernate-mapping>

```




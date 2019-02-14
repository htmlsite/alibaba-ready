锁机制
---

排他性

类型:悲观锁、乐观锁

## 数据库锁
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

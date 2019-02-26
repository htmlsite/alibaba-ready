基础
---

## start with connect by (nocycle) prior 递归查询用法

- start with 子句：遍历起始条件，有个小技巧，如果要查父结点，这里可以用子结点的列，反之亦然。
- connect by 子句：连接条件。关键词prior，prior跟父节点列parentid放在一起，就是往父结点方向遍历；
prior跟子结点列subid放在一起，则往叶子结点方向遍历，parentid、subid两列谁放在“=”前都无所谓，关键是prior跟谁在一起。
- nocycle 避免环形死循环

## Merge into 
判断表中有没有符合on（）条件中的数据，有了就更新数据，没有就插入数据

```sql
merge into 目标表 a 
using 源表 b on(a.条件字段1=b.条件字段1 and a.条件字段2=b.条件字段2 ……) 
when matched then update set a.更新字段=b.字段 
when not macthed then insert into a(字段1,字段2……)values(值1,值2……)

```
- when not macthed then,条件可选择,即至更新数据或只插入数据

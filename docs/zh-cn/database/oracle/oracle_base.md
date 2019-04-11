# Oracle 基础

### start with connect by (nocycle) prior 递归查询用法

- start with 子句：遍历起始条件，有个小技巧，如果要查父结点，这里可以用子结点的列，反之亦然。
- connect by 子句：连接条件。关键词prior，prior跟父节点列parentid放在一起，就是往父结点方向遍历；
prior跟子结点列subid放在一起，则往叶子结点方向遍历，parentid、subid两列谁放在“=”前都无所谓，关键是prior跟谁在一起。
- nocycle 避免环形死循环

### Merge into 
判断表中有没有符合on（）条件中的数据，有了就更新数据，没有就插入数据

```sql
merge into 目标表 a 
using 源表 b on(a.条件字段1=b.条件字段1 and a.条件字段2=b.条件字段2 ……) 
when matched then update set a.更新字段=b.字段 
when not macthed then insert into a(字段1,字段2……)values(值1,值2……)

```
- when not macthed then,条件可选择,即至更新数据或只插入数据

## oracle常用函数

### 字符函数
- chr(x) CHR和ASCII相反
- concat(string1,string2) 拼接
- initcap 单词首字母大写,其余小写
- lower 所有字母小写
- trim(字段) 去除空格,oracle中字段设为char(2),可能会出现` 2`情况
- nvl(字段,0),判断字段为空时赋值
- instr(string1,string2) string1是否在string中出现,出现>0
- wm_concat(filed) 将多条数据的同一字段值拼接到一个值里,按value1,value2格式,oracle10g返回varchar格式,oracle11g返回clob格式

### 数字函数
- mod(number1,number2) 取余


### 日期函数
- trunc(sysdate,'mm') 截取日期
- to_date(sysdate,'yyyyMM') 转换日期格式
- months_between(date1,date2) 俩个日期差的月份数

### 聚合函数

### 关键词

| 关键词 | 一般用处 |
| ---- | ----|
|exists|查询条件where后,俩个表直接查询,查询效率高|

## Oracle查询优化方式

### 规范
- 索引的创建与使用
  - 检索数据量超过30%的表中记录数.使用索引将没有显著的效率提高
- sql关键字的顺序
  - 多表查询表名的顺序
  - where字句条件的顺序
- 通过内部函数提高SQL效率
- 用>=替代>

### 关键字
- decode`decode(条件,值1,返回值1,值2,返回值2,...值n,返回值n,缺省值)`
- 用EXISTS替代IN、用NOT EXISTS替代NOT IN
- 用UNION替换OR (适用于索引列)、用UNION-ALL 替换UNION
- 用IN来替换OR

### 注意
- 避免使用*显示列名,多用表别名,字段利用表别名展示防止歧义解析花费时间
- 多使用commit释放占用的资源
- sql利用大写,解析时减少转换的时间
- 在java代码中尽量少用连接符“+”连接字符串
- 避免在索引列上使用NOT、避免在索引列上使用计算、避免在索引列上使用IS NULL和IS NOT NULL
- 避免改变索引列的类型

### 其它
- 减少数据库的访问次数

### 处理方式
- 删除重复数据,利用rowid条件进行删除
- 删除数据,truncate删除数据不可恢复,占用资源少,delete删除可恢复,资源占用大
- 利用where子句替代having,having在查询完之后进行过滤,where在查询时过滤

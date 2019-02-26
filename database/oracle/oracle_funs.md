# oracle常用函数

## 字符函数
- chr(x) CHR和ASCII相反
- concat(string1,string2) 拼接
- initcap 单词首字母大写,其余小写
- lower 所有字母小写
- trim(字段) 去除空格,oracle中字段设为char(2),可能会出现` 2`情况
- nvl(字段,0),判断字段为空时赋值
- instr(string1,string2) string1是否在string中出现,出现>0


## 数字函数
- mod(number1,number2) 取余


## 日期函数
- trunc(sysdate,'mm') 截取日期
- to_date(sysdate,'yyyyMM') 转换日期格式
- months_between(date1,date2) 俩个日期差的月份数

## 聚合函数

## 关键词

| 关键词 | 一般用处 |
| ---- | ----|
|exists|查询条件where后,俩个表直接查询,查询效率高|


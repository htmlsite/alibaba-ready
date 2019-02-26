Hibernate基础
@author:xuegangliu
@date:2019-02-15
---

## session获取数据库数据
load 与 get方法

### 不同

- load 延迟加载,在获取对象属性时才执行sql
- get 在每次获取对象都会执行sql

## 缓存机制
1. 一级缓存 session级别
2. 二级缓存 sessionFactory级别

## 检索策略
1. 立即检索
2. 延迟检索




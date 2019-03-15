## Java包结构

### 类型跑判断(个人说法)
- 后缀为able、Iterator 多数为接口
- 后缀为s多数为工具类

### 包结构

- java.lang.* 基础 重要
- java.math.* 精度算法
- java.awt.* 绘制图形、用户界面
- java.io.* 通过数据流、序列化和文件系统提供系统输入和输出
- java.nio.* 数据容器的缓冲区
- java.net.* 实现网络应用程序
- java.security.* 安全框架
- java.sql.* 问并处理存储在数据源 重要
- java.text.* 处理文本、日期、数字和消息 格式化和解析
- java.util.* 工具类  重要

## 线程安全

### atomic(可变)
支持在单个变量上解除锁的线程安全编程

### 规则
- get 具有读取 volatile 变量的内存效果。 
- set 具有写入（分配）volatile 变量的内存效果。 
- 除了允许使用后续（但不是以前的）内存操作，其自身不施加带有普通的非 volatile 写入的重新排序约束，lazySet 具有写入（分配）volatile 变量的内存效果。在其他使用上下文中，当为 null 时（为了垃圾回收），lazySet 可以应用不会再次访问的引用。 
- weakCompareAndSet 以原子方式读取和有条件地写入变量但不 创建任何 happen-before 排序，因此不提供与除 weakCompareAndSet 目标外任何变量以前或后续读取或写入操作有关的任何保证。 
- compareAndSet 和所有其他的读取和更新操作（如 getAndIncrement）都有读取和写入 volatile 变量的内存效果。 

### 关键字
- volatile,基于反射更新类volatile字段的值

### locks
为锁和等待条件提供

### 关键字
- synchronized块结构机制,Lock实现其它以外的功能 


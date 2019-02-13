基础
---

## start with connect by (nocycle) prior 递归查询用法

- start with 子句：遍历起始条件，有个小技巧，如果要查父结点，这里可以用子结点的列，反之亦然。
- connect by 子句：连接条件。关键词prior，prior跟父节点列parentid放在一起，就是往父结点方向遍历；
prior跟子结点列subid放在一起，则往叶子结点方向遍历，parentid、subid两列谁放在“=”前都无所谓，关键是prior跟谁在一起。
- nocycle 避免环形死循环

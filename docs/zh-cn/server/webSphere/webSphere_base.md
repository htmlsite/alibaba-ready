应用服务器
---

## 组件、容器服务器(jsp/servlet容器)

1. Websphere IBM服务器(强项在均衡负载,但消耗资源非常厉害，门坎很高，决定于硬件，非常适合生产环境部署) 
1. Weblogic
1. Tomcat(小型服务)
1. jboss(需要的内存和硬盘空间比较小)
1. Geronimo

## http容器
1. apache http
1. IIS 
1. nginx
1. Google Web Server
1. lighttpd

websphere基本概念
---

### 什么是单元（Cell）？什么是节点（Node）？Node、Profile 与 Server 之间的关系是什么？

答：

单元： 
单元是整个分布式网络中一个或多个节点的逻辑分组。单元是一个配置概念，是管理员将节点间逻辑关联起来的实现方法。

管理员根据具体的业务环境，制定对其整体系统集成环境有意义的条件来定义和组织构成单元的节点。就一般情况来说，可以将单元看作是最大的作用域。

在 IBM WAS ND 产品中，管理配置数据都存储在 XML 文件中。单元保留了它每个节点中每台服务器的主配置文件。

同时每个节点和服务器也有其自己的本地配置文件。如果服务器已经属于单元，则对于本地节点或服务器配置文件的更改都是临时的，通过在本地提交更改生效时，

本地更改覆盖单元配置，但是当执行单元配置文档同步到节点的操作时，在单元级别上对主控服务器和主节点配置文件所作的更改将会替换对该节点所作的任何临时更改。


节点： 
节点是受管服务器（Server）的逻辑分组。节点通常与具有唯一 IP 主机地址的逻辑或物理计算机系统对应，节点不能跨多台计算机。节点分为受管节点与非受管节点。

 

### 关于 Node、Profile 与 Server: 
这三个概念比较容易混淆，我们拿出来对比说明：Node=Profile。Node 是管理上使用的概念，Profile 是实际的概要文件，它们代表同一事物。

Server 就是所谓的 Application Server Instance , 这是我们实际要布署 Application 的地方。

在IBM WAS ND 产品中受管节点的 Node Agent 目的就是让 Deployment Manager Server 可以透过 Node Agent 来管 Node (Profile) 中的 Application Server Instance，

一个 Node (Profile) 中可以有多个 Application Server Instance。


如果是非 ND 版本 , 则属于 Single Server 版本，那么一个 Node (Profile) 中只能有一个 Application Server Instance，

如果你希望在一台机器上有多个 Application Server Instance，那就只能透过创建多个 Profile (Node) 来达成，但这些 Node (Porfile) 彼此独立没有管理上的关系 (RelationShip)，只要使用的 TCP/IP Port 不要冲突即可

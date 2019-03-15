oracle常用系统信息查询
---

## 系统信息查询
- v$controlfile 控制文件信息
- v$datafile 数据文件信息
- v$session 会话信息

## 数据库表信息
- DBA_TABLES、ALL_TABLES 数据库表信息
- DBA_TAB_COLUMNS、ALL_TAB_COLUMNS、USER_TAB_COLUMNS 数据库表的列信息
- USER_TAB_COMMENTS、USER_COL_COMMENTS 数据库表、列注释
- DBA_VIEWS、ALL_VIEWS、USER_VIEWS 视图
- DBA_SEQUENCES、ALL_SEQUENCES、USER_SEQUENCES 序列
- DBA_INDEXS、ALL_INDEXS、USER_INDEXS、DBA_IND_COLUMNS、ALL_IND_COLUMNS、USER_IND_COLUMNS 索引

## 用户
- DBA_USERS、DBA_ROLES 用户、角色
- DBA_PROFILES 配置
- DBA_TABLESPACES 表空间

## 表信息
### 1.dba_开头表
- dba_users           数据库用户信息
- dba_segments    表段信息
- dba_extents        数据区信息
- dba_objects        数据库对象信息
- dba_tablespaces 数据库表空间信息
- dba_data_files     数据文件设置信息
- dba_temp_files    临时数据文件信息
- dba_rollback_segs         回滚段信息
- dba_ts_quotas               用户表空间配额信息
- dba_free_space              数据库空闲空间信息
- dba_profiles                    数据库用户资源限制信息
- dba_sys_privs                用户的系统权限信息
- dba_tab_privs                 用户具有的对象权限信息
- dba_col_privs                用户具有的列对象权限信息
- dba_role_privs                用户具有的角色信息
- dba_audit_trail                审计跟踪记录信息
- dba_stmt_audit_opts       审计设置信息
- dba_audit_object             对象审计结果信息
- dba_audit_session          会话审计结果信息
- dba_indexes                   用户模式的索引信息

### 2.user_开头表
- user_objects            用户对象信息
- user_source             数据库用户的所有资源对象信息
- user_segments        用户的表段信息
- user_tables              用户的表对象信息
- user_tab_columns    用户的表列信息
关于这个还涉及到两个常用的例子如下：
#### 2.1.Oracle中查询某个字段属于哪个表
select table_name,owner from dba_tab_columns t where t.COLUMN_NAME like upper('%username%');
#### 2.2.oracle中查询某个表的列数
select count(*) from user_tab_columns where table_name= upper('sys_operate')
  注:这两个例子都用到了upper这个函数，是因为在这里表名得大写，否则查出的结果不是正确的
  user_constraints 用户的对象约束信息
  user_sys_privs   当前用户的系统权限信息
  user_tab_privs    当前用户的对象权限信息
  user_col_privs    当前用户的表列权限信息
  user_role_privs   当前用户的角色权限信息
  user_indexes              用户的索引信息
  user_ind_columns       用户的索引对应的表列信息
  user_cons_columns    用户的约束对应的表列信息
  user_clusters              用户的所有簇信息
  user_clu_columns      用户的簇所包含的内容信息
  user_cluster_hash_expressions   散列簇的信息

### 3.v$开头表
- v$database     数据库信息
- v$datafile        数据文件信息
- v$controlfile     控制文件信息
- v$logfile          重做日志信息
- v$instance      数据库实例信息
- v$log               日志组信息
- v$loghist         日志历史信息
- v$sga             数据库SGA信息
- v$parameter    初始化参数信息
- v$process       数据库服务器进程信息
- v$bgprocess   数据库后台进程信息
- v$controlfile_record_section   控制文件记载的各部分信息
- v$thread                               线程信息
- v$datafile_header     数据文件头所记载的信息
- v$archived_log         归档日志信息
- v$archive_dest         归档日志的设置信息
- v$logmnr_contents   归档日志分析的DML DDL结果信息
- v$logmnr_dictionary 日志分析的字典文件信息
- v$logmnr_logs      日志分析的日志列表信息
- v$tablespace        表空间信息
- v$tempfile            临时文件信息
- v$filestat              数据文件的I/O统计信息
- v$undostat           Undo数据信息
- v$rollname           在线回滚段信息
- v$session            会话信息
- v$transaction       事务信息
- v$rollstat             回滚段统计信息
- v$pwfile_users     特权用户信息
- v$sqlarea            当前查询过的sql语句访问过的资源及相关的信息
- v$sql                  与v$sqlarea基本相同的相关信息
- v$sysstat            数据库系统状态信息

### 4.all_开头表
- all_users                数据库所有用户的信息
- all_objects              数据库所有的对象的信息
- all_def_audit_opts   所有默认的审计设置信息
- all_tables                所有的表对象信息
- all_indexes             所有的数据库对象索引的信息

### 5.session_开头表
- session_roles    会话的角色信息
- session_privs    会话的权限信息

### 6.index_开头表
- index_stats      索引的设置和存储信息


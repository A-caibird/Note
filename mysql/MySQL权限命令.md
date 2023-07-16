# MySQL权限命令

## 创建用户

> 创建用户并将用户信息储存在``表mysql.user`中.

`CREATE USER 'new_username'@'localhost' IDENTIFIED BY 'password';`



> 查询某个用户信息

`select * from mysql.user where User = '名字' and Host ='主机名'`



## 赋予用户权限

`GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON `1`.* TO 'local1'@'%';`



**注意:EXECUTE ON `1`.* TO 'local1'@'%';`这表示给用户local1 主机号为% 在数据库为1上创建的用户权限**.**数据库的名字要用反引号包裹**

.

### 修改外键权限

`grant references on ` `1.* to 'local1' and 'host'`



## 查看用户权限

### 查看自己权限

`show grants`

### 查看特定用户权限

`show grants for 'name'@'%'`

## 修改用户密码

## `SET PASSWORD FOR 'alogin'@'%' = 'mima';`

## 创建角色

以下是在MySQL中创建新角色并为其授予权限的步骤：

1. 使用管理员权限登录MySQL，比如root用户。

2. 创建名为“arole”的角色，请使用以下命令：

```mysql
CREATE ROLE arole;
```

3. 授予角色在表Student上的select、insert、update和delete权限。请使用以下命令：

```mysql
GRANT SELECT, INSERT, UPDATE, DELETE ON learndb.Student TO arole;
```

4. 授予角色在表Grade上的select、insert、update和delete权限。请使用以下命令：

```mysql
GRANT SELECT, INSERT, UPDATE, DELETE ON learndb.Grade TO arole;
```

5. 将arole授予用户，使用户可以继承该角色的权限。例如，如果要将arole授予用户alogin_ldb，请使用以下命令：

```mysql
GRANT arole TO 'alogin_ldb'@'localhost';
```

6. 刷新MySQL权限表以使更改生效：

```mysql
FLUSH PRIVILEGES;
```

现在，您可以尝试使用用户alogin_ldb登录到MySQL客户端，并测试是否可以查询、插入、更新和删除learndb数据库中的Student和Grade表。

例如，您可以使用以下语句查询Student表：

```mysql
SELECT * FROM Student;
```

或者，您可以使用以下语句向Grade表中添加新行：

```mysql
INSERT INTO Grade (sid, cid, score) VALUES ('10001', '1', 85);
```

如果用户具有足够的权限，则应成功执行查询或插入操作。否则，将显示错误消息并拒绝该操作。



## 删除除开`root`以外的所有用户

在MySQL中，您可以使用以下步骤删除除root以外的所有用户：

1. 使用管理员权限登录MySQL，比如root用户。

2. 执行以下查询以查找当前所有用户（除root之外）：

```
SELECT user FROM mysql.user WHERE user NOT LIKE 'root' AND user NOT LIKE 'mysql.%';
```

此查询将返回不是以“root”或“mysql”开头的所有用户的列表。

3. 对于返回的每个用户，执行以下查询来删除该用户和其关联的权限和对象：

```
DROP USER 'username'@'localhost';
```

请将“username”替换为要删除的特定用户的名称。

4. 刷新MySQL权限表以使更改生效：

```
FLUSH PRIVILEGES;
```

现在，除了系统用户和root用户之外，所有其他用户均已从MySQL服务器中删除。请注意，在执行此操作之前，请务必备份所有需要保留的数据，并确保不会误删重要的用户账户。

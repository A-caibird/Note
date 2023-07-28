[centos8 安装mysql](https://juejin.cn/post/7056265988673568781)

> 不同的地方

1. 拉仓库：`wget https://repo.mysql.com/mysql80-community-release-el8-1.noarch.rpm`

2. yum 安装`yum -y install mysql80-community-release-el8-1.noarch.rpm`

3. `yum module disable mysql`

4. `yum -y install mysql-community-server`
5. 删除rpm文件防止更新 `yum -e mysql80-community-release-el8-1.noarch.rpm`

​	

> 删除mysql

如果您希望完全删除MySQL数据库，请使用以下命令：

1. 删除MySQL服务器软件包：

   ```
   perlCopy code
   rpm -qa | grep mysql | xargs rpm -e
   ```

2. 删除MySQL数据目录（默认情况下是/var/lib/mysql）：

   ```
   bashCopy code
   rm -rf /var/lib/mysql
   ```

请注意，在执行这些命令之前，务必确保您真正希望删除MySQL数据库，并且备份重要的数据以防意外。
要将当前的 MySQL 数据库导出为文件，你可以使用 `mysqldump` 命令。`mysqldump` 是 MySQL 提供的一个命令行工具，用于备份和导出数据库。

以下是使用 `mysqldump` 命令将当前数据库导出为文件的步骤：

1. 打开命令行界面（如终端或命令提示符）。

2. 运行以下命令，其中 `<database_name>` 替换为你要导出的数据库的名称，`<output_file>` 替换为你希望导出的文件的路径和名称：

   `````shell
   mysqldump -u <username> -p <database_name> > <output_file>
   ```

   - `<username>` 是连接数据库时使用的用户名。
   - 在命令执行后，你将被要求输入数据库用户的密码。

   例如，如果你要将名为 `mydatabase` 的数据库导出到名为 `backup.sql` 的文件中，并使用用户名 `root` 连接数据库，命令将如下所示：

   ````shell
   mysqldump -u root -p mydatabase > backup.sql
   ```

3. 执行命令后，`mysqldump` 将导出当前数据库的结构和数据，并将其保存到指定的文件中。

请注意，导出的文件是一个纯文本文件，其中包含用于重建数据库的 SQL 语句。你可以使用该文件来还原数据库或将其应用到其他 MySQL 服务器上。

另外，在运行 `mysqldump` 命令时，确保你具有足够的权限来访问和导出数据库。

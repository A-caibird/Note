首先，您需要确保已在计算机上安装了Node.js和NPM。在安装完成后，您可以按照以下步骤初始化一个TypeScript项目：

1. 打开命令行界面（例如终端或命令提示符）并导航到要创建项目的目录。
   
2. 使用npm init 命令初始化npm项目（如果你已经有了npm项目，请跳过此步骤），这将创建一个package.json文件来管理您的项目依赖。

   ```
   npm init
   ```

3. 现在，您可以使用npm install命令安装TypeScript。请确保使用--save-dev选项来将其添加到您的开发依赖中。

   ```
   npm install typescript --save-dev
   ```

4. 接下来，在项目根目录下创建一个名为tsconfig.json的TypeScript配置文件。

   ```
   touch tsconfig.json
   ```

5. 在tsconfig.json文件中添加 TypeScript 编译器选项，以指定编译生成 JavaScript 的输出目标格式和目录结构等内容。

   ```
   {
       "compilerOptions": {
           "target": "es6",
           "module": "commonjs",
           "outDir": "dist"
       }
   }
   ```

6. 最后，请在package.json文件中添加一个scripts对象来定义使用TypeScript编译器编译您的代码命令。

   ```
   "scripts": {
       "build": "tsc"
   }
   ```

现在，您应该可以运行以下命令来编译您的TypeScript代码：

```
npm run build
```

此命令将使用tsc编译器将项目中所有的TypeScript文件转换为JavaScript，并将其输出到tsconfig.json文件中指定的目录结构（例如dist文件夹）。
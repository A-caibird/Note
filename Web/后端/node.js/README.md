# Node.js
## JavaScript管理模块的方式
ES模块和CommonJS都是用于在JavaScript中管理模块的规范。它们之间的主要区别如下：

1. 语法差异

ES模块使用`import`和`export`关键字来导入和导出模块，而CommonJS使用`require()`和`module.exports`。

2. 加载方式

ES模块是预编译的，可以通过静态分析预先确定依赖项。对于浏览器环境来说，可以使用`<script type="module">`标签或动态创建`<script>`元素进行加载。而对于Node.js来说，在文件中使用`import`语句进行加载。

而CommonJS则需要在运行时才能确定依赖项。在Node.js中，使用`require()`方法进行加载。

3. 环境支持

ES模块是ECMAScript标准的一部分，从ES6开始得到支持。目前，大多数现代浏览器都支持ES模块。在Node.js v13.2.0以上的版本中，也可原生支持ES模块。

而CommonJS最初是为了解决Node.js中模块化问题而提出的，因此主要被Node.js所支持。

至于哪一个更好，取决于具体的应用场景和需求。如果你的项目需要在浏览器端和Node.js中同时运行，那么ES模块可能更适合；如果你仅仅是在Node.js中开发，那么CommonJS可能更方便。
> 使用ES模块导入的方式，可以将`const fs = require('fs')`改为：
>
```
import fs from 'fs';
```

> 需要注意的是，在使用ES模块语法时，文件扩展名应为`.mjs`或者`.js`，且在package.json中需要设置`"type": "module"`。

> 如果按照上述修改后仍然提示“require is not defined”，可以尝试将文件扩展名修改为`.cjs`，或者在package.json中将`"type": "module"`改为`"type": "commonjs"`。
## fs moudle:文件系统模块

## 读取文件

```javascript
import fs from 'fs'
fs.readFile('./test.text','utf-8',function (err,dataStr){
    if(err)
        return console.log('fail'+err.message)
    else
        return console.log('suc',dataStr)
})

```


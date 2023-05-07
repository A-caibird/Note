# Node.js

## fs module:文件系统模块

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

## 写入文件(try--catch判断是否产生错误)

```JavaScript
try {
  fs.writeFileSync('./save.json', JSON.stringify(jsonContent, null, 2))
  console.log('写入文件成功')
} catch (err) {
  console.error('写入文件失败')
  console.error(err)
}
```



## `JSON.stringify()`

`JSON.stringify()` 方法用于将 JavaScript 对象转换为 JSON 字符串。该方法接受三个参数：

1. 要转换的 JavaScript 对象。
2. 可选参数，用于指定要包含在生成的 JSON 字符串中的属性列表。
3. 可选参数，用于指定缩进级别。

在您的代码中，第二个参数为 `null`，这意味着生成的 JSON 字符串将包含对象中的所有属性。这类似于省略第二个参数或将其设置为一个空数组。

第三个参数为 `2`，这意味着生成的 JSON 字符串将采用两个空格的缩进格式，以使其更易读和格式化。如果省略此参数，则生成的 JSON 字符串将不包含任何缩进，这可能会使其难以阅读和理解。

例如，以下是一个基本的 JavaScript 对象：

```javascript
const person = {
  name: 'John',
  age: 30,
  address: {
    street: '123 Main St',
    city: 'Anytown',
    state: 'CA',
    zip: '12345'
  }
}
```

如果使用默认设置调用 `JSON.stringify(person)` 方法，则会生成以下 JSON 字符串：

```json
{"name":"John","age":30,"address":{"street":"123 Main St","city":"Anytown","state":"CA","zip":"12345"}}
```

如果使用 `JSON.stringify(person, null, 2)` 调用该方法，则会生成以下格式化后的 JSON 字符串：

```json
{
  "name": "John",
  "age": 30,
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zip": "12345"
  }
}
```

请注意，第三个参数仅在格式化输出时使用，并不影响生成的 JSON 字符串的语法或结构。因此，如果您只需要将对象转换为 JSON 字符串并将其发送到服务器或保存到文件中，则可以省略该参数。





## path module 

### path.join:拼接路径

```JavaScript
const path=require( 'path')
const p=path.join(__dirname,'/a','/b/c/d','../','index.html')
console.log(p)
```

1. `__dirname_`:当前文件目录,string格式
2. `../`表示回到上一级目录

### path.basename:获取路径最后一个文件的名称

```JavaScript
const path=require( 'path')
const p=path.join(__dirname,'/a','/b/c/d','../','index.html')
console.log(p)

const p1=path.basename(p)
console.log(p1)  //index.html

```

> 不需要扩展名

```JavaScript
const p1=path.basename(p,'html')
```



> 获取扩展名

```JavaScript
const p1=path.extname(p)
```







## `http`模块创建一个web服务器

```JavaScript
import http from 'http'
//创建一个服务器
const server=http.createServer()

// 监听请求事件
server.on('request',(re1q,res) => {console.log('web')})

// 启动服务器
server.listen(8080,() => {console.log('server is running on http://localhost:8080')})
```



### `server.on`中的回调函数中的参数`req`

```JavaScript
server.on('request',(req,res) => {

    //req.url  获取请求路径
    //req 包含了和客户端有关的地址
    //req.method 获取请求方式
    let  str='url:${req.url} method:${req.method}'
    console.log('web')})

```



- req包含客户端的一些信息
- req.url请求的路径
- req.url请求的方式(postman软件进行演示)



### `server.on`中回调函数参数`res`

> 给服务器向客户端反应

```JavaScript
server.on('request', (req, res) => {

    // req.url  获取请求路径
    //req 包含了和客户端有关的地址
    //req.method 获取请求方式
    let str = 'url:${req.url} method:${req.method}'
    console.log('web')

    res.setHeader('Content-Type', 'text/html;charset=utf-8')
    res.end('turn off:关闭')

}
)
```



` res.setHeader('Content-Type', 'text/html;charset=utf-8')`: 防止中文乱码

`res.end()`向客户端响应对应的数值





## 加载模块

> 导入内置模块,或者第三方模块

```JavaScript
import http from 'http'
```





> 导入自定义模块

```JavaScript
import js from './path'
```







## 自定义模块中的对象

### 模块内置对象`moudule`

每一个js文件都有一个moudule对象,包含这个模块(js文件)的有一些信息,路径等等



### 自定义模块导出对象`moudule.export`

> 自定义模块

```JavaScript
moudule.exports.username="fads"
```





>  加载上面的模块

```JavaScript
const m =require('上面')
console.log(m)



```

输出结果是:`{username:'fads'}`





## 模块的加载方式

### 运行机制

- 缓存机制
- 一次加载,只是运行一次,后续直接调用缓存

### 加载方式

- 自定义包,必须包含`./`或者`../`这种路径
- 加载第三放模块或者自定义模块,直接写名字即可





## express 构建web 应用和web api

### 监听客户端的请求

> `app.post` 监听客户端向服务器发送的post请求



> `app.listen  `启动服务器



```JavaScript
import express from 'express'
const app =express()


app.get('/',(req,res)=>{
    res.send('hello world')
})
app.listen(3000,()=>{
    console.log('server is running at http://127.0.0.1:3000')
})
```

### 获取客户端发送的查询参数

> `req.query`返回查询参数对象,默认是一个空对象

```JavaScript


app.get('/',(req,res)=>{
    const a= req.query 
    res.send(a)
})
```





## `express `创建静态资源服务器



> `app.use(express.static('../src'))`

```JavaScript
import express from 'express'
const app =express()
app.get('/',(req,res)=>{
    const a= req.query
    res.send(a)
})
app.use(express.static('../src'))
app.listen(3000,()=>{
    console.log('server is running at http://localhost:3000/')
})

```





### 如果自己需要访问`静态资源`的文件,则只需要在对应的url中添加即可

```html
http://localhost:3000/main.js
```



### 托管多个静态服务

```JavaScript
app.use(express.static('../src'))
app.use(express.static('../src1'))
```

查找文件的时候,先从第一个静态资源区域查找,否则从第二个静态资源区域查找



### 让其他人访问共享的静态资源文件



要让其他人通过公共网络(如Internet)访问您的服务器，您需要完成以下步骤：

1. `获取公共IP地址：您需要知道您的计算机在Internet上的公共IP地址，可以通过搜索“what is my ip”等网站来获取。`
2. 配置防火墙：为了允许其他人访问您的服务器，您需要在您的路由器或计算机上配置防火墙规则，以允许传入的连接。具体步骤可能因您所使用的防火墙软件而有所不同，但通常涉及将特定端口(例如3000)添加到允许列表中，并指定从外部接受传入的连接。
3. 启动服务器：确保您的服务器正在运行，并监听本地网络地址(通常为“localhost”或“127.0.0.1”)和端口3000。
4. 共享公共IP地址：向其他人提供您的公共IP地址和端口号，以便他们可以使用Web浏览器或其他HTTP客户端应用程序访问您的服务器。
5. 

请注意，公共网络是不安全的，任何人都可以尝试访问您的服务器并进行恶意操作。因此，请确保您的服务器软件和系统已经得到适当的安全保护，例如使用HTTPS协议加密数据传输、设置强密码、更新软件补丁等。





## nodemon 工具的使用

>  全局安装:`npm i -g nodemon`



>  使用nodemon:`nodemon 1.js`





## express路由

1. 概念:`路由指的是客户端的请求与服务器处理函数之间的映射关系`

2. express中路由有三部分组成,分别是`请求的类型,请求的url地址,处理函数`

   `app.method(path,handler)`:method和path是与客户端有关系的(method:请求类型,path:url),handler是处理函数

### 路由模块化

```JavaScript
import  Express  from "express";
const router = Express.Router();
router.get("/", (req, res) => {
    res.send("hello world")
})
router.post("/req", (req, res) => {
    res.send("post")
})
export default router

```



#### 导出注意事项

如果您需要导出多个值，可以使用`export`关键字来分别导出每个值。在另一个模块中，可以使用`import`关键字来导入这些值。例如：

```javascript
// person.js

export const name = 'John Doe'
export const age = 30
export const gender = 'male'
```

在上面的代码中，我们定义了三个常量并将它们作为命名导出导出。现在，在另一个模块中，我们可以像下面这样导入它们：

```javascript
// app.js

import { name, age, gender } from './person.js'

console.log(name)   // 输出：'John Doe'
console.log(age)    // 输出：30
console.log(gender) // 输出：'male'
```

此外，您也可以在一个模块中使用`export default`关键字来导出一个默认值。默认值只能有一个，并且通常用于导出模块的主要功能。例如：

```javascript
// person.js

const person = {
  name: 'John Doe',
  age: 30,
  gender: 'male'
}

export default person
```

在上面的代码中，我们定义了一个JavaScript对象`person`，然后使用`export default`关键字将它作为默认导出值导出。现在，在另一个模块中，我们可以像下面这样导入它：

```javascript
// app.js

import person from './person.js'

console.log(person.name)   // 输出：'John Doe'
console.log(person.age)    // 输出：30
console.log(person.gender) // 输出：'male'
```

请注意，在同一个模块中，只能使用`export default`关键字导出一个默认值，并且不能与命名导出同时使用。如果您需要导出多个值，应该使用命名导出。





## express中间件

### 基础知识

#### 概念



中间过程的架构:需要有`输入和输出`

#### 格式



本质:是一个函数 `app.get('/'.function(req,res,next)){})`     重点:`next函数`,是调用多个中间件的关键,表示转关系下一个中间件或者路由



```JavaScript
function mv(req,res,next)=>{
    res.send('post')
    next() //一定需要next,表示交给下一个中间件处理
}
就是这个函数

app.post('/req',mv)
```

1. **next() 一定需要next,表示交给下一个中间件或者路由处理})**
2. function mv中的值必须要有三个,`next是最后一个`
3. `next函数`,是调用多个中间件的关键,表示转关系下一个中间件或者路由

### 使用方法

#### 中间件的使用方法

中间件函数:`req,res函数是公用一份的,`即指向同一个对象引用.  故可以添加自定义属性(req.a)



#### 全局注册中间件

`app.use(name)`

### 中间件的分类

#### 应用级别

通过使用`app.use(),app.get(),app.post()`绑定到app实例上的中间组件.叫做应用级别的`中间件`



#### 路由级别

绑定到路由实例(`const router=express.Router()`)的中间件叫做路由级别的中间件



#### 错误级别的中间件(放在路由 其他中间件之后)

function函数格式为:```function name(err,req,res,next){}```

代码演示:



> 在路由中抛出一个自定义错误

```JavaScript
import  Express  from "express";
const router = Express.Router();
router.get("/", (req, res) => {
    throw new Error("error")
    res.send("hello world")
})
router.post("/req", (req, res) => {
    res.send("post")
})
export default router

```

> 写一个错误级别中间件`放在最后`

```JavaScript
import express from 'express'
import router from './router.js'
const app =express()

function mv(err,req,res,next){
    console.log('mv'+err.message)
    res.send('mv'+err.message)
    next()
}
app.use(router)
app.use(mv)
app.listen(3000,()=>{
    console.log('server is running at http://localhost:3000/')
})

```





#### 内置中间件

1. `express.static`中间件:创建静态资源管理器

2. `express.json`解析json格式的请求体数据

   

   **除开错误级别的中间件以外,都需要在路由前注册中间件**

   ```JavaScript
   import express from 'express'
   import router from './router.js'
   const app =express()
   app.use(express.json())
   // 挂载到app上,解析客户端发送过来的json数据
   
   
   
   app.post('/',(req,res)=>{
       console.log(req.body)
       res.end('hello world')
   })
   app.listen(3000,()=>{
       console.log('server is running at http://localhost:3000/')
   })
   
   ```

   `req.body`:解析后客户端发送到服务器的数据`对象`,默认是undefined,注意如果不是对象就会报错





3. `express.urlencoded`解析`url-encoded`格式的数据

   ``键值对格式的数据:如name---lian,age--10	``

   使用方式

   ```JavaScript
   app.use(express.urlencoded({ extended: true }))
   
   ```

4. `express.querystring模块`:`parse`将`url中查询字符串`转化为对象

​        `http://localhost:3000/api/get?fasdf=fasdfa&dafs=3434`	其中:`?fasdf=fasdfa&dafs=3434`是查询字符串





#### 第三方中间件





#### 自定义中间件

```JavaScript
import express from 'express'
import qs from 'querystring'


const app = express()
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.post('/', (req, res, next) => {
    let zhi = ''

    //req.on('data',()=>{next()}) 监听数据接受事件  以后执行next()
    req.on('data', (data) => {
        zhi += data
    })

    //req.on('end',()=>{next()}) 监听数据接受完毕事件   以后直接执行
    req.on('end', () => {

        //qs.parse() 将字符串转换为对象
        const body = qs.parse(zhi)
        req.body = body
        next()
    })
    res.send(req.body)
})
app.listen(3000, () => {
    console.log('server is running at http://localhost:3000/')
})

```



>  `1. `//`req.on('data',()=>{next()}) `监听数据接受事件  以后执行next()
>
>  `2.`//`req.on('end',()=>{next()}) `监听数据接受完毕事件   以后直接执行
>
> `3.`// `req.end(),req.send()`只能出现一个,因为 `res.send()` 已经将响应发送到客户端了，调用 `res.end()` 相当于重复发送响应。
>
> `4.`// 在监听数据接受完毕事件时，需要将 `next()` 放在 `res.send()` 或 `res.end()` 的前面。因为在事件处理函数内部执行的代码是异步的，如果         放在后面，在 `next()` 执行之前，`res.send()` 或 `res.end()` 就已经被执行了，导致没有响应返回给客户端。







## express编写接口

### 编写`api`路由接口

#### 编写路由模块

```JavaScript
import express from 'express'
let router = express.Router()
export default {
    router
}

```

#### 导入路由模块

```JavaScript
import router from 'Router'
app.use('/api',router)
```

`app.use('/api',router)`:表示访问的时候需要加一个`/api`前缀



### 创建`get`接口

```JavaScript
import express from 'express'
const router = express.Router()

router.get(`/get`,(req,res)=>{
    const query=req.query
    res.send({
        state: 0;
        msg:'s'
        data: query
    })
})

app.use('/api',router)
app.listen(3000, () => {
    console.log('server is running at http://localhost:3000/')
})

```



网址访问:`http://localhost:3000/api/get?fasdf=fasdfa&dafs=3434`

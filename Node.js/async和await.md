## 用途

`async和await是ES7（ECMAScript 2017）`引入的新特性，用于解决异步编程的繁琐问题。async和await的作用如下：

1. async关键字：async函数是异步函数的标识，它使得函数返回一个Promise对象。async函数内部可以使用await关键字等待一个Promise对象的执行结果，而不需要使用回调函数。
2. await关键字：await用于等待一个Promise对象的执行结果，如果Promise返回的是resolved状态，则await会返回Promise的结果；如果Promise返回的是rejected状态，则await会抛出异常。

## 示例

### 创建服务器，返回`get`请求响应

```typescript
// 创建服务器
import express from 'express'
const app = express()
app.get('/', (req, res) => {
    res.send('hello world')
})
const server = app.listen(3000, () => {
    console.log('server is running at http://127.0.0.1:3000')
})


```

###  获取服务器响应的数据

```typescript
// 获取服务器响应的数据
async function getData() {
    const response = await fetch('http://127.0.0.1:3000');
    const data = await response.text();
    return data;
}
是的，这段代码使用了`async/await`语法来等待服务器响应返回。在`const response=await fetch('http://127.0.0.1:3000')`这一行代码中，`fetch()`函数被调用并返回一个Promise对象，表示将从URL获取响应。 `await`关键字会暂停该函数的执行，直到该Promise对象完成并返回结果。完成后，结果存储在`response`变量中，然后使用`await response.text()`获取响应数据并将其存储在`data`变量中。因此，在服务器响应后，`data`变量将包含响应数据。



// 调用函数
getData().then(data => {
    console.log(data);
    server.close()
}).catch(error => {
    console.error(error);
    
});

```


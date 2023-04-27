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


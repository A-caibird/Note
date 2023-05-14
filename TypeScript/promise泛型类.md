在 TypeScript 中，使用 Promise 对象采用与 JavaScript 相同的方式。Promise 是一个表示异步操作的对象，可以用来处理异步操作的结果。

Promise 对象有以下三种状态：

1. Pending：初始状态，等待结果。
2. Fulfilled：操作成功完成。
3. Rejected：操作失败。

使用 Promise 对象的一般步骤如下：

1. 创建 Promise 对象：

```typescript
promise = new Promise((resolve, reject) => {
  // 异步操作
  if (/* 操作成功 */) {
    resolve(result); // 返回结果
  } else {
    reject(error); // 返回错误信息
  }
});
```

1. 处理 Promise 对象的结果：

```typescript
promise
  .then((result) => {
    // 处理操作成功的结果
  })
  .catch((error) => {
    // 处理操作失败的结果
  });
```

示例：

```typescript

let p = new Promise((resolve, reject) => {
    //初始状态的操作
    let randomNum: number = Math.random();
    console.log('start:')


    setTimeout(() => {

        //成功
        if (randomNum < 0.5) {
            // Resolved state
            resolve(`Success! Random number: ${randomNum}`);
        } 
        //错误
        else {
            // Rejected state
            reject(`Error! Random number: ${randomNum}`);
        }
    }, 2000)
})



p.then((result) => {
    console.log(result);
}).catch((error) => {
    console.log(error);
})

```

```

// F:\CodeSpace\JS> ts-node .\1.ts 
start:
Error! Random number: 0.722926533215781
```


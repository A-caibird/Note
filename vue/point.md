# vue语法(vue2&vue3)

## Object.defineProperty

## 实现数据绑定,双向数据流

可以使用`Object.defineProperty`实现数据绑定和双向数据流。

首先，我们需要创建一个对象作为数据模型，并将其传递给`Object.defineProperty`函数。我们可以使用getter和setter属性为该对象的属性设置监听器，以便在属性发生更改时触发回调函数。例如：

```javascript
let obj = {
  value: ''
};

Object.defineProperty(obj, 'value', {
  get: function() {
    return this._value;
  },
  set: function(value) {
    this._value = value;
    console.log('Value changed to ' + value);
  }
});
```

在上述例子中，我们定义了一个名为`value`的属性，并为其设置了getter和setter。在setter函数中，我们记录了属性的新值并在控制台中打印了一条消息。

要实现双向数据绑定，我们需要在HTML表单元素中使用该属性。例如，我们可以创建一个文本输入框来与该属性进行绑定：

```html
<input type="text" id="input">
```

然后，我们可以使用JavaScript代码来捕获文本输入框中的更改，并将其反映到对象属性中：

```javascript
let input = document.getElementById('input');
input.addEventListener('input', function() {
  obj.value = input.value;
});
```

在上述代码中，我们使用`addEventListener`函数来监听文本输入框中的`input`事件。当该事件被触发时，我们将文本输入框的值赋给对象属性。由于我们已经在对象属性上设置了setter监听器，因此在属性更改时将触发回调函数，并在控制台中打印一条消息。

通过这种方式，我们已经实现了简单的双向数据绑定。当用户在文本输入框中输入新值时，该值将被反映到对象属性中，并且当对象属性更改时，该更改也会被反映到文本输入框中。

## 控制属性:enumerate 默认false

**新增属性是否可以通过循环枚举**

```JavaScript
let person={
    name:'fasfd'
}
Object.defineProperty(person,'age',{
    value:18,
    enumerable:true //(true,表示不可以被遍历)
})	
console.log(Object.keys(person)) //结果:只有name属性
for(let i in person) console.log(i) //结果:只有name
console.log(person) //结果:{name:'fafas','age':18}
```

## 控制属性:writeable: 默认false

是否可以修改

## 控制属性:configurable 默认false

是否可以删除

## 数据代理

```javascript
 let person = {
        name: 'afads',
        age:19,
    }
    let a={
        name:'aaa',
    }
    Object.defineProperty(a,'age',{
        get()
        {
            return person.age;
        },
        set()
        {
            person.age=this.age;
        }
    })
```

> 至此,以后person和a ,都是可以访问age,并且修改同步,实现a代理了person的数据

## Vue中的数据代理

>  `vue`实例通过操作data中的数据,实现数据代理,通过`ObjectProperty`调用`setter`和`getter`函数实现

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Vue App</title>
    <!-- 引入 Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- 引入 ElementUI -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
<!-- 使用 $mount 的方式 -->
<div id="app"></div>

<!-- 定义 Vue 实例 -->
<script>
    const vm=new Vue({
        data(){
            return{
                name:'fasdf',
                ad:'fdasfas'
            }
        },
        template:`
          <div>
          <div>{{name}}</div>
          <div>{{ad}}</div>
          </div>
        `
    })
    vm.$mount('#app')

</script>
</body>
</html>

```



## `el`指定组件挂载再指定的容器

```javascript
createApp(App).mount('#app')
```

在Vue.js中，`$mount`是一个实例方法，用于将Vue实例`手动`挂载到DOM元素上。



Vue实例的挂载通常是自动完成的。即当创建Vue实例时，Vue会自动搜索页面上具有`el`属性所指定的DOM元素，并将其作为Vue实例的挂载点。但是，在某些情况下，我们可能需要手动控制Vue实例的挂载过程。这时候就可以使用`$mount`方法。



`$mount`方法接收一个选择器字符串或DOM节点作为参数。它会将Vue实例挂载到这个选择器所匹配的DOM节点上。如果没有传入任何参数，则默认将Vue实例挂载到`document.body`上。

### `main.js`中创建vue实例进行挂载

```javascript
new Vue({
  template: '<div>Hello, World!</div>'
}).$mount('#app')
```

上面的代码创建了一个Vue实例，并将其挂载到`id`为`app`的DOM元素上。由于没有指定`el`选项，因此需要调用`$mount`方法来手动挂载实例。

需要注意的是，如果在创建Vue实例时已经指定了`el`选项，则不需要再调用`$mount`方法。例如：

```javascript
new Vue({
  el: '#app',
  template: '<div>Hello, World!</div>'
})
```

上面的代码创建了一个Vue实例，并将其`自动挂载`到`id`为`app`的DOM元素上。这是因为指定了`el`选项，Vue会自动将实例挂载到该元素上。



### 单个组件中挂载

```javascript
export default {
  mounted() {
    this.$mount('#div')
  },
  methods: {}
}
```





## 事件修饰符

### `@click.prevent`

阻止类似`a标签`的默认行为,点击a标签以后将不会`自动`跳转页面

### `@click.once`

**事件只是执行函数一次**:`<button @click.once="func(4,$event)">click</button>`

### `@click.stop`和事件冒泡

```vue
<div @click="func(4,$event)">
        <button @click.stop="func(4,$event)">click</button>
        </div>
// func执行alert
```

**如果不加这个修饰符,就会弹窗两次在Vue中，事件冒泡是一种事件传播机制。当一个元素上的事件被触发时，该事件会向父元素传播，并尝试在祖先元素中找到处理该事件的处理程序。**



**核心:由内往外**

例如，当你在一个按钮上绑定了一个点击事件时，当用户单击这个按钮时，该事件将首先在这个按钮上被触发，随后再依次传播给该按钮的父元素、父元素的父元素等等，直到传播到文档对象为止。当事件到达另一个具有相应事件处理程序的元素时，事件将停止冒泡并执行该处理程序，而不会再继续向上传播。

在Vue中，可以使用`@click.stop`修饰符阻止事件继续向上传播。例如：

```vue
<div @click="handleClick">
  <button @click.stop="handleButtonClick">Button</button>
</div>
```

在上面的代码中，当用户单击按钮时，`handleButtonClick`方法将会被调用，但是事件不会再向上传播到父元素中，因此`handleClick`方法不会被调用。

除了`stop`修饰符之外，Vue还提供了其他一些修饰符，包括`prevent`（阻止默认行为）、`capture`（使用捕获模式进行事件传播）和`self`（只在自己元素本身触发事件）。

### 事件捕获 `@click.capture`

```vue
 <div @click.capture="func1(4,$event)" style="height: 100px ;width:100px;background:orange">
            <button @click="func(4,$event)">click</button>
        </div>
```

**核心:由外到内,先执行外部元素事件,后执行内部元素事件**



### `@click.passive`事件立即执行,无需等待回调

```vue
 <ul style="height:160px ;background-color:red;overflow:auto" @swhile="func">
            <li>1</li>
            <li>1</li>
            <li>1</li>
            <li>1</li>
            <li>2</li>
        </ul>
<script>
export default {
    data() {
        return {
            password: '',
            length: 0,
            charset: []
        }
    },
    methods: {
        func() {
            for(let i=1;i<10000;i++){
                console.log(i)
            }
        },
    },

}
</script>

```

如果不使用`.passive`那么就会导致先执行func函数,func函数执行完以后,才会执行事件操作(这里指的是滚轮)





## 高级的输入input

>    `<input type="text" placeholder="请输入密码" v-model="password" @input="length = password.length">`

这段代码是一个 Vue 组件模板，它定义了一个文本输入框，可以让用户输入密码，并且在输入时监听了 `input` 事件，在事件处理函数中动态更新了变量 `length` 的值。 



- 具体来说： - `<input>` 标签表示文本输入框。 - `type="text"` 属性指定输入框的类型为文本输入框。 - `placeholder="请输入密码"` 属性设置了输入框的提示文本。 

- `v-model="password"` 指令将输入框的值绑定到 Vue 实例中的 `password` 变量上，即实现了数据双向绑定。 - `@input="length = password.length"` 监听了 `input` 事件，当用户在输入框中输入内容时，会触发该事件，事件处理函数会将输入框中的值的长度赋给变量 `length`。

  

- 这里使用了缩写语法 `@input` 等价于 `v-on:input`。 因此，当用户在输入框中输入密码时，Vue 实例中的 `password` 变量会被更新，而 `length` 变量则会随着输入框中的内容长度而动态更新。

### 键盘事件

### 非系统键

```vue
<input type="text" placeholder="请输入密码" v-model="password" @input="length = password.length" @keyup.enter="func" >
```

当输入完成以后,键盘敲下回车符号,密码输入完毕.

### 系统键盘

```vue
<input type="text" placeholder="请输入密码" v-model="password" @input="length = password.length" @keyup.ctrl.y="func" >
```

同时按下ctrl+y,输入生效



## Vue中的计算属性`computed`

```JavaScript
 const vm = new Vue({
        el: '#app',
        data() {
            return {
                name: '',
                address: '',
            }
        },
        methods: {},
        computed: {
            // 计算属性:需要定义一个对象,并设置getter
            full: {
                // this指向vue实例
                // 调用get的机制
                // 如果挂载在多个组件中,只调用一次get,其他从缓存中读取full的值
                //如果this.name ,this.address 变化了,贼再次调用get
                get() {
                    return this.name + this.address;
                },
                set(){
                    
                }
            }
        }
    })
```

-  计算属性:需要定义一个对象,并设置`getter`
- 调用get的机制
  - 如果挂载在多个组件中,只调用一次`get`,其他从缓存中读取full的值
  - 如果`this.name ,this.address `变化了,贼再次调用`get`

## Vue中监视属性

### 普通监视

```JavaScript
 const vm = new Vue({
        el: '#app',
        data() {
            return {
                name: '',
                address: '',
            }
        },
        methods: {},
        computed: {
            // 计算属性:需要定义一个对象,并设置getter
            full: {
                // this指向vue实例
                // 调用get的机制
                // 如果挂载在多个组件中,只调用一次get,其他从缓存中读取full的值
                //如果this.name ,this.address 变化了,贼再次调用get
                get() {
                    return this.name + this.address;
                },
                set(){
                    
                }
            }
            
        },
     //第二种
     watch: {
            name: {
                handler(newValue,oldValue) {
                    console.log(newValue,oldValue)
                }
            }
        }
    })
 
 
 //第一种
  vm.$watch('name',{
        handler(newValue,oldValue) {
            console.log(newValue,oldValue)
        }
    })
 
 
 
```

### 监视多级属性中某个下级属性

```javascript
 const vm = new Vue({
     data:{
         name:{
             a:23,
             b:34
         }
     },
     watch:{
         
         //其实data,还有name,都是key,也就是是字符串
            'name.a': {
                handler(newValue,oldValue) {
                    console.log(newValue,oldValue)
                }
            }
        }
    })
```

### 深度监视

```JavaScript
 const vm = new Vue({
     
     watch: {
            name: {
                deep:true,
                handler(newValue,oldValue) {
                    console.log(newValue,oldValue)
                }
            }
        }
    })
```



## ES6模块化标准

### 导入导出

#### 按需导入

```JavaScript
<script setup>
import { ref } from 'vue'

defineProps({
  msg: String,
})

const count = ref(0)
</script>
```

#### 全部导入:默认导入

```JavaScript
import './style.css'
import App from './App.vue'
```

#### 按需导出

```JavaScript
export let a= 'aaa'
export function func(){
    return 'a'
}
```

####  默认导出

```JavaScript
export default{
    a,
    func
}
```

### Promise函数语法

> 一个构造函数,为了解决多层回调函数(类似递归,先从执行外部函数,依次向内) 	

```javascript
let a=new Promise() ,实例对象:表示一个异步操作
```

> Promise.protype 上包含一个实例.then方法

```JavaScript
let a=new Promise() ,实例对象:表示一个异步操作
a.then(function 1,function 2)
```

> then方法,预先指定异步操作成功和失败后的回调函数

```JavaScript
a.then(sucesse,error)   第二个函数可以省略
```





## 指令

|  指令  |          区别          |                    作用                    |
| :----: | :--------------------: | :----------------------------------------: |
|  v-if  |   删除对应的dom节点    |            达到不显示元素的效果            |
|  v-on  |      单行绑定数据      | 通过修改对应的数据,让dom元素属性获得动态值 |
| v-show | 为元素添加display:none |                 元素不显示                 |
|        |                        |                                            |

## v-for

>  循环渲染多个元素

```html
<el-input v-model="input" placeholder="Please input" /><el-button>添加</el-button>
                        <ul>
                            <li v-for="item in input" :key="item.id">
                                <el-checkbox size="Small">{{ item.name }}</el-checkbox>>
                            </li>
                        </ul>
```

|  使用`:key`  | 维护列表的状态:已经选择的状态,当增加新的数据项的时候,将不会清除之前的状态(`跟踪每个节点的状态`) |
| :----------: | ------------------------------------------------------------ |
| 不使用`:key` | 会消除之前的状态                                             |
|    `key`     | key值只能`唯一`,并且最好只能是数字                           |



## 过滤器(vue3)

>  使用场景

- `v-bind`绑定的命令
- 插值语法`{{name}}`

```html
<p>{{name|func(参数)}}</p>

<script>
    export default{
        filter:{	
            func(str)
            {
                return str.Upper()
            }
         }
    }
</script>
```

> 全局过滤器,`传参`

```javascript
vue.filter('name',(str,参数)=>{

})
```

## `ref,reactive`

### 作用

`创建响应式链接数据(包含引用,本质就是引用),ref简单数据类型引用,reactive对象`

```JavaScript
let a= b 的效果与 let a=reactive(b) 都让a获取到了b的引用
```





## 破坏`ref,reactive`响应式链接效果

Based on your code, 

```JavaScript
 List.value = props.list1.filter((item) => { return item.done })
}
```





it looks like you are using `reactive` to create a reactive proxy for `List`. This means that any changes made to `List` will be properly tracked and reactive.

However, when you call the `done()` function in response to clicking the "done" button, you are updating `List` by assigning a new value directly to `List.value`. 

> 重点:   This breaks the reactivity connection between the `props.list1` array and `List`.





To fix this issue, you can try modifying the `done()` function to use `List.splice()` to modify the contents of the `List` array directly. Here's an example:

```javascript
function done() {
  List.splice(0, List.length, ...props.list1.filter((item) => { return item.done }))
}
```

This will clear the contents of `List` using `List.splice()`, and then add the filtered items from `props.list1` back into `List` using the spread operator (`...`).

By modifying the `List` array in place rather than assigning a new value, you should see the changes reflected in your `todoList` component as well.



## vue响应式实现的原理

在Vue中，响应式是通过使用ES5的 `Object.defineProperty()` 函数来实现的。这个函数可以定义一个对象的属性，可以指定属性的getter和setter函数。当属性被访问或者修改时，getter和setter函数会被触发。Vue利用这个特性来监听对象属性的变化，从而实现响应式。



在Vue中，当一个组件被创建时，Vue会遍历组件的数据对象中的所有属性，并使用 `Object.defineProperty()` 把这些属性转换为getter和setter函数。当这些属性被访问或者修改时，Vue会通知相关的组件进行重新渲染。

需要注意的是，只有在Vue的数据对象中定义的属性才会被转换为getter和setter函数，因此如果直接修改一个对象的属性而不是通过Vue的API进行修改，那么这个修改不会被Vue所监听到，也就不会触发重新渲染。

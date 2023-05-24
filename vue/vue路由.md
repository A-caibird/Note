## `vue`中的路由

### 实现原理

### 导入路由模块

#### 定义`vue`路由模块

```JavaScript
import ChildB from './components/HelloWorld.vue';
import ChildC from './components/comp.vue';

import {createRouter, createWebHistory} from 'vue-router';

const routers=createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/childb',
            component:ChildB
        },
        {
            path:'/childc',
            component:ChildC
        }
    ]
})

export default routers;
```

#### 全局导入路由[`main.js`]

```JavaScript
import router from './vuerouter'
const app=createApp(App)
app.use(router)
```

### `router`的基本使用

#### 声明式使用

```html
<template>
  <div>
    <router-link to="/childb">b</router-link> 
    <router-link to="/childc">c</router-link>

     //路由占位符,跳转的路由组件的渲染的位置    
    <router-view></router-view>
  </div>
</template>
```

注明: `<router-link>其实就是a标签`

### router高级使用

#### 路由重定向

```JavaScript
import {createRouter, createWebHistory} from 'vue-router';
const routers=createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/childb',
            component:ChildB
        },	
        {
            path:'/childc',
            component:ChildC
        },
        {
            path:'/other',
            redirect:'/childb'
        }
    ]
})
```

#### 自定义路由高亮类名

> `linkActiveClass:'router-active'`:指定`触发的路由的css样式`,在vue项目的`index.css`中设置或者`'style.css'`

```JavaScript
import {createRouter, createWebHistory} from 'vue-router';
const routers=createRouter({
    history:createWebHistory(),
    linkActiveClass:'router-active'
    routes:[
        {
            path:'/childb',
            component:ChildB
        },
        {
            path:'/childc',
            component:ChildC
        },
        {
            path:'/other',
            redirect:'/childb'
        }
    ]
})


// 在index.css或者style.css中
.active{
  background-color: red;
  font-weight: bold;
  color:white;
}
```

#### 嵌套路由`router`

```JavaScript
import {createRouter, createWebHistory} from 'vue-router';
const routers=createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/childb',
            component:ChildB,
            children:[
                {
                    path:'child',
                    component:ChildC
                }
            ]
        },
        {
            path:'/childc',
            component:ChildC
        },
        {
            path:'/other',
            redirect:'/childb'
        }
    ]
})
```

### vue动态匹配`router`

> 定义router规则时候,需要动态识别的`采用:的形式`

```JavaScript
import {createRouter, createWebHistory} from 'vue-router';
const routers=createRouter({
    history:createWebHistory(),

    routes:[
        {
            path:'/childc/:id',
            component:movie,
            props:true        //手动声明是否传参props
        },
        {
            path:'/childb',
            component:ChildB
        },
        {
            path:'/childc',
            component:ChildC
        },
        {
            path:'/other',
            redirect:'/childb'
        }
    ]
})
```

` {
            path:'/childc/:id',
            component:movie,
            props:true        //手动声明是否传参props
  },`

### 组件获得路由动态绑定的参数

>  方式1 :`props获取`

```html
<template>
    <div>
        <p>这是一个电影组件-----{{ props.id  }}</p>
    </div>
</template>
<script setup >
import { ref, onMounted } from 'vue'

let props= defineProps({
    id: {
        type: String,
        required: false
    }
})

</script>
```

> 方式2: `$route.params.id`

```html
<template>
    <div>
        <p>这是一个电影组件-----{{ route.params.id }}</p>
    </div>
</template>
<script setup >
import { ref, onMounted } from 'vue'

import { useRouter, useRoute } from 'vue-router'
const router = useRouter()
const route = useRoute()

let props= defineProps({
    id: {
        type: String,
        required: false
    }
})
</script>
```

### `组合式API编程式使用`vue route`

```JavaScript
<template>
    <div>
        <p>这是一个电影组件-----{{ $route.params.id }}</p>
        <el-button @click="goback">后退</el-button>
    </div>
</template>
<script setup >
import { ref, onMounted } from 'vue'
let props= defineProps({
    id: {
        type: String,
        required: false
    }
})

import { useRouter, useRoute } from 'vue-router'



const router = useRouter() 
const route = useRoute()
function goback(){
    router.go(-1)
}
</script>
```

### 命名路由

**路由的名字具有唯一性**

#### 命名路由实现声明式导航`{name:,params:}`

> 定义路由:`取名`

```JavaScript
const routers=createRouter({
    history:createWebHistory(),

    routes:[
        {
            name:'movie', //区一个名字
            path:'/childc/:id',
            component:movie,
            props:true
        },
        {
            path:'/childb',
            component:ChildB
        },
        {
            path:'/childc',
            component:ChildC
        },
        {
            path:'/other',
            redirect:'/childb'
        }
    ]
})
```

> 组件中使用

```html
<template>
    <div>
        <router-link :to="{name:'movie',params:{id:3}}">test</router-link>
        <p>这是一个电影组件-----{{ route.params.id }}</p>
        <el-button @click="goback">后退</el-button>
    </div>
</template>
```

1. `name,params`为声明好的属性,不需要引入route访问,这也是错的

2. **将会经过路由名字为`'movie'`跳转到对应的组件,并接受一个传参`id`**

#### 命名路由实现编程式导航`push`

```JavaScript
const router = useRouter()
const route = useRoute()

function pushWithQuery(query) {
  router.push({
    name: 'search',
    query: {
      ...route.query,
      ...query,
    },
  })
}
```

在JavaScript中，三个点`...`表示展开语法，它可以将一个数组或对象展开成单独的值。在上文提到的代码中，`...route.query`和`...query`都是使用了展开语法。

具体来说，`...route.query`将当前路由的查询参数转化为一个键值对列表，然后把这些键值对展开到了一个新的对象中。同样的，`...query`也是将参数对象中所有的键值对展开到了这个新对象中。而这两者用了扩展运算符`{...}`后，即将这两个展开后的对象进行合并，并且如果存在相同key的时候，后面的会覆盖前面的。最终生成的对象作为 `router.push()` 方法的 `query` 参数的值，这个对象中包含了所有的查询参数。

举例来说，在如下代码中：

```javascript
const obj1 = { x: 1, y: 2 };
const obj2 = { y: 3, z: 4 };

const combinedObj = {
  ...obj1,
  ...obj2,
};

console.log(combinedObj);
```

输出结果应该为：`{ x: 1, y: 3, z: 4 }`。其中，原本obj1对象中的y键值被obj2的y覆盖掉了。





这段代码是一个使用Vue 3中的`nextTick()`函数处理DOM异步更新的示例。

首先定义了一个异步函数`increment()`，其中包含一个名为`count`的响应式变量和`document.getElementById('counter')`的DOM元素。然后将`count`的值加1。

接下来调用了`await nextTick()`，可以确保在DOM渲染前等待Vue完成其异步更新队列。具体来说，当Vue更新虚拟DOM并准备将更改应用于实际DOM时，会将这些更改排入队列中。`nextTick()`函数就是用于在队列被清空之前执行回调函数。

最后，控制台输出了DOM元素的文本内容。由于使用了`await nextTick()`，此时`ele.textContent`已经被更新为1，因此控制台会输出1。

通过使用`nextTick()`函数，我们可以避免异步更新导致的DOM未能立即更新的问题，并始终获得最新的DOM状态。
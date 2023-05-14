## ts文件导入vue组件报错

> 报错信息:`Cannot find module './App.vue' or its corresponding type declarations.ts(2307),`

在TypeScript文件中导入Vue组件时，需要额外的配置才能让TypeScript识别Vue文件。这是因为TypeScript默认不知道如何处理Vue文件。以下是一些可能会帮助解决此问题的步骤：

1. 在项目根目录中创建一个名为 `shims-vue.d.ts` 的新文件。该文件应包含以下代码：
   
   ```typescript
   declare module "*.vue" {
     import { defineComponent } from "vue";
     const component: ReturnType<typeof defineComponent>;
     export default component;
   }
   ```

2. 在 `tsconfig.json` 文件中添加以下选项：
   
   ```json
   {
     "compilerOptions": {
       "module": "ESNext",
       "target": "ESNext",
       "moduleResolution": "Node",
       "esModuleInterop": true,
       "resolveJsonModule": true,
       "noImplicitAny": false,
       "strict": false,
       "skipLibCheck": true,
       "forceConsistentCasingInFileNames": true
     },
     "include": ["src/**/*", "shims-vue.d.ts"]
   }
   ```

3. 确保您的 `vue` 和 `@vue/compiler-sfc` 包已正确安装，并且已在 `package.json` 中添加了相应的依赖项。

执行以上步骤后，TypeScript将能够正确地识别导入的Vue组件。

## TypeScript 支持以下数据类型：

## 布尔类型

布尔类型表示 true 或 false 值。

```typescript
let isDone: boolean = false;
```

## 数字类型

数字类型可以是整数或浮点数。

```typescript
let decimal: number = 6;
let hex: number = 0xf00d;
let binary: number = 0b1010;
let octal: number = 0o744;
```

## 字符串类型

字符串类型用于表示文本数据，可以使用单引号或双引号来定义字符串。

```typescript
let color: string = "blue";
color = 'red';
```

## 数组类型

数组类型用于表示同一类型的元素的集合。可以使用[]或Array<type>来定义数组。

```typescript
let list: number[] = [1, 2, 3];
let list: Array<number> = [1, 2, 3];
```

## 元组类型

元组类型允许表示一个已知元素数量和类型的数组，各元素的类型不必相同。

```typescript
let x: [string, number];
x = ["hello", 10];
```

## 枚举类型

枚举类型用于定义有命名的常量集合。

```typescript
enum Color {Red, Green, Blue}
let c: Color = Color.Green;
```

## Any 类型

Any 类型用于表示不确定的类型，允许在编译时可选择地包括或排除类型检查。

```typescript
let notSure: any = 4;
notSure = "maybe a string instead";
notSure = false;
```

## Void 类型

Void 类型表示没有类型，通常用于函数没有返回值的情况。

```typescript
function warnUser(): void {
    console.log("This is my warning message");
}
```

## Null 和 Undefined 类型

Null 和 Undefined 类型分别具有 null 和 undefined 值。

```typescript
let u: undefined = undefined;
let n: null = null;
```

## Never 类型

Never 类型表示不会出现的值的类型。例如，永远不会返回的函数的返回类型可以声明为 never。

```typescript
function error(message: string): never {
    throw new Error(message);
}
```

## 函数

### 函数对象

```typescript
function add(a:number,b:number):number {
return 7;
}
```

### 匿名函数

```typescript
const add:(a:number,b:number)=>number=(num1,num2)=>{
    return 3;
}
```

### 不定参函数

```typescript
const add:(a?:number,b?:number)=>number=(num1,num2)=>{
    return 3;
}
```

## 对象

### 包含函数的对象

```typescript
let person: { age: Number; name: String; add(age: Number): void } = {
    age: 34,
    name: 'fas',
    add(age) { }
}
```

或者

```typescript
let person: { age: Number; name: String; add(age: Number): void } = {
    age: 34,
    name: 'fas',
    add(age) { }
} 
```

### 对象的可选属性

```typescript
let person: { age: Number; name: String|undefined;  } = {
    age: 34,
    name: 'fas'
}
function  shuchu(zhi:{age:Number,name1?:String})
{
    console.log(zhi.name1);
}
shuchu(person)
```

> 对象作为函数参数，需要`对象属性名一样`

## type类型别名

```typescript
type name={
    age:number,
    a:string
}
let a:name={
    age:34,
    a:'wer'
}
```

## 接口[继承]

```typescript
interface name{
    age:number,
    a:string
}
interface name2 extends name{
    z:string
}
let a:name2={
    age:34,
    a:'wer',
    z:'fas'
}
console.log(a)
```

## 元组

```typescript
let a:[string,number]=['fasd',324]
console.log(a)
```

## 类型断言

### 概念

TypeScript类型断言可以让开发者在编写代码时手动指定一个值的类型。在需要使用类型断言的地方，可以使用尖括号(<>)语法或as语法来进行声明。以下是两种类型断言的示例：

```typescript
// 尖括号语法
let myVariable: any = "this is a string";
let strLength: number = (<string>myVariable).length;

// as 语法
let myVariable: any = "this is a string";
let strLength: number = (myVariable as string).length;
```

在这里，我们将任意类型`myVariable`转换为一个字符串类型，并且使用它的长度来声明另一个变量`strLength`，这需要使用类型断言。

尖括号和as语法都可以做到这一点。当然，在某些情况下，TypeScript也会自动推断类型，因此不必使用类型断言。

### html标签类型

HTML标签对应的TypeScript类型是`HTMLElement`或者它的子接口，具体取决于使用哪个HTML元素。如果是input元素，则对应类型为`HTMLInputElement`，如果是button元素，则对应类型为`HTMLButtonElement`。此外，还可以使用通用类型`Element`表示任何HTML元素。

### vue组件类型

在Vue开发中，可以使用 `Vue.extend` 函数来创建组件，并且为了让TypeScript能够识别到组件的类型，需要定义一个接口来描述组件的选项对象。通常情况下，这个类型接口的名称与组件的名称相同。

例如，定义一个名为 `MyComponent` 的组件，它的类型接口应该像这样：

```typescript
import Vue from 'vue'

interface MyComponent extends Vue {
  // 组件选项
}
```

这里的 `MyComponent` 类型继承自 `Vue` 类型，表示这是一个Vue组件，并且还可以包含组件的选项，如 `props`、`data`、`methods` 等等。这样定义后，就可以将 `MyComponent` 作为一个泛型参数传递给 `Vue.extend` 方法，以便创建组件实例时进行类型检查。

### xx.d.ts:解决ts无法识别vue组件

```typescript
declare module "*.vue" {
  import { defineComponent } from "vue";
  const component: ReturnType<typeof defineComponent>;
  export default component;
}
```

这段代码是一个TypeScript语法的声明文件，它告诉编译器如何处理`.vue`文件，在这里我们使用了模块扩展声明。

具体来说：

1. `declare module "*.vue"` 声明了我们将要扩展的模块类型，也就是指定了所有以`.vue`结尾的文件都可以通过这个模块名来引用。
2. `import { defineComponent } from "vue";` 引入所需的依赖，这里我们需要Vue.js的`defineComponent`函数。
3. `const component: ReturnType<typeof defineComponent>;` 创建一个组件对象的常量，类型为`defineComponent`返回值的类型。这里的`ReturnType`工具类型可以获取`defineComponent`函数的返回类型，也就是组件选项对象的类型。
4. `export default component;` 将组件对象作为默认导出，使得其他地方可以通过这个模块名来引用组件。

这个声明文件的主要作用是为了让TypeScript可以正确地处理`.vue`文件，并且提供了类型提示和检查，有助于代码的可维护性和可读性。

## 字面量类型

```typescript
let a:('f'|'a')='f';
console.log(a)f
```

字符只能是'f，'a'
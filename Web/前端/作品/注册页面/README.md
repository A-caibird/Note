- [功能/实现](#功能实现)
  - [HTML](#html)
    - [表标题](#表标题)
  - [CSS](#css)
    - [指定表格边框不合并，即单元格之间会有一定的间隔。](#指定表格边框不合并即单元格之间会有一定的间隔)
    - [指定单元格之间的间隔为6像素](#指定单元格之间的间隔为6像素)
    - [块级元素的水平居中`margin: 0 auto;`](#块级元素的水平居中margin-0-auto)
    - [非块级元素 行内元素（inline）或者行内块元素（inline-block）的水平居中](#非块级元素-行内元素inline或者行内块元素inline-block的水平居中)
      - [方法一：使用父元素text-align，子元素转化为行内显示元素。](#方法一使用父元素text-align子元素转化为行内显示元素)
      - [方法二：使用flex布局](#方法二使用flex布局)
  - [JAVASCIRPT](#javascirpt)
    - [添加失去焦点事件监听器](#添加失去焦点事件监听器)
    - [中国大陆身份证合法性检验正则表达式\[function 对象可以嵌入到函数之中\]](#中国大陆身份证合法性检验正则表达式function-对象可以嵌入到函数之中)
    - [获得input标签的值](#获得input标签的值)
    - [浏览器弹窗警告](#浏览器弹窗警告)
    - [js中的函数与函数对象](#js中的函数与函数对象)
      - [不需要申明形参类型](#不需要申明形参类型)
      - [函数对象是一个类](#函数对象是一个类)
      - [匿名函数](#匿名函数)
    - [联动下拉选项框(选择籍贯)option一定要设置value](#联动下拉选项框选择籍贯)


# 功能/实现
## HTML
### 表标题
`<caption style="font-size:30px;font-weight: bold;margin-top:2px">注册</caption>`
## CSS
### 指定表格边框不合并，即单元格之间会有一定的间隔。
`border-collapse:separate;`
### 指定单元格之间的间隔为6像素
`border-spacing:6px;`只有当`border-collapse:separate;`被设定的时候才会生效;
### 块级元素的水平居中`margin: 0 auto;` 
  可以使得一个`块级元素`相对于其`父级元素`水平居中，原理是利用了外边距的自动计算机制：

  设置左右外边距为`auto`，表示让浏览器自动计算这两个外边距的值。因为左右外边距都被设置为`自动`，所以它们会尽量相等。同时，由于`外边距是在块级元素与其父级元素之间创建的`，所以这个过程会使得元素居中于其父级元素。
  
  需要注意的是，这种方式只能使得块级元素水平居中，如果要实现垂直居中或者对于非块级元素，需要使用其他的方式来实现，例如绝对定位、flex布局等。
### 非块级元素 行内元素（inline）或者行内块元素（inline-block）的水平居中
#### 方法一：使用父元素text-align，子元素转化为行内显示元素。
```css
.parent{
    text-align:center;
}
.child{
    display:inline-block
}
```
#### 方法二：使用flex布局
```css
.parent{
    display:flex;
    justify-content:center;
    align-items:center;
}

```

## JAVASCIRPT
### 添加失去焦点事件监听器
```javascript
this.ab.addEventListener(html元素的事件/字符串形式,函数,true);
```
### 中国大陆身份证合法性检验正则表达式[function 对象可以嵌入到函数之中]
```javascript
function validateID(sfzVal) {
                const reg = /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}[\dX]$/;
                return reg.test(sfzVal);
            }
```
### 获得input标签的值
```javascript
 const pass1 = this.passwordInput.value.trim();
 //注意一定要有value
```
### 浏览器弹窗警告
`alert()`

### js中的函数与函数对象
#### 不需要申明形参类型
#### 函数对象是一个类
只能声明在类中的函数，不能在类体中声明。
```javascript
function a(){}
```
#### 匿名函数
```javascript
()=>{},只能作为函数参数时候的使用，或者将这个函数赋值给一个函数对象。
```

### 联动下拉选项框(选择籍贯)

这段代码的作用是监听一个下拉列表（id为"province"）的变化，当选中其中一个省份后，根据该省份在一个JavaScript对象（cityOptions）中获取对应的城市列表，然后将这些城市渲染到另一个下拉列表（id为"city"）中。

具体做法是先清空该下拉列表原有的选项，再根据获取到的城市列表动态添加新的选项。如果该省份没有对应的城市列表，则在城市下拉列表中显示一个默认选项"请选择城市"。

> 一定要给第一个下拉选项框中的option设置value，以便从json文件中选取数据

```javascript
let provinceSelect = document.getElementById("province");
```
这行代码通过 `getElementById` 方法获取一个 id 为 "province" 的元素，并将其赋值给变量 `provinceSelect`。

```javascript
let citySelect = document.getElementById("city");
```
这行代码通过 `getElementById` 方法获取一个 id 为 "city" 的元素，并将其赋值给变量 `citySelect`。

```javascript
provinceSelect.addEventListener("change", function () {})
```
这行代码为选中省份下拉列表添加了一个 "change" 事件监听器。当该下拉列表的选项发生改变时，执行后面的回调函数。

```javascript
let cities = cityOptions[this.value];
```
这行代码根据选中的省份在 `cityOptions` 对象中查找对应的城市列表，并将其赋值给变量 `cities`。

```javascript
while (citySelect.options.length > 0) {
    citySelect.remove();
}
```
这行代码使用 `remove` 方法依次删除城市下拉列表的所有选项，直到列表为空，不需要再remove中传入参数

```javascript
if (cities) {
    for (let i = 0; i < cities.length; i++) {
        let option = new Option(cities[i], cities[i]);
        citySelect.add(option);
    }
} else {
    let option = new Option("请选择城市", "");
    citySelect.add(option);
}
```
这段代码使用循环遍历城市列表，为每一个城市创建一个新的 `Option` 元素，并将其添加到城市下拉列表中。如果该省份没有对应的城市列表，则添加一个默认选项"请选择城市"到城市下拉列表中。`new Option(value,name)`创建一个`Option对象`

最终，当用户在省份下拉列表中选择一个选项时，`会触发 "change" 事件`，并动态更新城市下拉列表中的选项。

# CSS语法总结

## CSS优先级

`继承<通配符选择器<标签选择器<类选择器<id选择器<行内样式<!important`

## 设置全局背景的方法
```scss
@mixin fullcolor {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}
.container{
    @include fullcolor;
    background:red;
}
```
## 全局清除样式

```css
      *{
            margin: 0;
            padding: 0;
        }

        html,
        body {
            width: 100%;
            min-width: 1000px;
            height: 100%;
            min-height: 400px;
            overflow: hidden; 
            overflow-y:auto;overflow-x:auto;
            // auto为自动拉伸
        }
```
## 标签居中`margin:0 auto;`

- 居中相对于的是父级元素，需要<font color=red>设置宽度</font > 
- 若采用该样式的元素未设置`width`大小将没有用处

## css原生选择器
### 后代选择器

```css
div p{
    margin:0 auto;
    text-decoration:none;
}
```

### 子代选择器

- 使用==标签==选择子代

```css
<div style="margin:0 auto;height: 500px">
    <p><a href="#">?fas</a></p>
</div>
```

```css
div p > a {
            color: red;
        }
```

- 使用标签的==id==选择子代
```css
 #div1 p > a,span {
          color: red;
      }
```

## 伪类:用做背景颜色的设置等等

```css
.a::after{
    content:"";
    position:absolute;
    top:0;
    left:0;
    z-index:-1;
}
```

## 背景图片样式设置
### 背景平铺 `background-repeat:no-repeat`

```css
 #div1 {
            color: red;
            background-image: url("1.jpg");
            background-repeat: no-repeat;
            width:30000px;
            height: 1440px;
            ackground-positio:center center
        }
```

### 背景图片显示位置`background-positio:center center`

```css
 #div1 {
            color: red;
            background-image: url("1.jpg");
            background-repeat: no-repeat;
            width:30000px;
            height: 1440px;
```

## 元素显示模式:block,inline-block,inline
| 属性                    | 效果               |
| ----------------------- | ------------------ |
| `display:block`         | 转化为块级元素     |
| `display：inline-block` | 转化为行内块级元素 |
| `display：inline`       | 转化为行内元素     |
### inline:无法设置宽度和高度,只能自适应子元素大小,
修改高度通过`line-height`

给元素设置行高不会被执行自动忽略，实际所占大小依照元素内容大小
```css
 #div1 {
            width: 100px;//被忽略
            height: 100px;
            background-color: red;  
        }
```

- 代表标签：`a,p,h,span,label`

- 代表标签 `inline、textarea、input、select、reset`
## 标签嵌套 

- [ ] `p`标签不能嵌套其他标签
- [ ] `a标签可以嵌套出了自己（a）以外的其他标签`

## SS继承性

- [ ] `a`标签不会继承父级元素的颜色属性
- [ ] `h`标签不会继承父级元素字体大小属性 `font-size`


## 两种盒子模型

```css
div {
            width: 100px;
            height: 100px;
            background-color: #00b7ee;
            margin: 0 auto;
            border:1px solid #000;
            padding:10px 10px 10px 10px;
            box-sizing:border-box; //这里不同
    /*

}
```

`box-sizing` 是一个 CSS 属性，用于设置元素的盒模型大小计算方式。它有两个取值：`content-box` 和 `border-box`,前者为标准盒子模型,后者为怪异盒子模型,

### 标准盒子模型:(少用,为了保持元素和外边框的边距少用这个)

 `content-box` 是默认值，它表示元素的宽度和高度只包括内容区域（content），不包括边框（border）和内边距（padding）。也就是说，当你设置一个元素的宽度为 100px 时，它的内容区域宽度就是 100px，而整个元素的宽度则是内容宽度加上边框和内边距的宽度。这意味着，如果你设置了边框或内边距，就会导致元素的实际宽度比你设置的宽度更宽。

### 怪异模型
`border-box` 表示元素的宽度和高度包括内容区域、边框和内边距，也就是说，当你设置一个元素的宽度为 100px 时，它的实际宽度就是 100px，包括了内容宽度、边框和内边距的宽度。这样设置可以让开发者更方便地控制元素的尺寸，避免因为边框和内边距的加入而导致元素的尺寸不准确。

总的来说，`box-sizing` 的作用是控制元素的盒模型大小计算方式，从而更方便地控制元素的尺寸。

当你需要设置边框和内边距时，使用 `border-box` 可以更好地控制元素的实际尺寸，避免出现意外的布局问题.



## 修改`inline`行内标签元素垂直位置

```css
//只能通过修改属性line-height来实现，margin-top and bottom 都是无效的，padding也是无效的
```




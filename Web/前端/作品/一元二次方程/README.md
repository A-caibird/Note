# 知识点
- 伪类
```css
input[type="reset"]:hover {
            background-color: #cc2e26;
        }
```
- 横向分布flex布局
```html
 <div style="display: flex; flex-direction:row;text-align: center">
 ```
 - 刷新页面
```html
<input type="reset" value="重置" onclick="location.reload()" style="margin-right: 125px " id="e">
```
- JavaScript读取html元素
```javascript
  var a = document.getElementById("a").value;
  // a为html中元素id
```
- JavaScript中html元素属性
```javaScript
error.innerHTML="FDAFAS"
//这段代码的意思是将一个字符串 "方程无实数解" 赋值给名为 result 的 HTML 元素的 innerHTML 属性。这通常用于在网页中显示一些文本或消息。在这种情况下，该消息表示方程没有实数解。
```
- javascipt设置css
```javascript
            error.style.color = "red";
            error.style.marginTop = "35px";
            error.style.marginLeft = "40px";
            error.style.marginRight = "40px";
            error.style.fontSize = "18px";
            error.style.textAlign = "center";
            error.style.width = "10000px";
            error.style.padding = "10px";
            error.style.padding = "10px";
```   
- 设置窗口边框阴影
```html
box-shadow: 0px 0px 5px #999;
```

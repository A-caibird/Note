- [知识点](#知识点)
  - [js创建视频元素,并悬浮显示于网页上,长按鼠标左键可拖动](#js创建视频元素并悬浮显示于网页上长按鼠标左键可拖动)
    - [创建视频元素](#创建视频元素)
    - [设置视频框元素出现的位置](#设置视频框元素出现的位置)
    - [设置鼠标初始位置](#设置鼠标初始位置)
    - [添加视频元素到html body中](#添加视频元素到html-body中)
    - [绑定鼠标按下事件到video元素中](#绑定鼠标按下事件到video元素中)
      - [`clientx,clienty`:鼠标的客户端坐标](#clientxclienty鼠标的客户端坐标)
      - [`getBoundingClientRect()` 返回值](#getboundingclientrect-返回值)
    - [给html文件绑定鼠标移动事件](#给html文件绑定鼠标移动事件)
    - [html文件绑定鼠标暂停移动事件](#html文件绑定鼠标暂停移动事件)

# 知识点

## js创建视频元素,并悬浮显示于网页上,长按鼠标左键可拖动

### 创建视频元素

```JavaScript
 let video = document.createElement('video');
            video.src = 'xigua.mp4';
            video.controls = true;
```

`  video.controls = true;`给视频元素添加控制属性,如播放,暂停,回退,前进等等.

### 设置视频框元素出现的位置

```JavaScript
 video.style.position = 'fixed';
            video.style.top = '50%';
            video.style.left = '50%';
            video.style.transform = 'translate(-50%, -50%)';
```

### 设置鼠标初始位置

```JavaScript
let isDragging = false;
 let mouseOffset = { x: 0, y: 0 };// 记录视频元素相对于显示器的位置
```

### 添加视频元素到html body中

```javascript
   document.body.appendChild(video);
```
### 绑定鼠标按下事件到video元素中

```JavaScript
   video.addEventListener('mousedown', function(e) {
                if (e.target === video && e.button === 0) {
                    isDragging = true;
                    let rect = video.getBoundingClientRect();
                    mouseOffset.x = e.clientX - rect.x;
                    mouseOffset.y = e.clientY - rect.y;
                }
            });
```

这个命令将 mousedown 事件绑定到 `video` 元素上，当鼠标左键按下时触发。具体来说，它使用 `addEventListener()` 方法将一个匿名函数作为回调函数绑定到元素的 mousedown 事件上。



在回调函数中，首先检查事件触发源是否是 `video` 元素，并且鼠标按下的是左键（即 `e.button === 0`）。如果条件成立，则将变量 `isDragging` 设置为 `true`，表示用户正在拖动视频。



接下来，计算鼠标点击位置相对于视频元素左上角的水平和垂直偏移量。具体来说，`e.clientX` 和 `e.clientY` 分别表示鼠标点击位置相对于`视口左上角`的水平和垂直坐标，而 `rect.x` 和 `rect.y` 分别表示视频元素左上角相对于视口左上角的水平和垂直位置。



> 因此，通过将鼠标点击位置的坐标减去视频元素左上角的坐标，可以得到`鼠标点击位置相对于视频元素左上角的偏移量`。这些偏移量被保存到 `mouseOffset` 对象的 `x` 和 `y` 属性中。

#### `clientx,clienty`:鼠标的客户端坐标

#### `getBoundingClientRect()` 返回值

返回一个包含 `top`、`bottom`、`left`、`right`、`x` 和 `y` 属性的 DOMRect 对象。其中，`x` 和 `y` 属性表示元素左上角相对于视口左上角的水平和垂直距离





###  给html文件绑定鼠标移动事件

```JavaScript
 document.addEventListener('mousemove', function(e) {
                if (isDragging && e.buttons === 1) {
                    let x = e.clientX - mouseOffset.x;
                    let y = e.clientY - mouseOffset.y;
                    video.style.left = Math.max(0, Math.min(x, window.innerWidth - video.offsetWidth)) + 'px';
                    video.style.top = Math.max(0, Math.min(y, window.innerHeight - video.offsetHeight)) + 'px';
                }
            });
```

>  x,y使用鼠标移动时的相对于左上角的距离减去此时鼠标距离视频元素左上角的x,y的距离. `故表示此时视频元素的相对于左上角的绝对距离`

### html文件绑定鼠标暂停移动事件

```JavaScript
document.addEventListener('mouseup', function() {
                isDragging = false;
            });
```


# CSS
## 布局
### flex布局
```css
.container {
  display: flex;
  flex-direction: column; /* 将主轴改为纵向 */
  justify-content: center; /* 元素沿着交叉轴居中 */
  align-items: center; /* 元素沿着主轴居中（可选） */
}
```
在 Flexbox 布局中，交叉轴(cross axis)是与主轴(perpendicular to the main axis)垂直的轴。主轴和交叉轴定义了元素在容器内的位置。

如果设置 `justify-content: center` 让元素沿着交叉轴居中，这意味着 Flex 容器中所有子元素将在 Flex 容器的交叉轴上居中对齐。

举个例子，假设我们有一个 Flex 容器，它的主轴方向是水平的(`flex-direction: row`)，交叉轴方向是垂直的。此时，我们可以使用 `justify-content: center` 让容器内的所有子元素在竖直方向上居中对齐，即使它们在水平方向上可能不是完全对齐的。

同样地，如果我们设置了 `flex-direction: column`，那么 Flex 容器的主轴方向将变为垂直的，交叉轴方向将变为水平的。这时，使用 `justify-content: center` 可以让容器内的所有子元素在水平方向上居中对齐。
### Grid布局

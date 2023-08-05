`display: contents;` 是一种 CSS 属性，用于在布局中隐藏元素的外部包装容器（wrapper container），并使其子元素直接成为父元素的子元素。

当你将 `display: contents;` 应用于一个元素时，该元素本身将不会产生任何盒模型，而是将其子元素提升到与该元素的父元素同级。这意味着该元素的样式和布局属性将不再影响其子元素，而是直接应用于父元素。

以下是一个示例：

```html
<div class="wrapper">
  <h1>Title</h1>
  <p>Content</p>
</div>
```

```css
.wrapper {
  display: contents;
}
```

在上述代码中，`.wrapper` 元素被应用了 `display: contents;` 属性。这将导致 `.wrapper` 元素本身在布局中不可见，而其子元素 `<h1>` 和 `<p>` 直接成为父元素的子元素，继承了 `.wrapper` 元素的样式和布局属性。

需要注意的是，`display: contents;` 的支持程度有限。它的主要用途是在 CSS Grid 或 Flexbox 布局中，当你希望某个元素成为网格单元或 flex item，但又不希望该元素创建一个额外的包装容器时，可以使用该属性。

总结起来，`display: contents;` 是一种 CSS 属性，用于隐藏元素的外部包装容器，直接将子元素提升为父元素的子元素，从而继承父元素的样式和布局属性。
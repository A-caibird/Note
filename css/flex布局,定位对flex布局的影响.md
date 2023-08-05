# [flex 布局](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_flexible_box_layout/Basic_concepts_of_flexbox#flex_元素属性：flex-grow)
##  主轴方向 `flex-wrap:row nowrap`
   
   这是`display:flex`初始样子,主轴为水平,不换行;如果子元素宽高过长溢出就会溢出,**会压缩子元素的宽度和高度**
##  flex子元素水平拉伸属性: `flex-basis`  
   
   写在flex布局的下的**子元素**,以下选择的属性,
  
   /* 指定<'width'> */
   - flex-basis: auto;根据子元素自动扩展
   - flex-basis: 10em;
   - flex-basis: 3px;
   - flex-basis: auto;根据子元素自动扩展
  
   /* 固有的尺寸关键词 */
   - flex-basis: fill;
   - flex-basis: max-content;
   - flex-basis: min-content;
   - flex-basis: fit-content;
   - /* 在 flex item 内容上的自动尺寸 */
   - flex-basis: content;
  
   /* 全局数值 */
   - flex-basis: inherit; 继承最近父元素的 flex-basis 值
   - flex-basis: initial;
     
     表示将 flex-basis 值重置为其初始值，即自动计算伸缩项的大小。通常情况下，这个值等价于 flex-basis: auto;

   - flex-basis: unset;

   - flex-basis: unset;
  
     默认情况下，它等价于 flex-basis: auto;，但是在使用 flex 缩写属性时，它可能会等价于 flex-basis: 0
##  flex子元素伸展属性`flex-grow`:基于`flex-basis`
   flex-grow 若被赋值为一个**正整数**，flex 元素会以 flex-basis 为基础，沿主轴方向增长尺寸。这会使该元素延展，并占据此方向轴上的可用空间（available space）。如果有其他元素也被允许延展，那么他们会各自占据可用空间的一部分。

如果我们给上例中的**所有元素设定 flex-grow 值为 1**，容器中的可用空间会被这些元素**平分**。它们会延展以填满容器主轴方向上的空间。

## flex子元素压缩属性:`flex-shrink`
flex-grow属性是处理 flex 元素在主轴上增加空间的问题，相反flex-shrink属性是处理 flex 元素收缩的问题。如果我们的容器中没有足够排列 flex 元素的空间，那么可以把 flex 元素**flex-shrink属性设置为正整数来缩小它所占空间**到flex-basis以下。与flex-grow属性一样，可以赋予不同的值来控制 flex 元素收缩的程度 —— 给flex-shrink属性赋予更大的数值可以比赋予小数值的同级元素收缩程度更大。


负值是不被允许的
```css
flex-shrink: 2;
flex-shrink: 0.6;

/* Global values */
flex-shrink: inherit;
flex-shrink: initial;
flex-shrink: unset;
```

## flex属性简写
Flex 简写形式允许你把三个数值按这个顺序书写 — flex-grow，flex-shrink，flex-basis:
`flex:1 0 auto`

## flex对齐属性
控制对齐的属性本指南中的属性如下。

justify-content - 控制主轴（横轴）上所有 flex 布局下的元素的对齐。

align-items - 控制交叉轴（纵轴）上所有 flex 布局下的元素对齐。

align-self - 控制交叉轴（纵轴）上的单个 flex 布局下的元素对齐。 //align-self:stretch  /* 该项在交叉轴上拉伸以填充可用空间 */

align-content - 控制“多条主轴”的 flex 布局下的元素在交叉轴的对齐。

## fixed定位,absolute定位

这些定位作用于flex布局下的任意元素会影响到整体的flex布局方式,调整相对位置用position:relative,或者用margin去调整
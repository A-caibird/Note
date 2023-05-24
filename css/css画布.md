## 全局清除样式

```css
 *     {
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
        }
```

## 设置画布

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>流星雨</title>
    <style>
        * {
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
        }

        // 画布
        .container {
            position: relative;
            height: 100%;
        }

        .container #div1 {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 900;
            background:rgba(214, 36, 36, 0.8)
        }
    </style>
</head>

<body>
    <div class="container">
        <div id="div1"></div> //画布
    </div>
</body>

</html>
```

## 渐变色背景设置

```css
 background: linear-gradient(rgb(242, 244, 246), rgba(174, 214, 243, 0.8), rgba(60, 163, 232, 0.5));
```

## css样式层叠

```css
z-index:100;
```

> 规则: `z-index的值越大，则样式越靠上`

## 添加阴影

```css
box-shadow 属性向框添加一个或多个阴影。

box-shadow: 0 0 20px color; //常用
```

> `box-shadow: h-shadow v-shadow blur spread color inset;`

> | `h-shadow` | `必需。水平阴影的位置。允许负值。`    |
> | ---------- | ------------------------------------- |
> | *v-shadow* | `必需。垂直阴影的位置。允许负值。`    |
> | *blur*     | `模糊距离`                            |
> | color      | 可选。阴影的颜色。请参阅 CSS 颜色值。 |
> | `inset`    | 外部阴影向内模糊 `**常用**`           |


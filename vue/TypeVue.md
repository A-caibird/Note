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



获取指定类型的响应式ref：`import type{ Ref } from 'vue';`


```typescript
<template>
    <div ref="myDiv">This is my div element.</div>

    <button @click="showDiv">Show Div</button>
</template>
  
<script setup lang="ts">
import { ref } from 'vue';
import type{ Ref } from 'vue';
const myDiv: Ref<HTMLElement | null> = ref(null);

function showDiv() {
    console.log(myDiv.value?.innerHTML);
}

</script>
  
```


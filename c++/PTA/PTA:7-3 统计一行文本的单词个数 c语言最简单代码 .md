# 题目

本题目要求编写程序统计一行字符中单词的个数。所谓“单词”是指连续不含空格的字符串，各单词之间用空格分隔，空格数可以是多个。

--------

# 样例输入

```cpp
Let's go to room 209.
```
----

# 样例输出

```cpp
5
```

-----

# 样例种类

- [ ] 单词间多个空格分割
- [ ] 句子首尾可能有空格但是也可能没有
- [ ] 句子可能有多行
- [ ] <b><font color=red >可能存在多行句子[对于此种算法这个例子很重要]</font></b>

------

# 问题分析

1. 首先，我们这样思考如果一个单词后面有空格我们则单词数量++。设f1，f2分别表示是否出现了非空格字母，和空格字母，出现为1。
2. 思考我们判定单词的方法，也就是空格出现前有字母出现，才能算一个.所以,我们执行以下代码`
if(c==' '&&f1) f2=1;
 `
3. 当有字母出现那肯定f1=1=f2=1,出现以后让f1=f2=0，重置状态，
4. <b><font color=red >特殊情况：</font></b>就是句子最后不是空格结尾，是其他字母，那就要单词数量+1，最后一个单词没有算上嘛。用`a[i]记录`最后一个出现的 非EOF与'\n' 字符

------

# AC代码

```cpp
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>
// #pragma GCC optimize(1)
// #pragma GCC optimize(2)
// #pragma GCC optimize(3,"ofast","inline")
#define ifor(i, l, r) for (int i = l; i <= r; ++i)
#define rfor(i, r, l) for (int i = r; i >= l; --i)
#define _SILENCE_CXX20_CISO646_REMOED_WARNING
typedef unsigned long long ull;
typedef long double doubleL;    
typedef long long ll;
const long long N = 2e+5;

int main()
{
    int f1=0,f2=0;
    char c;
    int total=0;
    int i=0;
    char a[1000];
    while((c=getchar())!=EOF)
    {
        
        if(c!=' ') f1=1; 
        //不需要如果不是就让f1=0，这样如果下一个字母是空格，直接就f1=0了，你就不知道空格前面的到底有没字母
        if(c==' '&&f1) f2=1;
        else f2=0;
        
        if(f2&&f1)
        { total++;f2=f1=0;}
        if(c!='\n') {a[i]=c;    i++;}//用于判断最后一个字符是不是可见字符，换行这些一定排除在外
    }
    if(a[i-1]!=' ')++total;//也就是说这个字符可以见
    printf("%d",total);
    return 0;
}
```


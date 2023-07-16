# [题目详情 - 7-4 查找书籍 (pintia.cn)](https://pintia.cn/problem-sets/1602920136007483392/exam/problems/1602920196917161989)

&emsp;&emsp;给定n本书的名称和定价，本题要求编写程序，查找并输出其中定价最高和最低的书的名称和定价。

# 输入格式

&emsp;&emsp;输入第一行给出正整数n（<10），随后给出n本书的信息。每本书在一行中给出书名，即长度不超过30的字符串，随后一行中给出正实数价格。题目保证没有同样价格的书。

```cpp
3
Programming in C
21.5
Programming in VB
18.5
Programming in Delphi
25.0
```

### 输出格式

```javascipt
25.00, Programming in Delphi
18.50, Programming in VB
```



> **核心问题**

&emsp;&emsp;如何读取含有空格的字符串

>  **解决方法**

&emsp;&emsp;使用scanf函数的高级用法

```cpp
 scanf("%[^\n]",s[i]);
 getchar();
 scanf("%lf",&jia);
 getchar();  
 //需要注意的是一定要清除缓冲区的换行字符啊
```

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
char a[1000][10000];

typedef struct stu
{
    char a[100];
    char b[100];
    int grade;
} stu;
int main(int args, char *argv[])
{
    int n;
    scanf("%d", &n);
    getchar();                                   //一定要注意清除换行符号，不然打死这个题都要错
    char s[100][100];
    double jia,xiao=35125,da=-413;
    int p1,p2;
    for(int i=1;i<=n;i++)
    {
        scanf("%[^\n]",s[i]);
        getchar();
        scanf("%lf",&jia);
        getchar();
        
        if(n==1)
        {
            printf("%.2lf, %s\n",jia,s[i]);
            printf("%.2lf, %s",jia,s[i]);
            return 0;
        }
        if(jia<xiao)
        {
            xiao=jia;
            p1=i;
        }
        if(jia>da)
        {
            da=jia;
            p2=i;
        }
    }
    printf("%.2f, %s\n",da,s[p2]);
    printf("%.2f, %s",xiao,s[p1]);
    return 0;
}

```


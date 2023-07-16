# 函数：malloc，free
# 样例展示
```cpp
#include <cstdio>
#include<cstdlib>
#include<iostream>
using  namespace std;
int main()
{
	
	int* p = (int*)malloc(sizeof(int) * 4);
	if (p == NULL) { string a=strerror(errno); }
	else {
		for (int i = 0; i < 4; i++)
		{
			*(p + i) = i;
		};
	}
	free(p);
	//#include<cstdlib>
	//p 指针指向不能改变。只能刚开始的空间原地址
	//若是p++，则free（p) is false.
	p = NULL;
	//free function only  liberate mermory space,
	//but pointer is 
	int *shu=(int *)malloc(40);
	int* j = (int*)realloc(shu, 400);
	//realloc修改开辟的空间大小的时候，如果加上原来的空间的后面剩余空间的大小
	//够用了，则返回shu（原来的地址），否则从新开辟一个空间，空间首地址改变。
	//realloc开辟空间失败返回NULL



	int m;
	cin	 >> m;
	return 0;	
}	
```

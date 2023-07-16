# 介绍 

&emsp;&emsp;C 库宏 offsetof(type, member-designator) 会生成一个类型为 size_t 的整型常量，它是一个结构成员相对于结构开头的字节偏移量。成员是由 member-designator 给定的，结构的名称是在 type 中给定的。

# 函数模板

size_t&emsp;offsetof(type, member-designator)
---

# 样例

```cpp
#include<cstdio>
#include<iostream>
using namespace std;
#include<cstdlib>
#include<cstring>
#include<cmath> 
#include<cstddef>
struct student1;


int main()
{
	typedef	struct student
	{
		char name[20];
		double grade;

	}stu;
	stu student1;
	const int n = 3;
	stu studentnum[3] = { {"lian",20},{"cgy",49}, {"cgy4",78.9} };
	int k = 0, temp, i, j;

	cout << sizeof(student1) << endl;
	cout << offsetof(struct student, name)<<endl;
	/*for (i = 0; i < n; i++)
	{
		k = i;
		for (j = i + i; j < n; j++)
		{
			if (studentnum[j].grade > studentnum[k].grade)
			{
				k = j;
			}

		}
		temp = studentnum[k].grade;
		studentnum[k].grade = studentnum[i].grade;
		studentnum[i].grade = temp;
	}*/
	for (int m = 0; m < n; m++)
	{
		cout << studentnum[m].grade << " ";
	}

	int m = 0;
	scanf_s("%d", &m);
	return 0;
}
```


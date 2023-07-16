#include<cstdio>
#include<iostream>
using namespace std;
#include<cstdlib>
#include<cstring>
#include<cmath> 
#include<cstddef>
struct student1
{
	char name[10];
	int chengji[2];
	float aver;
};
// you can don not initialize this struct array.for instance ,student[]

const int N = 3;
int main()
{
	void shuru(struct student1 stu[], int num1);
	int max(student1 stu[], int num);
	void print(student1 stu1[], int num1);

	student1 student[N];
 shuru(student, N);
 int sort = max(student, N);
 print(student, sort);
	int m;
	cin >> m;
	return 0;
}
void shuru(struct student1 stu[],int num1)
{
	int i, j;
	for (i = 0; i < num1; i++)
	{
		
		//C language can only use "=" to initialize variables when defining a character array,
//In other cases, you cannot directly use "=" to assign values to character arrays.
		cin >> stu[i].name;
		//struct char array initializtion.
		for (j = 0; j < 3; j++)
		{
			 stu[i].chengji[j]=j+45;
		}
		stu[i].aver = (stu[i].chengji[0] + stu[i].chengji[1] + stu[i].chengji[2]) / 3.0;
		
	}
	
	
}
int max(student1 stu[], int num)
{
	int num1=0;
	for (int i = 1; i < N; i++)
	{
		if (stu[num1].aver <stu[i].aver) { num1 = i; }
	}
	return(num1);
}
void print(student1 stu1[],int num1)
{
	cout << stu1[num1].name;
}

//struct student *p=(struct student*)stu.name 结构体指针指向结构体成员,强制类型转化

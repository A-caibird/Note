#include <cstdio>
#include<cstdlib>
#include<iostream>
using  namespace std;
int main()
{
	union nu{
		char c;
		int m;
		 char m1[7];
	}a={'a'};
	//a={'a',12} this expression is false .you can only use one member in  same time
	cout << a.c << endl;
	//the result signifies members in union are in the same starting memory address .
	cout << sizeof(a)<<endl;
	//sizeof（a）所有成员中最大对齐数的整数倍，
	//数组成员最大对齐数是其中一个元素 char a[], 最大对齐数为1。
        //共用体中被存储的变量值，是最后一次被赋值的变量
        int m;
	cin >> m;
	return 0;
}

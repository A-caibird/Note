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
	int chengji;
}student[] = { {"sid",45},{"sahk",1239}};
// you can don not initialize this struct array.for instance ,student[]

int main()
{
	struct student1* p = student;
	for (p; p < student + 2; p++)
	{
		cout << ( * p).name << endl;
		cout << p->name << endl;
		// expression cout<<p.name or *p.name <<endl; is false.
	}
	int m = 0;
	scanf_s("%d", &m);
	return 0;
}

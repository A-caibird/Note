#include <cstdio>
#include<cstdlib>
#include<iostream>
using  namespace std;
//int main(void)
//{ 
//	enum day {
//		mon,tue,wed,thu,fri,sat
//
//	}day1,day2;
//	day1 = wed;
//	day2 = mon;
//	if (day1 > day2) { cout << day1<<endl; }
//	//the expresion printfs the index of the enum day member(for instance,mon,tue)
//	day1 = day2;
//	cout << day1;
//	int i = day1;
//	//you can assign enum to int ,or char.
//	cout << endl << sizeof(day);
//	//size of enum type is vary value.
//	return 0;
//}
int main()
{
	enum qiu {
		red, ye, blue, white, black

	};
	int i, j, k,fangan=0;
	for (i = red; i <= black; i++)
	{
		for (j = red; j <= black; j++)
		{
			for (k = red; k <= black; k++)
			{
				if (i != j && i != k && k != j) { fangan++; }
			}
	    }
	}
	cout << fangan;
	int m;
	cin >> m;
	return 0;
} 


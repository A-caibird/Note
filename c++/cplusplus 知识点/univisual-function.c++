#include<iostream>
#include<iomanip>
using std::setw;
using namespace std;
template <typename T>//Universal function
//不定类型的变量参数
T jiafa(T x, T y, T z=0.3)//Actual parameter pre-assignment
{
	double a;

	a = x + y+z;
	return(a);
}
int main()
{
	float x, y,z,c;
	cin >> x >> y;
	c = jiafa(x, y);
	cout <<setw(5)<< c<< endl;
}

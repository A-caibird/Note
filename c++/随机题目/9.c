#include<iostream>
#include <string>
#include<vector>
using namespace std;
int main (){
    string a;
    cin>>a;
    int sum=0;
    for(int i=0;i<a.length();i++){
        sum+=a[i]-'0';
    }
    string arr[]={"ling","yi","er","san","si","wu","liu","qi","ba","jiu"};
    string s=to_string(sum);
    for(int i=0;i<s.length();i++){
        if(i!=0) cout<<" ";
        cout<<arr[s[i]-'0'];
    }
}
字符串转化为数字，以及string下标引用字符串字母；字符加减转化为数字


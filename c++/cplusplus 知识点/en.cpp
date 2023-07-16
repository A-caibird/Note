#include <stdio.h>
#include <string.h>

int main() {
    void trun(int array[],int num1,int num2);
    int a[100];
    int *p=a;
    for(p;p<a+10;p++)
    {
        scanf("%d",p);
    }
    trun(a,10,3);
    for(p=a;p<a+10;p++)
    {
        printf("%d",*p);
    }
    return 0;
}
void trun(int array[],int num1,int num2)
{
    int *a=array;
    int aend=*(a+num1-1);
    for(int i=num1-1;i>0;i--)
    {
        *(a+i)=*(a+i-1);
    }
    *a=aend;
    num2--;
    if(num2>=1)
        trun(array,num1,num2);
}

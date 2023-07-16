#include<stdio.h>
#include <ctype.h>
#include<cstring>

int main(void) {
    char a[100], b[100];
    gets(a);
    gets(b);
    int min = strlen(a) < strlen(b) ? strlen(a) : strlen(b);
    int tamp;
    //
    if (strlen(a) < strlen(b)) tamp = 1;
    else if (strlen(a) > strlen(b)) tamp=-1;
    else tamp = 0;
    //
    int times = 0;
    int cha = 0;
    int chu=0;
    //
    for (int i = 0; i < min; i++) {
        if (a[i] > b[i]) {
            chu=1;
            cha = a[i] - b[i];
            printf("a>b  %d\n", cha);
            break;
        } else if (a[i] < b[i]) {
            chu=1;
            cha = a[i] - b[i];
            printf("a<b  %d\n", cha);
            break;
        } else { times++; }
    }
    //判断
    
    if (times == min && tamp ==0)
        printf("a=b");
    //只有两个数组每一个元素相等的时候，且数组大小相等的时候才会相等
    else {
        if(tamp==1&&chu!=1) printf("a<b");
        //要是数组大小不相等，但是数组之间对应元素相同的时候，则数组实际长度长的，就更大。
        if(tamp==-1&&chu!=1) printf("a>b");
    }
        return 0;
}






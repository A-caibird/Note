#include <cstdio>
#include <ctype.h>
#include <cstring>
    
int main() {
    char a[5][5];
    for(int i=0;i<5;i++)
    {
        gets(a[i]);
    }
    for(int i=0;i<4;i++)
    {
        for(int j=0;j<5-i;j++)
        {
            if(strcmp(a[j],a[j+1])>0)
            {
                char al[100];
                strcpy(al,a[j]);
                strcpy(a[j],a[j+1]);
                strcpy(a[j+1],al);
            }
        }
    }
    for(int i=0;i<5;i++)
    {
        puts(*(a+1));
    }
    return 0;
}


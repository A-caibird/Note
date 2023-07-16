#include <cstdio>
#include <ctype.h>
#include <cstring>

int main() {
    char a[5][5];
    char *name[5];
    for(int i=0;i<5;i++)
    {
        name[i]=a[i];
        gets(name[i]);
    }
    for(int i=0;i<4;i++)
    {
        for(int j=0;j<4-i;j++)
        {
            if(strcmp(*(name+j),*(name+j+1))>0)
            {
                char *p;
                p=name[j];
                name[j]=name[j+1];
                name[j+1]=p;
            }
        }
    }
    for(int i=0;i<5;i++)
    {
        puts(name[i]);
    }
    return 0;
}


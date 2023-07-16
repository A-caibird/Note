#include <iostream>
#include <cstring>
#include<cstdio>

using namespace std;

void change(char **num1, char **num2);
char *name[] = {"rdsfafasfa", "t4851asd", "ca498456"};
char *name23[] = {"rdsfa1fasfa", "t48151asd", "ca4984856"};
int main() {

    char **string1 = name;
    if(strcmp(*string1,*(string1+1))>0) change(string1,(string1+1));
    printf("%s\n",*(string1+1));
    if(strcmp(*(string1+1),*(string1+2))>0) change((string1+1),(string1+2));
    printf("%s\n",*(string1+1));
    if(strcmp(*(string1+0),*(string1+1))>0) change((string1+0),(string1+1));
    printf("%s\n",*(string1+1));
    for(int i=0;i<3;i++)
    {
        printf("%s\n",*(string1+i));
    }
    return 0;
}

void change(char **name1,char **names) {
    char **tamp=name23;
    *tamp=*name1;
    *name1=*names;
    *names=*tamp;
}


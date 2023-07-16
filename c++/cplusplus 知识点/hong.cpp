    #include <stdio.h>
    #define chang(a,b) {a+=b;b=a-b;a=a-b;}
    int main(void)
    {
        int a,b;
        scanf("%d %d",&a,&b);
        chang(a,b);
        printf("%d %d",a,b);
        return 0;
    }

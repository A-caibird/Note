#include<stdio.h>


int main(void) {
    int n;
    scanf("%d", &n);
    int a[n][n];
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            a[i][j] = 0;
        }
    }
    i = 0;
    j = n / 2;
    a[0][j] = 1;

    for (int k = 2; k <= n * n; k++) {
        i = i - 1;
        j = j + 1;
        if (i < 0 && j > n - 1) {
            i += 2;
            j=j-1;
        } else {
            if (i < 0) i = n - 1;
            if (j > n - 1) j = 0;
        }
        if (a[i][j] == 0) {
            a[i][j] = k;
        } else {
            i = i + 2;
            j=j-1;
            a[i][j] = k;
        }
    }
    printf("\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++)
            printf("%5d ", a[i][j]);
        printf("\n");
    }
    return 0;
}







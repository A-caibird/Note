## 注意：文件写入路径最好是绝对路径，Absolute path
```c
#include <stdio.h>
#include <math.h>

int main() {
    FILE *fp1, *fp2;
    float num;
    fp1 = fopen("F:\\Code\\cpp\\consle\\f1.txt", "r"); // 打开文件f1.txt，以只读模式打开
    fp2 = fopen("F:\\Code\\cpp\\consle\\f2.txt", "w"); // 打开文件f2.txt，以只写模式打开
    if(fp1 == NULL || fp2 == NULL) { // 判断文件是否打开成功
        printf("fail！");
        return -1;
    }
    while(!feof(fp1)) { // 读取文件f1.txt中的所有实数
        fscanf(fp1, "%f", &num);
        num = round(num); // 四舍五入取整
        fprintf(fp2, "%.0f\n", num); // 将取整后的数写入文件f2.txt中
    }
    fclose(fp1); // 关闭文件f1.txt
    fclose(fp2); // 关闭文件f2.txt
    printf("data had stored f2.txt");
    return 0;
}
```

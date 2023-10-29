# 实验1：编写一个简单的程序实现管道的创建与读写方法
```cpp
#include <cassert>
#include <fstream>
#include <iostream>
#include <string>
#include <sys/wait.h>
#include <unistd.h>
#define BUFFERSIZE 257
int main(int argc, char *argv[]) {
    int pipefd[2];
    char buffer[BUFFERSIZE]; // 存子进程写入的消息

    // 父进程创建匿名管道
    if (pipe(pipefd) == -1) {
        std::cout << "管道创建错误\n";
        exit(2);
    }

    //创建子进程
    pid_t p1 = fork();
    if (p1 < 0) {
        std::cout << "子进程创建失败" << std::endl;
        exit(1);
    } else if (p1 == 0) {
        // 子进程负责写,关闭读取管道
        close(pipefd[0]);
        char *mes = "hello,friend";
        write(pipefd[1], mes, strlen(mes) + 1);
        close(pipefd[1]);
    } else {
        // 父进程负责等待子进程完成
        waitpid(p1, nullptr, 0);
        // 父进程负责读,关闭写管道
        close(pipefd[1]);
        read(pipefd[0], buffer, BUFFERSIZE);
        close(pipefd[0]);
        std::cout << buffer << std::endl;
    }
    return 0;
}
```
pipefd[2] 是一个整型数组，它用于存储无名管道（unnamed pipe）的文件描述符。在创建无名管道时，pipe() 函数会将两个相关联的文件描述符分别存储在 pipefd[0] 和 pipefd[1] 中。

具体作用如下：

pipefd[0]：该文件描述符用于从管道中读取数据。当调用 read(pipefd[0], buffer, BUFFERSIZE) 时，将从管道中读取数据，并将其存储到 buffer 缓冲区中。
pipefd[1]：该文件描述符用于向管道中写入数据。当调用 write(pipefd[1], mes, strlen(mes) + 1) 时，将把 mes 字符串中的数据写入管道中。
通过使用这两个文件描述符，父子进程可以通过无名管道进行进程间通信。子进程可以将数据写入管道，而父进程可以从管道中读取数据，实现了简单的数据交换和共享。
# 实验二:利用进程间通信的方式实现一个文件的逐行复制到另外一个文件,文件路径由终端参数给出，子进程读源文件,父进程写入到目标文件.
```cpp
#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <fstream>

int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cout << "请输入源文件路径和目标文件路径作为参数。" << std::endl;
        return 1;
    }
    int pipefd[2]; // 管道文件描述符数组

    if (pipe(pipefd) == -1) { // 创建管道
        std::cout << "无法创建管道。" << std::endl;
        return 1;
    }

    pid_t pid = fork(); // 创建子进程

    if (pid == -1) { // fork 失败
        std::cout << "无法创建子进程。" << std::endl;
        return 1;
    } else if (pid == 0) { // 子进程
        close(pipefd[0]); // 关闭子进程的读取端

        std::ifstream sourceFile(argv[1]); // 打开源文件
        if (!sourceFile.is_open()) {
            std::cout << "无法打开源文件。" << std::endl;
            close(pipefd[1]); // 关闭子进程的写入端
            return 1;
        }

        std::string line;
        while (std::getline(sourceFile, line)) { // 逐行读取源文件内容
            write(pipefd[1], line.c_str(), line.length()); // 将每行内容写入管道
            write(pipefd[1], "\n", 1); // 写入换行符
        }

        sourceFile.close();
        close(pipefd[1]); // 关闭子进程的写入端
        return 0;
    } else { // 父进程
        close(pipefd[1]); // 关闭父进程的写入端

        std::ofstream targetFile(argv[2]); // 打开目标文件
        if (!targetFile.is_open()) {
            std::cout << "无法打开目标文件。" << std::endl;
            close(pipefd[0]); // 关闭父进程的读取端
            return 1;
        }

        const int bufferSize = 1024;
        char buffer[bufferSize];
        int bytesRead;

        while ((bytesRead = read(pipefd[0], buffer, bufferSize)) > 0) { // 从管道读取数据
            targetFile.write(buffer, bytesRead); // 将数据写入目标文件
        }

        targetFile.close();
        close(pipefd[0]); // 关闭父进程的读取端

        wait(NULL); // 等待子进程终止
        return 0;
    }
}
```

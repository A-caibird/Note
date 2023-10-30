# 通过消息队列实现进程的通信
## `ftok`和`msgget`创建消息队列的关键函数。

1. `ftok`函数：
   - `ftok`函数用于将文件路径和一个整数标识符（通常是一个字符）转换为一个唯一的键值（key）。它的原型如下：
     ```cpp
     key_t ftok(const char *pathname, int proj_id);
     ```
   - `pathname`是一个指向文件的路径的字符串。通常，你可以创建一个独立的文件，用于生成唯一的键值。
   - `proj_id`是一个用户定义的整数标识符，用于进一步区分不同的消息队列。通常使用一个字符来表示。
   - `ftok`函数根据`pathname`和`proj_id`生成一个唯一的键值，并返回该键值。

2. `msgget`函数：
   - `msgget`函数用于创建或获取消息队列的标识符（msgid）。它的原型如下：
     ```cpp
     int msgget(key_t key, int msgflg);
     ```
   - `key`是通过`ftok`函数生成的唯一键值，用于识别特定的消息队列。
   - `msgflg`是一个标志参数，用于指定消息队列的创建和访问权限。可以使用位运算符将多个标志组合在一起。常用的标志包括：
     - `IPC_CREAT`：如果消息队列不存在，则创建一个新的消息队列。
     - `IPC_EXCL`：与`IPC_CREAT`一起使用，用于确保创建一个新的消息队列，如果消息队列已经存在则返回错误。
     - 权限标志：用于指定消息队列的访问权限，例如`0666`表示所有用户都具有读写权限。
   - `msgget`函数返回一个用于标识消息队列的整数值（msgid）。你可以使用这个msgid来进行后续的消息发送和接收操作。

通过调用`ftok`函数生成唯一的键值，并将该键值传递给`msgget`函数，你可以创建或获取一个特定的消息队列，并获得与之关联的msgid。

## `msgsnd`、`msgrcv`发送和接受消息
当使用System V消息队列进行进程间通信时，`msgsnd`和`msgrcv`是用于发送和接收消息的关键函数。

1. `msgsnd`函数：
   - `msgsnd`函数用于向消息队列发送消息。它的原型如下：
     ```cpp
     int msgsnd(int msqid, const void *msgp, size_t msgsz, int msgflg);
     ```
   - `msqid`是消息队列的标识符，即通过`msgget`函数获取到的msgid。
   - `msgp`是一个指向消息数据的指针，通常是一个自定义的结构体指针。你可以定义一个结构体来存储消息的类型和内容等信息。
   - `msgsz`是消息的大小，以字节为单位。你需要确保`msgsz`与实际发送的消息大小相匹配。
   - `msgflg`是一个标志参数，用于指定发送消息的行为。常用的标志包括：
     - `IPC_NOWAIT`：如果消息队列已满，不要等待，立即返回错误。
     - `0`：阻塞发送，如果消息队列已满则等待直到有空间可用。
   - `msgsnd`函数返回一个整数值，表示消息发送的结果。如果成功发送消息，则返回0；如果出现错误，则返回-1。

2. `msgrcv`函数：
   - `msgrcv`函数用于从消息队列接收消息。它的原型如下：
     ```cpp
     ssize_t msgrcv(int msqid, void *msgp, size_t msgsz, long msgtyp, int msgflg);
     ```
   - `msqid`是消息队列的标识符，即通过`msgget`函数获取到的msgid。
   - `msgp`是一个指向接收消息的缓冲区的指针，通常是一个自定义的结构体指针，用于存储接收到的消息数据。
   - `msgsz`是接收缓冲区的大小，以字节为单位。你需要确保`msgsz`足够大以容纳接收的消息。
   - `msgtyp`是消息类型，用于指定接收消息的条件。通常，你可以使用一个特定的值来筛选消息类型，例如，只接收特定类型的消息。
   - `msgflg`是一个标志参数，用于指定接收消息的行为。常用的标志包括：
     - `IPC_NOWAIT`：如果消息队列为空，不要等待，立即返回错误。
     - `0`：阻塞接收，如果消息队列为空则等待直到有消息可用。
   - `msgrcv`函数返回一个整数值，表示接收消息的结果。如果成功接收消息，则返回接收到的消息的长度；如果出现错误，则返回-1。

这两个函数提供了发送和接收消息的基本功能，你可以根据需要进行调用和处理接收到的消息。记住，发送和接收消息的进程需要拥有对消息队列的适当权限。

## 样例
```cpp
#include <cstring>
#include <iostream>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <sys/types.h>
#include <unistd.h> // fork
// 定义消息结构体
struct Message {
    long mtype;
    char mtext[100];
};

int main() {
    key_t key;
    int msgid;
    Message msg;

    // 生成唯一的key
    key = ftok("message_queue_example", 65);

    // 创建消息队列
    msgid = msgget(key, 0666 | IPC_CREAT);

    // 发送消息的进程
    if (fork() == 0) {
        // 子进程发送消息
        printf("子进程发送消息\n");
        msg.mtype = 1;
        strcpy(msg.mtext, "Hello from child process!");
        msgsnd(msgid, &msg, sizeof(msg.mtext), 0);
    } else {

        // 父进程接收消息
        msgrcv(msgid, &msg, sizeof(msg.mtext), 1, 0);
        std::cout << "Received message: " << msg.mtext << std::endl;
        // 删除消息队列
        std::cout << "end" << std::endl;
        msgctl(msgid, IPC_RMID, nullptr);
    }
    return 0;
    ```

# 非亲属进程之间的通信通过有名管道来实现

- 接受消息
```cpp
#include <iostream>
#include <fstream>
#include <cstring>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
int main(){
    // 创建命名管道
    const char* pipeName = "/tmp/pipe1";
    std::ifstream pipeIn(pipeName,std::ios::in);

    // 接受消息
    std::string mes;
    std::getline(pipeIn,mes);
    std::cout << "Received message in Process 2:"<<mes<<std::endl;
    pipeIn.close();
    
    // 删除命名管道 
    unlink(pipeName);
    return 0; 
}
````

- 发送消息的进程
```cpp
#include <iostream>
#include <fstream>
#include <sys/stat.h>
#include <unistd.h>
int main()
{
    const char* pipeName="/pipe1";
    mkfifo(pipeName,0666); // 命名管道路径,后面代表用户权限
    std::ofstream pipeOut(pipeName,std::ios::out);
    std::string mes;
    mes="hello from progreess 1";
    pipeOut<<mes;
    pipeOUt.close();
    
    // 删除命名管道
    unlink(pipeName);
    return 0;
}
```
注意:命名管道是Linux下一种基于文件的通信方式,必须要路径存在于文件系统,且当前用户有权限在路径目录下执行写文件操作
命名管道是一种阻塞式的通信机制。如果没有数据可读，读取操作会被阻塞，直到有数据写入到管道中。类似地，如果管道已满，写入操作也会被阻塞，直到有空间可用。因此，在实际使用中，可能需要使用多线程或非阻塞 I/O 来处理管道通信，

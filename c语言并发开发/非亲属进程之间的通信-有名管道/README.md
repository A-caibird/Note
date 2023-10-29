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
    const char* pipeName = "/pipe1";
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
}'

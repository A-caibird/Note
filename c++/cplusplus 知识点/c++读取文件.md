# c++读取文件
## 知识点
- window换行符`'r'`
- try-catch语句
## 判断是否读取成功
```cpp
try {
        if (!fin.is_open()) {
            throw runtime_error("File open failed!");
        }
    } catch (const exception &e) {
        cout << "Exception: " << e.what() << endl;
        return -1;
    }

```

## 完整代码
```cpp
#include <iostream>

#include <fstream>

#include <cstring>

#include <cctype>

using namespace std;

int main() {

    ifstream fin("F:\\Code\\cpp\\consle\\f1.txt"); // 绝对路径打开
    try {
        if (!fin.is_open()) {
            throw runtime_error("File open failed!");
        }
    } catch (const exception &e) {
        cout << "Exception: " << e.what() << endl;
        return -1;
    }
    cout << "Content of f1.txt:" << endl;
    fin.clear(); // 清空输入流的状态
    fin.seekg(0); // 将文件指针移回到文件起始位置
    int line = 1;
    char c;
    while (fin.get(c)) {

        if (isupper(c))
            cout << char(tolower(c));
        else cout<<c;
        if (c == '\r') // Windows下的换行符
            line++;
    }

    cout << endl;
    fin.close();
    cout << "Number of lines: " << line << endl;
    return 0;

}

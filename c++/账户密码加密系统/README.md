## 要求

为了保障系统安全，通常采取用户帐号和密码登录系统。系统用户信息存放在一个文件中，系统帐号名和密码由若干字母与数字字符构成，因安全需要文件中的密码不能是明文，必须要经过加密处理。请编程实现：

输入n个用户信息（包含帐号名和密码）并写入文件user.dat（二进制文件），保存文件的操作用saveToFile函数。要求文件中每个用户信息占一行，帐号名和加密过的密码之间用一个空格分隔。

密码加密算法（encrypt()）：对每个字符ASCII码的低四位求反，高四位保持不变（即将其与15进行异或）。   

编写一个函数checkUserValid()用于登录系统时校验用户的合法性。检查方法是:程序运行时，输入一个用户名和密码，调用checkUserValid()函数，在用户文件中查找该用户信息，如果用户名和密码在文件中找到，则表示用户合法，返回1，提示“Valid user!”，否则返回0，输出“Invalid user!”。
## 重点加密函数
```cpp
string encrypt(string password) {

    string encrypted_password;

    for (char &c: password) {

        int low = c & 0x0f;    // 取低四位

        int high = c >> 4;     // 取高四位

        low = 15 - low;        // 低四位取反

        c = (high << 4) | low; // 重新组合

        encrypted_password += c;

    }

    return encrypted_password;
}

```
## 添加账户和密码
```cpp
void saveToFile(string filename, int n) {

    ofstream outfile(filename, ios::binary);

    for (int i = 0; i < n; i++) {

        string username, password;

        cout << "Enter username " << i + 1 << ": ";

        cin >> username;

        cout << "Enter password " << i + 1 << ": ";

        cin >> password;

        string encrypted_password = encrypt(password);

        outfile << username << ' ' << encrypted_password << endl;

    }
}

```
## 完整代码
```cpp
#include<iostream>
#include <fstream>
#include <string>
#include<cmath>
#include <cstdlib>

using namespace std;

// 加密算法

string encrypt(string password) {

    string encrypted_password;

    for (char &c: password) {

        int low = c & 0x0f;    // 取低四位

        int high = c >> 4;     // 取高四位

        low = 15 - low;        // 低四位取反

        c = (high << 4) | low; // 重新组合

        encrypted_password += c;

    }

    return encrypted_password;
}

// 写入文件

void saveToFile(string filename, int n) {

    ofstream outfile(filename, ios::binary);

    for (int i = 0; i < n; i++) {

        string username, password;

        cout << "Enter username " << i + 1 << ": ";

        cin >> username;

        cout << "Enter password " << i + 1 << ": ";

        cin >> password;

        string encrypted_password = encrypt(password);

        outfile << username << ' ' << encrypted_password << endl;

    }
}

// 校验用户合法性

int checkUserValid(string username, string password) {

    ifstream infile("user.dat", ios::binary);

    string line;

    while (getline(infile, line)) {

        int pos = line.find(' ');

        string user = line.substr(0, pos);

        string encrypted_password = line.substr(pos + 1);

        if (username == user && encrypt(password) == encrypted_password) {

            cout << "Valid user!" << endl;

            return 1;

        }

    }

    cout << "Invalid user!" << endl;

    return 0;
}


int main() {

    int n;

    cout << "Enter the number of users: ";

    cin >> n;

    saveToFile("F:\\Code\\cpp\\consle\\user.dat", n);

    string username, password;

    cout << "Enter username to check: ";

    cin >> username;

    cout << "Enter password to check: ";

    cin >> password;

    checkUserValid(username, password);

    return 0;
}
```

# 基础知识点集合

## c++文件写入与读取

### 定长结构体数据的快速读取

>  需要读取的数据字节数是一定的，快速读取最后一行数据
>
> 实现： `seek` `in.read(reinterpret_cast<char*>(&s), sizeof(MyStruct));`

如果文件中的每行数据都是定长的，那么可以使用以下方法在C++中快速读取最后一行数据：

```c++
#include <iostream>
#include <fstream>

using namespace std;

struct MyStruct {
    int id;
    char name[20];
    // add other fields here
};

int main() {
    ifstream fin("file.txt", ios::binary);
    if (!fin) {
        cerr << "Failed to open file!\n";
        return 1;
    }

    // move the file pointer to the beginning of the last line
    fin.seekg(-sizeof(MyStruct), ios::end);

    // read and parse the last line as a struct
    MyStruct s;
    fin.read(reinterpret_cast<char*>(&s), sizeof(MyStruct));
    // add error checking if necessary

    // do something with the parsed struct
    cout << "id: " << s.id << "\n";
    cout << "name: " << s.name << "\n";

    return 0;
}
```

该代码首先使用`seekg()`函数将文件指针定位到文件末尾倒数第二个结构体的位置。然后使用`read()二进制读取`函数将最后一个结构体从文件中读入并存储在一个结构体变量`s`中。

注意，这种方法只适用于文件中每行数据固定长度的情况，并且需要确保每个结构体占用的字节数与实际文件格式相同。如果每行数据的长度不固定，则需要使用其他方法来读取最后一行数据。



## 定义一个写入文件流`ofstream`

```cpp
std::ofstream file(文件目录[字符串形式],参数二)，参数二是指定写入模式
```

### `ios::app`

>  文件末尾继续写入数据

### 未指定第二个参数

> 则每次都是打开一个新文件(空文件)，写入数据以后，关闭文件流直接替代原有的文件。

## 向文件中写入分割字符：`\n`,` `

>  在读取含有分割字符文件的时候需要使用，`getline`从文件流中读取一行数据，以``字符串``的形式保留在字符串中。再利用`stringstream`流将数据写入到变量之中。

```cpp
string s;
getline(filer,s);
stringstream iss(s);
iss >> vary.a>> vary.b;
```



## 定义一个文件读取操作

```cpp
std::ifstream a("path",)
```

## 读取到文件结束符号``EOF`

```cpp
  std::ifstream file("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
    std::string line;
    while (std::getline(file, line)) {
        std::istringstream iss(line);
        LogData temp;
        iss >> temp.logdate >> temp.lognote >> temp.charge >> temp.balance;
        std::cout << temp.logdate << " " << temp.lognote << " " << temp.charge << " " << temp.balance << std::endl;
    }
    file.close();
```

## 记得文件流的关闭`close`

## 成员变量中包含空格等空白字符时

```cpp
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 100

struct Person {
    char name[20];
    int age;
};

int main() {
    char buffer[MAX_LINE_LENGTH];
    struct Person person;

    printf("Enter a name and an age: ");
    fgets(buffer, MAX_LINE_LENGTH, stdin);

    if (sscanf(buffer, "%s %d", person.name, &person.age) != 2) {
        fprintf(stderr, "Error parsing input\n");
        exit(EXIT_FAILURE);
    }

    printf("Name: %s\nAge: %d\n", person.name, person.age);

    return 0;
}

```

上面的代码中，我们定义了一个包含名字和年龄的Person结构体。使用fgets()函数读取一整行文本，并使用sscanf()解析出名字和年龄，最后打印出来。这样无论名字中是否包含空格或其他空白字符都能正确地读取和解析.



## 结构体成员变量中包含了字符串或者其他复杂类型

```cpp
struct LogData {
    string logdate;
    string lognote;
    double charge;
    double balance;
};
```

那么你需要使用一些特殊的技巧来读写这些数据。

对于字符串类型的成员变量，你可以使用`getline()`函数来读取整行文本，并且根据分隔符将其分成若干字段。以下是一个示例代码：

```cpp
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

struct LogData {
    string logdate;
    string lognote;
    double charge;
    double balance;
};

int main() {
    ofstream fout("data.txt");
    if (!fout) {
        cerr << "Failed to open file for writing." << endl;
        return -1;
    }

    // 写入数据
    LogData data {"2023-04-11", "test, note", 100.0, 200.0};
    fout << data.logdate << "," << data.lognote << "," << data.charge << "," << data.balance << "\n";
    fout.close();

    ifstream fin("data.txt");
    if (!fin) {
        cerr << "Failed to open file for reading." << endl;
        return -1;
    }

    // 读取数据
    LogData readData;
    string line, field;
    getline(fin, line);
    istringstream iss(line);
    getline(iss, field, ',');
    readData.logdate = field;
    getline(iss, field, ',');
    readData.lognote = field;
    iss >> readData.charge >> readData.balance;

    cout << readData.logdate << endl;
    cout << readData.lognote << endl;
    cout << readData.charge << endl;
    cout << readData.balance << endl;

    fin.close();
    return 0;
}
```

在上面的示例代码中，我们首先写入了一个包含逗号和空格的字符串到`lognote`成员变量中。在读取数据时，我们使用`getline()`函数和`istringstream`类来分割每个字段，并且将其赋值给`LogData`结构体实例`readData`的对应成员变量。

需要注意的是，在使用`getline()`函数时，你需要指定分隔符和缓冲区大小，否则会出现内存泄漏或者其他错误。另外，在使用`istringstream`类时，你需要使用输入运算符`>>`来从流中读取数值类型的成员变量。


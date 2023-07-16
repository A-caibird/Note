- [特殊操作](#特殊操作)
  - [可变参模板](#可变参模板)
  - [获取变量容易的变量类型](#获取变量容易的变量类型)
    - [仅仅使用`typeid、type_info的name函数`不可读](#仅仅使用typeidtype_info的name函数不可读)
    - [使用 C++ 类型萃取`（type_traits）`的 `std::decay` 模板来获取变量的实际类型](#使用-c-类型萃取type_traits的-stddecay-模板来获取变量的实际类型)
  - [判断变量类型](#判断变量类型)
  - [模板特例化（针对不同类型执行不同的操作）](#模板特例化针对不同类型执行不同的操作)
  - [超级牛逼输出函数(c++)](#超级牛逼输出函数c)
    - [` out(args...);`](#-outargs)
    - [第一个单形参out函数作用](#第一个单形参out函数作用)
    - [原理](#原理)
  - [超级牛逼输出函数`c++`](#超级牛逼输出函数c-1)
  - [函数返回任意类型任意个数量任意类型的元素`pair`](#函数返回任意类型任意个数量任意类型的元素pair)
  - [函数返回任意类型任意个数量任意类型的元素`tuple`](#函数返回任意类型任意个数量任意类型的元素tuple)
  - [`switch-case`语句](#switch-case语句)
    - [代码one](#代码one)
    - [运行结果](#运行结果)
    - [代码two](#代码two)
    - [等价表达式](#等价表达式)
  - [字符常量](#字符常量)
  - [逗号表达式](#逗号表达式)
  - [`static变量`](#static变量)
    - [题目](#题目)
    - [代码一](#代码一)
    - [解释](#解释)
  - [数组去重c语言实现](#数组去重c语言实现)
  - [n进制字符串转化为10进制数字](#n进制字符串转化为10进制数字)
    - [`sscanf`](#sscanf)
  - [宏：调试输出变量名称和值](#宏调试输出变量名称和值)

# 特殊操作
## 可变参模板
```cpp
template<typename T1, typename ...Args>
```
假设一个函数在使用这个类型。在这个函数中，Args 是一个模板参数包，表示一个包含了零个或多个类型参数的集合。而 args 是函数的形参，表示一个包含了零个或多个函数参数的集合，其中每个参数的类型都是由 Args 包中的类型参数决定的。

在这个函数中，Args... 表示一个类型参数包，可以展开成多个类型参数。例如，如果我们调用这个函数并传入两个参数，一个整数和一个字符串，那么 Args... 将展开成 int, const char*，因为我们有两个参数，一个是整数类型，另一个是 const char* 类型。
## 获取变量容易的变量类型
### 仅仅使用`typeid、type_info的name函数`不可读
```cpp
template<typename...args>
tuple<args...> read(args...Args) {
    return make_tuple(Args...);
}
int main() {
//    ios::sync_with_stdio(false);
//    cin.tie(nullptr),cout.tie(nullptr);
    auto a=read(1,2,34.54,"fdas");
    const std::type_info& myTypeInfo = typeid(a);
    std::cout << myTypeInfo.name() << std::endl;
    return 0;
}
```
输出结果：St5tupleIJiidPKcEE。这是因为C++的类型名是由`编译器`生成的，而且它们通常`不太可读`。在这里， "St5tupleIJiidPKcEE" 是编译器生成的类型名，用来表示一个 `std::tuple<int, int, double, const char*>` 类型的变量。
### 使用 C++ 类型萃取`（type_traits）`的 `std::decay` 模板来获取变量的实际类型
```cpp
#include <iostream>
#include <tuple>
#include <typeinfo>
#include <type_traits>

template<typename... Args>
std::tuple<Args...> read(Args... args) {
    return std::make_tuple(args...);
}

int main() {
    // ios::sync_with_stdio(false);
    // cin.tie(nullptr),cout.tie(nullptr);
    auto a = read(1, 2, 34.54, "fdas");

    using AType = std::decay_t<decltype(a)>;

    std::cout << typeid(AType).name() << std::endl;

    return 0;
}
```
##  判断变量类型
```cpp
#include <iostream>
#include <typeinfo>

int main() {
    int num = 10;

    if (typeid(num) == typeid(int)) {
        std::cout << "Variable is an int" << std::endl;
    } else {
        std::cout << "Variable is not an int" << std::endl;
    }

    return 0;
}

```

## 模板特例化（针对不同类型执行不同的操作）
```cpp
#include <iostream>
#include <string>

template<typename T>
void print(T value) {
    std::cout << value << std::endl;
}

template<>
void print<std::string>(std::string value) {
    std::cout << "String: " << value << std::endl;
}

int main() {
    int num = 10;
    std::string str = "Hello";

    print(num); // 输出 10
    print(str); // 输出 String: Hello

    return 0;
}

```
## 超级牛逼输出函数(c++)
```cpp
namespace DIY {
    template<typename T>
    void out(const T &arg) {
        std::cout << arg;
    }

    template<typename T1, typename ...Args>
    void out(const T1 &arg1, const Args &... args) {
        std::cout << arg1 << " ";
        out(args...);
    }
}
```
### ` out(args...);`
实际上，第一个`out`函数的作用是为可变参数模板的递归提供一个终止条件。当只有一个参数存在时，调用第一个`out`函数进行处理；当存在多个参数时，则调用第二个可变参数模板的`out`函数，将第一个参数和剩余参数分别处理。

这样设计的好处是，如果只有一个参数时，不需要将参数列表分解为两个或以上的参数，而是直接利用最简单的方式输出这唯一的参数，不必额外消耗计算资源。

此外，这种递归形式的实现方式可以处理递归不定参数个数的函数调用，非常灵活，具有很好的通用性。
### 第一个单形参out函数作用
实际上，第一个`out`函数的作用是为可变参数模板的递归提供一个终止条件。当只有一个参数存在时，调用第一个`out`函数进行处理；当存在多个参数时，则调用第二个可变参数模板的`out`函数，将第一个参数和剩余参数分别处理。

这样设计的好处是，如果只有一个参数时，不需要将参数列表分解为两个或以上的参数，而是直接利用最简单的方式输出这唯一的参数，不必额外消耗计算资源。

此外，这种递归形式的实现方式可以处理递归不定参数个数的函数调用，非常灵活，具有很好的通用性。
### 原理
是的，`out(args...)`语句在执行时，编译器会自动分解参数列表中的所有参数，并根据模板的递归定义，逐一处理参数列表中的每个参数，直到参数列表中的参数被完全处理为止。

具体来说，当`out(args...)`语句被执行时，编译器会采用递归展开的方式，将参数列表中的参数依次绑定到函数模板的形参上。例如，若参数列表中有三个参数，编译器会首先将第一个参数绑定到`const T1& arg1`上，将剩余的两个参数依次展开为`const Args& arg2, const Args&... args`，然后再次调用`out(arg2, args...)`进行处理。如此循环递归，直到参数列表为空，递归终止。这种递归形式的代码实现方式称为展开包（unrolling pack）。

需要注意的是，在参数列表被完全展开为函数调用的形参列表前，编译器并不知道参数列表中有多少参数，因此需要递归调用，一次处理一个参数，以保证能够正确处理所有的参数。

## 超级牛逼输出函数`c++`
```c
void out(int num_args, ...) {
    va_list args;
    va_start(args, num_args);

    for (int i = 0; i < num_args; i++) {
        printf("%d", va_arg(args, int));
        if (i != num_args - 1) {
            printf(" ");
        }
    }
    printf("\n");

    va_end(args);
//  This implementation uses va_list and va_arg to handle the variable number of arguments passed to the out function.
//  It iterates through the arguments and prints them with a space between each, except for the last argument.
//  Finally, it prints a newline character to end the line.
}
```
## 函数返回任意类型任意个数量任意类型的元素`pair`
```cpp
#include <utility>  // for std::pair and std::make_pair
#include <iostream>

template<typename T1, typename ...Args>
std::pair<T1, std::pair<Args...>> make_multi_pair(T1 first, Args... args)
{
    return std::make_pair(first, std::make_pair(args...));
}

int main()
{
    auto mp1 = make_multi_pair(1, 2, 3);  // Returns a pair<int, pair<int, int>>
    std::cout << mp1.first << " " << mp1.second.first << " " << mp1.second.second << std::endl;  // Outputs: 1 2 3

    auto mp2 = make_multi_pair("hello", 3.14, true, 'c');  // Returns a pair<const char*, pair<double, pair<bool, char>>>
    std::cout << mp2.first << " " << mp2.second.first << " " << mp2.second.second.first << " " << mp2.second.second.second << std::endl;  // Outputs: hello 3.14 1 c

    return 0;
}
```
## 函数返回任意类型任意个数量任意类型的元素`tuple`
```cpp
#include <tuple>
#include <iostream>
template<typename... Args>
std::tuple<Args...> myFunction(Args... args) {
    return std::make_tuple(args...);
}
int main() {
    auto result = myFunction(1, "Hello", 3.14, 'a');
    std::cout << std::get<0>(result) << std::endl; // Output: 1
    std::cout << std::get<1>(result) << std::endl; // Output: Hello
    std::cout << std::get<2>(result) << std::endl; // Output: 3.14
    std::cout << std::get<3>(result) << std::endl; // Output: a

    return 0;
}
```
## `switch-case`语句
### 代码one
```cpp
int i;
    for (i = 0; i < 3; i++)
        switch (i)
        {
            case 1: printf("%d 1\n", i);
            case 2: printf("%d 2\n" , i);
            default: printf("%d 3\n", i);
        }
```
### 运行结果
```cpp
0 3
1 1
1 2
1 3
2 2
2 3

```
### 代码two
```cpp
switch (ch){
    case '-': 
        minus++; break; 
    case '0' : case '1' : case '2' : case '3' : case '4' :
    case '5' : case '6' : case '7' : case '8' : case '9' : 
        digit ++;break;
    default: 
        other ++; break; 
}   
```
### 等价表达式
```cpp
if
(ch == '-')
 {
    minus++; 
}
if(ch >= '0' && ch <= '9')
 {
    digit ++;
}
else 
  {
    other ++;

```

## 字符常量
举例说明：`'\0x1'` 是一个非法的字符常量。在 C 语言中，使用单引号括起来的字符常量必须表示一个字符，而不是一个整数。正确的十六进制表示法应该是类似于 `\x1` 或 `\x01`，这将表示十六进制值为 0x01 的一个字符，也就是 ASCII 码值为 1 的控制字符 SOH（Start of Heading）。
## 逗号表达式
```cpp
 int b = 3415, a = 120263;
    int c=(a/=10,a%10);
    DIY::out(c,a);
    return 0;
 // 输出6 12026
```
这种语句称为逗号表达式 `(comma expression)`。逗号表达式会顺序地执行多个表达式，但是它的返回值是`最后一个表达式的值`。 
## `static变量` 
### 题目
给定两个均不超过9的正整数a和n，要求编写函数求a+aa+aaa++⋯+aa⋯a（n个a）之和。
### 代码一
```cpp

int fn(int a, int n) {
    static int res=0;
    res = res * 10 + a;
    if(!(n-1))
        return res;
    else fn(a,n-1);
}
int SumA(int a, int n) {
    int res=0;
	 do{
       res+=fn(a,n);
       n--;
   }while(n!=0);
	return res;
}
```
### 解释
因为 res 是 static 变量，它的生命周期会持续到整个程序运行结束，所以其值会保留在前一次调用函数时的状态。因此，在第二次调用该函数时， res 的值将等于上一次运行后的值。故会造成`溢出`.

## 数组去重c语言实现
```cpp
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int len = 10;
  scanf("%d", &len);
  int a[100];
  for (int i = 0; i < len; i++) {
    scanf("%d", &a[i]);
  }
  for (int i = 0; i < len; i++) {
    for (int j = 0; j < i; j++) {
      if (a[i] == a[j]) {
        for (int k = i; k < len - 1; k++) {
          a[k] = a[k + 1];
          
        }
        --len;
        --i;
        break;
      }
    }
  }
  for (int i = 0; i < len; i++) {
    printf("%d%c", a[i], " \n"[i == len - 1]);
  }
  return 0;
}
```
## n进制字符串转化为10进制数字
### `sscanf`
输入一个以#结束的字符串，滤去所有的非十六进制字符（不分大小写），组成一个新的表示十六进制数字的字符串，输出该字符串并将其转换为十进制数后输出。
```cpp
#include <ctype.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char a[100], c;
  int i = 0;
  while ((c = getchar()) != '#') {
    if (c >= '0' && c <= '9')
      a[i++] = c;
    if (c >= 'A' && c <= 'F')
      a[i++] = c;
    if (c >= 'a' && c <= 'f')
      a[i++] = c;
  }
  a[i] = '\0';
  puts(a);
  long long n;
  sscanf(a,"%x",&n);
  printf("%lld",n);
  return 0;
}
```
## 宏：调试输出变量名称和值
```cpp
#define  DEBUG(...) \
do { \
std::cerr << "DEBUG: "; \
print_var_value(#__VA_ARGS__, __VA_ARGS__); \
std::cerr << std::endl; \
} while (0)
    template<typename T>
    void print_var_value(const char *name, const T &value) {
        std::cerr << name << " = " << value << " ";
    }

    template<typename T, typename... Args>
    void print_var_value(const char *names, const T &value, Args... args) {
        const char *comma = strchr(names + 1, ',');
        std::cerr.write(names, comma - names) << " = " << value << " ";
        print_var_value(comma, args...);
    }
```

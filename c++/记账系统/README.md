# 演示结果以及函数说明

## 程序说明

程序可以多次输入命令执行，直到用户输入对应的退出指令。

## 演示结果[consle 窗口输出]

```cpp
F:\Code\cpp\consle\cmake-build-debug\clion_project.exe
Enter your choice:
1-Add a new cash LOG.
2-List All Casg LOG.
3-Query Last LOG.
4-update your LOG
0-End program.
Please tell me if you are using it for the first time? If yes please enter 1, otherwise enter 0.
0
please enter number of operator
4
    LogId        LogDate        Charge        Balance    
    1    fda5236    fas545    0    230    
    2    JIJIJI    JIJI    -100    130    
      Above is all your logs.     
Below Log is your all log.Please enter the serial number of the log to be modified
Your Input:    2

DEBUG:  line:153,x = 2 ,cnt = 2;

Please alter  your selected log by inputing.Notice: if you want to alter balance,please add new log to Implement it.If there's no need for modification, please copy and paste it directly.
MMMM MMMM 100
DEBUG:  line:160,vec[0].charge = 0 ,vec[0].lognote = fas545 ,vec[0].logdate = fda5236;

DEBUG:  line:161,vec[x-1].charge = 100 ,vec[x-1].lognote = MMMM ,vec[x-1].logdate = MMMM;

Will you continue to operate?if you will,please input 1,else input 0.
Your Input: 1
please enter number of operator
2
    LogId        LogDate        Charge        Balance    
    1    fda5236    fas545    0    230    
    2    MMMM    MMMM    100    330    
      Above is all your logs.     
Will you continue to operate?if you will,please input 1,else input 0.
Your Input: 3
please enter number of operator
3
Your last log:   LogId:2, LogDate:MMMM, LogNote:MMMM, Charge:100, Balance:330
Will you continue to operate?if you will,please input 1,else input 0.
Your Input: 1
please enter number of operator
1
Log format: data note charge. Please enter in order.
KOKO JIMIMI -20
Write file successfully.
Will you continue to operate?if you will,please input 1,else input 0.
Your Input: 1
please enter number of operator
2
    LogId        LogDate        Charge        Balance    
    1    fda5236    fas545    0    230    
    2    MMMM    MMMM    100    330    
    3    KOKO    JIMIMI    -20    310    
      Above is all your logs.     
Will you continue to operate?if you will,please input 1,else input 0.
Your Input: 0

Process finished with exit code 0

    
```

## 函数说明

### `int showmenu()`

>  展示到底有哪几种操作，`返回值`用于判断是否已经写过机长日志



##  `int inputmychoice()`

>  返回操作指令

## `void AddNewLog(int di)`

添加新的记账日志。

> 当di==1，表明之前已经写过日志，那么这次新加的日志就不需要输入余额，而由程序自动计算
>
> 
>
> 当d不等于1，表示第一次添加日志，那需要输入余额和其他的，将提示用户设置这次日志中的charge=0；



### `void ListAllLog(int ci)`

> 列出所有日志，如果ci==1，表示没有日志，直接返回，输出没有日志。





### `void QueryLastLog(int ci)` 

> 如果ci==1，输出没有日志退出；否则输出最后一个日志。

### `void UpdateLog(int ci)`

> 如果ci==1，直接返回，没有日志可以修改。

> 如果需要修改余额balance，那肯定是多了消费途径,直接让用户去添加一个新的日志。
>
> 否则就列出所有日志，让用户选择一条修改，不需要修改的日志部分，就不变。
>
> 最后计算更新余额


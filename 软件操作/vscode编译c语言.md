# vscode编译cpp文件所需配置
当然可以。下面是tasks.json文件和launch.json文件的配置内容：

## tasks.json文件内容：

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "type": "shell",
            "command": "/usr/bin/g++", // <- 这里是你本地g++编译器的路径
            "args": [
                "-g", "${file}",
                "-o", "${fileDirname}/${fileBasenameNoExtension}"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher":"$gcc"
        }
    ]
}
```

## launch.json文件内容：

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "C++ Launch (GDB)",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/${fileBasenameNoExtension}",           
            "args": [],           
            "stopAtEntry": false,           
            "cwd": "${workspaceFolder}",           
            "environment": [],
            "externalConsole": true,
            "MIMode": "gdb",
            "miDebuggerPath": "/usr/bin/gdb", // <- 这里是你本地GDB调试器的路径
            "preLaunchTask": "build"
        }
    ]
}
```

请注意，如果你使用的是其他编译器或调试器，请相应地更改这些文件中的路径和参数。

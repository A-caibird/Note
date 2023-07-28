## [terminal走代理](https://www.hangge.com/blog/cache/detail_3138.html)

1. 修改配置文件。```vi ~/.zshrc```
2. add config: ```alias proxy='export all_proxy=socks5://127.0.0.1:7890'``` ```alias unproxy='unset all_proxy'```
3. make config affect ```source ~/.zshrc``` 
4. 查询ip地址：```curl ipinfo.io```
5. 启用代理再查询ip地址：```proxy```+```curl ipinfo.io```

## [添加brew到系统变量](https://blog.51cto.com/u_15655559/5530796)
1.`echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.bash_profile ` :将文件输入到.bash_profile文件path变量中
2. `source ~/.bash_profile`:执行修改
3. `echo 'export  PATH="/opt/homebrew/bin/:$PATH"' >>~/.zshrc   
4. `source ~/.zshrc`
## `brew list 软件名称`显示软件的安装路径
## 命令前加`sudo`为管理员执行
## 命令走代理
1.git

设置端口代理
```
git config --global http.proxy http://127.0.0.1:1088
git config --global https.proxy https://127.0.0.1:1088
```
取消代理
```
git config --global --unset http.proxy
git config --global --unset https.proxy
```
2.npm

取消代理
```
npm config delete proxy
npm config delete https-proxy
设置代理
```
npm config set proxy http://127.0.0.1:1088
npm config set https-proxy http://127.0.0.1:1088
npm config set strict-ssl false

## 给文件添加读写权限
`sudo chmod -R 777 文件夹路径`
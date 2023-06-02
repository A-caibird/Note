[配置](https://support.huaweicloud.com/usermanual-ccm/ccm_01_0082.html)

1. 安装 `yum install nginx`

2. `vim /etc/nginx/nginx.conf`

3. 检查错误` nginx -t`  or  `cd cd /usr/local/sbin;nginx -t` 

   ```bash
   nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
   nginx: configuration file /etc/nginx/nginx.conf test is successful
   ```

   表示nginx配置正确

4. 重启nginx：`nginx -s reload`


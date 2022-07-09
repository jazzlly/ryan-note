
# 双向认证配置

```nginx
server {
        listen       443    ssl;
        ... ...
        ssl_client_certificate ssl/ca.crt;;
        ssl_verify_client optional;
        ... ....
        #需要双证接口        
        location /ceshi {
            if ($ssl_client_verify != 'SUCCESS') {
                return 403;
                break;
            }
            auth_request off;
            proxy_pass http://127.0.0.1/;
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $remote_addr;
        }

        #不需要双证接口
        location / {
            root   /test; #站点目录
            index  index.html index.htm;
        }
}

访问需要配置双证的接口需要导入客户端p12证书，否则返回403。
不需要双证的接口，不导入客户端证书也可以直接访问。
```
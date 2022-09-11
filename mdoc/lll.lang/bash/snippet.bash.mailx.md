### mailx
```sh
yum install -y mailx

cat >> /etc/mail.rc <<EOF
set from=op@pekall.com
set smtp=smtps:\/\/smtp.pekall.com:465
set smtp-auth-user=op@pekall.com
set smtp-auth-password=tT3zNQ6MPwkpMcYG
set smtp-auth=login
set nss-config-dir=/etc/pki/nssdb    #SSL证书，centos 必须需要，否则会报错
set ssl-verify=ignore
EOF

echo "hello world"|mailx -v -s "test" rui.jiang@pekall.com
```


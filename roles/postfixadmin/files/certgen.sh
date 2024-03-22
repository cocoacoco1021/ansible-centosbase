#!/bin/sh

#------------------------------------------------------------
# 秘密鍵を生成
#------------------------------------------------------------
openssl genrsa 2048 > /etc/httpd/conf/server.key

#------------------------------------------------------------
# 証明書署名要求を生成
# Country Name (2 letter code) [AU]:
# State or Province Name (full name) [Some-State]:
# Locality Name (eg, city) []:
# Organization Name (eg, company) [Internet Widgits Pty Ltd]:
# Organizational Unit Name (eg, section) []:
# Common Name (e.g. server FQDN or YOUR name) []:
# Email Address []:
# 
# Please enter the following 'extra' attributes
# to be sent with your certificate request
# A challenge password []:
# An optional company name []:
#------------------------------------------------------------
openssl req -new -key /etc/httpd/conf/server.key <<EOF > /etc/httpd/conf/server.csr
JP
test
test
test
test
test.com



EOF

#------------------------------------------------------------
# サーバ証明書を生成
#------------------------------------------------------------
openssl x509 -days 3650 -req -signkey /etc/httpd/conf/server.key < /etc/httpd/conf/server.csr > /etc/httpd/conf/server.crt
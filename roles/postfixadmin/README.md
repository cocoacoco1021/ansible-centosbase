postfixadmin（プレビュー）
=========

## これは何？

postfixadminを使用したメールサーバを構築するplaybookです。

- 自己証明書を作成
- postfixの設定調整
- dovecotの導入/設定調整
- postfixadminの導入/設定調整
- vmailユーザの作成
- postfixadmin用のツールをデプロイ

## 変数

mail_domainに設定するpostfixadmin用のドメインを指定して下さい。  
postfix_passwordにpostfixadminのmysql接続用となるパスワードを定義して下さい。  


```
---
  mail_domain: mail.develop.local
  postfix_password: sU9xaeg3#G5D
```


Dependencies
-------

- httpd
- php
- mysql-server


License
-------

BSD

Author Information
------------------

- keisuke sanuki 

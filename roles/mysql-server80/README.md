mysql-server80
=========

## これは何？

mysql8.0を導入し、初期設定まで行うplaybookです。

- レポジトリの追加
- my.cnf設定
- mysqlインストール
- expectインストール
- mysql再起動
- mysql初期設定(mysql_secure_installation)

## 変数定義

mysqlのパラメータとrootユーザのパスワードを定義して下さい。

```
---
# vars file for db_backup
innodb_buffer_pool_size: 256M
key_buffer_size: 128M
db_passwd: OP:Ts7ajsu98J
```

License
-------

BSD

Author Information
------------------

keisuke sanuki

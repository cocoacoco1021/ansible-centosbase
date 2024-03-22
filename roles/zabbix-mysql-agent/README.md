zabbix-mysql-agent
=========

## これは何？

MySQLをzabbixで監視するための設定を行うplaybookです。

- mysqlのzabbix監視ユーザ作成
- zabbix監視ユーザのログイン設定

## 変数

zabbix_dbpassに作成するzabbixユーザのパスワードを定義して下さい。  
db_passwdにMySQLのrootユーザのパスワードを定義して下さい。

```
---
# vars file for zabbix-mysql-agent
zabbix_dbpass:
db_passwd: 
```

License
-------

BSD

Author Information
------------------

- junichirou okazaki
- keisuke sanuki 

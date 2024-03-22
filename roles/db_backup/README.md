db_backup
=========

## これは何？

MySQLバックアップスクリプト設置用のplaybookです

- TOOLSディレクトリ作成
- バックアップディレクトリ作成
- バックアップスクリプト設置
- CRON登録


## 変数

MySQLのrootパスワードを定義して下さい。

```
---
# vars file for db_backup
db_passwd: aes7sChea7v:12
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 
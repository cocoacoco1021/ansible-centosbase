mysql-server80-auto（プレビュー）
=========

## これは何？

mysql8.0を導入し、初期設定まで行うplaybookです。
物理メモリ量から自動的にパラメータを書き換えます。

- レポジトリの追加
- my.cnf設定
- mysqlインストール
- expectインストール
- mysql再起動
- 物理メモリ量に応じてmy.cnfを書き換え
- mysql初期設定(mysql_secure_installation)

## 変数定義

mysqlのrootユーザのパスワードを定義して下さい。  
MySQL専用のサーバであれば、dedicatedにtrueを定義下さい。  
※専用サーバでなければ定義しないで下さい。

```
---
# vars file for db_backup
db_passwd: OP:Ts7ajsu98J
dedicated: true
```

License
-------

BSD

Author Information
------------------

keisuke sanuki

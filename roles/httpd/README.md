httpd
=========

## これは何？

apacheの基本的な設定を行うplaybookです。

- apacheインストール
- SeverName設定
- ドキュメントルート作成
- バーチャルホスト設定

## 変数

domain_nameに設定するドメインとOSユーザを指定して下さい。

```
---
   ServerAdmin: info@beyondjapan.com
   domain_name:
      - { domain: 'test1.com' ,customer: 'testuser1' }
      - { domain: 'test2.com' ,customer: 'testuser2' }
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 
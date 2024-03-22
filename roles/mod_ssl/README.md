mod_ssl（プレビュー）
=========

## これは何？

mod_ssl の基本的な設定を行う playbook です。

- mod_ssl のインストール
- https用のバーチャルホスト作成
- ssl.confの内容修正

## 変数

domain_nameに設定するドメインとOSユーザを指定して下さい。

```
---
   ServerAdmin: info@beyondjapan.com
   domain_name:
      - { domain: 'test1.com' ,customer: 'testuser1' }
      - { domain: 'test2.com' ,customer: 'testuser2' }
```

Dependencies
-------

- httpd
- certificate

License
-------

BSD

Author Information
------------------

- keisuke sanuki 
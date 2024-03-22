nginx
=========

## これは何？

nginxの基本的な設定を行うplaybookです。  

- nginxインストール
- ドキュメントルート作成
- バーチャルホスト設定

## 変数

```
---
# vars file for nginx
# ネットワークCIDR
#ip_cidr: 10.10.0.0/16

# 設定するユーザ
ex_user:
  - { customer: 'test1_ops' ,customer_pass: 'dksjdod@d:dkdj7' }
  - { customer: 'test2_ops' ,customer_pass: 'jdhdkdid:d@dld9k' }

# 設定するバーチャルホスト
domain_name:
   - { domain: 'test1.com' ,customer: 'test1_ops' }
   - { domain: 'test2.com' ,customer: 'test2_ops' }
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 

certificate
=========

## これは何？

証明書の配置ディレクトリを作成する playbook です。

- /etc/certs/[ドメイン]/[今年] の証明書配置ディレクトリ作成
- /etc/certs/[ドメイン]/current のシンボリックリンク作成

## 変数定義

domain_name にdomain を定義する（マッピング）

```
---
# vars file for certificate
domain_name:
   - { domain: 'develop.local' ,customer: 'vagrant' }
   - { domain: 'dev.ease.local' ,customer: 'vagrant' }
```

License
-------

BSD

Author Information
------------------

keisuke sanuki

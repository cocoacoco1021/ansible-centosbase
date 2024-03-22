useradd_with_key
=========

## これは何？

OSユーザ作成用のplaybookです。

- ユーザ作成
- 公開鍵登録
- sudo設定
- キーペアを作成して、Ansible実行PCの/var/tmp/以下(変更可能)に秘密鍵をダウンロード

## 変数

customerに作成するユーザ名を定義して下さい。  
customer_passにユーザのパスワードを定義して下さい。  
pkey_dirに秘密鍵をダウンロードするディレクトリを指定することも可能です。  

```
---
# vars file for useradd
ex_user:
  - { customer: 'testuser1' ,customer_pass: 'Kc=datum' }
  - { customer: 'testuser2' ,customer_pass: 'uX7HyhiR' }
#  - { customer: 'testuser3' ,customer_pass: 'Mg39PXQx' }
#  - { customer: 'testuser4' ,customer_pass: 'D6ze9jQ4' }
#  - { customer: 'testuser5' ,customer_pass: 's8ud39fm' }
pkey_dir: /tmp
```

License
-------

BSD

Author Information
------------------

- junichirou okazaki
- keisuke sanuki 

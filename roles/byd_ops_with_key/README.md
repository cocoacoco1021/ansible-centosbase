byd_ops_with_key
=========

## これは何？

beyond作業用ユーザを作成するplaybookです。

- byd_opsユーザの作成
- byd_opsユーザの公開鍵設定
- byd_opsユーザのsudo設定
- キーペアを作成して、Ansible実行PCの/var/tmp/以下(変更可能)に秘密鍵をダウンロード


## 変数

byd_passに設定するパスワードを定義してください。  
pkey_dirに秘密鍵をダウンロードするディレクトリを指定することも可能です。  

```
# vars file for byd_ops
  byd_pass: Ap9GsUBb:lk
  pkey_dir: /tmp
```


## License

BSD

## Author Information


- junichirou okazaki  
- keisuke sanuki 
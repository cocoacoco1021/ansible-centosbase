fail2ban（プレビュー）
=========

## これは何？

fail2ban をインストールし、dovecot の jail を作成する playbook です。  
※ firewalld を起動するので、サービス断発生の可能性があります。

- fail2ban インストール
- ログ出力設定
- 基本設定
- jail 作成
- firewalld を起動
- firewalld にて サービスポートを許可

## 変数

ignore_ip に fail2ban の ban対象外IP を定義して下さい。  
※ デフォルトは 160.86.244.231/32 です。

```
---
   ignore_ip: 160.86.244.231/32
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 
php-fpm_amazonlinux
=========

## これは何？

phpとphpモジュールをインストールするplaybookです。  
Amazonlinux2用です。

- レポジトリの追加
- PHP-fpmインストール
- 各種モジュールインストール
- php.ini設定
- php-fpm設定

## 変数

php_varに導入するphpのバージョンを定義して下さい。  
php_modulesに導入するモジュールを定義して下さい。

```
---
  php_var: 74
  php_modules:
    - "php"
    - "php-pdo"
    - "php-mbstring"
    - "php-gd"
    - "php-fpm"
#    - "php-curl"
#    - "php-pear"
#    - "php-bcmath"
#    - "php-gmp"
#    - "php-intl"
    - "php-mysqlnd"
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 

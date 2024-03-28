ansible-centosbase
=========

## これは何？

- CentOSベースのOSへ実行可能な、汎用的なAnsible playbook です。

## ディレクトリ構成

### group_vars/all.yml
変数を定義するファイルです。

### hosts
inventorysファイルです。

### target.yml
mainのplaybookです。

### inventorys以下
各種環境を分けてansibleを実行したい場合に利用します。  
＊基本的に利用しなくて大丈夫です。

### site.yml
各種環境を分けてansibleを実行したい場合に利用します。  
＊基本的に利用しなくて大丈夫です。

### key
OSユーザの秘密鍵を設置します。

### roles
各種playbookを纏めています。

## 使い方

### 1.リポジトリをclone

```
git clone http://gitlab.byd-svr.info/beyond-base/default-centos7.git
cd default-CentOS7
```

### 2.要件に併せてroles以下のplaybookをインクルード

```
vi target.yml
```

＊下記のように必要なplaybookをインクルードして下さい。

```
  roles:
    - common
    - byd_ops
    - useradd
    - httpd
    - byd_httpd
    - php
    - mysql-server57
    - db_backup
```

### 要件に併せて変数を定義

```
vi group_vars/all.yml
```

どのような変数を定義する必要があるかについては、各種roleのREADMEを確認して下さい。  
＊一部、シェルスクリプト内の変数を定義する必要があったりします。

### inventoryファイルを編集

```
vi hosts
```

左側にホスト/右側にIPアドレスを指定して下さい。  
＊複数指定可能です。

```
[target]
byd-wd01 ansible_host=xxx.xxx.xxx.xxx
```

### 実行


* パスワード指定

```
ansible-playbook -i hosts target.yml --ask-pass
```

* 秘密鍵指定

```
ansible-playbook -i hosts target.yml --private-key=privatekey.pem
```

### 実行(ドライラン)

```
ansible-playbook -i hosts target.yml --ask-pass -C
```

* 秘密鍵指定

```
ansible-playbook -i hosts target.yml --private-key=privatekey.pem -C
```


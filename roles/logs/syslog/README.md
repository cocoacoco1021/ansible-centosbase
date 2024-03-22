logs/syslog
=========

## これは何？

syslog のローテート設定を調整する playbook です。

- syslog のログローテートを調整

## Dependencies

none

## 変数

interval_sys に syslog のログローテーション間隔を定義  
rotate_num_sys に syslog のログ保持期間を定義  
※ 変数を設定しなければ、デフォルト (下記) の設定になります。

```
interval_sys: weekly
rotate_num_sys: 4
```

License
-------

BSD

Author Information
------------------

- keisuke sanuki 

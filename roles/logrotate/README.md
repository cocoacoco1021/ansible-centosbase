logrotate
=========

## これは何？

ログのローテート設定を調整するplaybookです。

- apacheのログローテートを調整
- syslogのログローテートを調整

## Dependencies

- httpd

## 変数

interval_webにapacheのログローテーション間隔を定義 
rotate_num_webにapacheのログ保持期間を定義

```
interval_web: daily
rotate_num_web: 90
```
interval_sysにsyslogのログローテーション間隔を定義 
rotate_num_sysにsyslogのログ保持期間を定義

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

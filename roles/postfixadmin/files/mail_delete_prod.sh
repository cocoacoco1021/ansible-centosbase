#!/bin/bash

while read val key
do
  sh /usr/share/postfixadmin/scripts/postfixadmin-cli mailbox delete $val --password $key --password2 $key --name $val --welcome-mail y
done < $1

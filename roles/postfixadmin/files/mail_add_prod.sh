#!/bin/bash

while read val key
do
  sh /usr/share/postfixadmin/scripts/postfixadmin-cli mailbox add $val --password $key --password2 $key --name $val --welcome-mail y
#  sleep 5
done < $1

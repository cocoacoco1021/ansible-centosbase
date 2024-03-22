#!/bin/bash
MYSQLCMD=`which mysql`
MYSQLUSER=root
MYSQLPASS="{{ db_passwd | default('', true) }}"
MYSQLHOST=""
function usage {
    cat <<EOF
$(basename ${0}) is a tool for mysql command wrapper
Usage:
    $(basename ${0}) [command] [<options>]
Options:
    -S           print "show slave status" result
    -P           print "show processlist" result
    -L           login to mysql server
    -e "args"    exec SQL statement or SQL command
EOF
}
if [ $# -eq 0 ]; then
  usage
fi
if [ -v $MYSQLHOST ]; then
  MYSQLHOST="localhost"
fi
while getopts ":SPLe:" opts
do
  case $opts in
    S)
      echo "show slave status\G"
      ${MYSQLCMD} -h ${MYSQLHOST} -u ${MYSQLUSER} -p${MYSQLPASS} -e "show slave status\\G"
      ;;
    P)
      echo "show processlist;"
      ${MYSQLCMD} -h ${MYSQLHOST} -u ${MYSQLUSER} -p${MYSQLPASS} -e "show processlist;"
      ;;
    L)
      echo "login to mysql prompt"
      ${MYSQLCMD} -h ${MYSQLHOST} -u ${MYSQLUSER} -p${MYSQLPASS}
      ;;
    e)
      echo "-e \"${OPTARG}\""
      ${MYSQLCMD} -h ${MYSQLHOST} -u ${MYSQLUSER} -p${MYSQLPASS} -e "${OPTARG}"
      ;;
    :|\?)
      usage
      ;;
  esac
done

#!/bin/bash

# MySQL データバックアップスクリプト
# 実行前提条件
# ・DB間の相互連携、一貫性は考慮する必要がない（DB単位で独立している）
# ・information_schema mysqlなどMySQL関連のDBのバックアップは取得しない
# ・バックアップの取得タイミング毎にバイナリログはflushしないのでバックアップデータから戻せるのはバックアップ取得時点のデータまでである

## 変数定義
HNAME=$(hostname)
ERRFLG=0
PGNAME=$(basename $0 .sh)

# ディレクトリ関連
BASEDIR="/usr/local/TOOLS/db_backup"
CONFDIR="${BASEDIR}/etc"
LIBDIR="${BASEDIR}/lib"
WORKDATE=$(date +"%Y%m%d")
WORKDIR="/var/backup"

# 除外リスト
EXC_DB=${CONFDIR}/db_backup_excludelist

# MySQLログイン情報
CONFFILE=${CONFDIR}/db_backup.conf

# その他

ROTATE=3

## ログ関数用変数定義
LOGDIR="${BASEDIR}/log"
LOGFILE="${LOGDIR}/${WORKDATE}.${PGNAME}.log"


## メール送信関数用変数定義
from="ss@beyondjapan.com"
to="sato@beyondjapan.com"
cc=""
bcc=""
subject_err="$(basename $0 .sh) ${HNAME} failed"
contents_err="$0の実行中にエラーが発生しました\n詳細はログファイル${LOGFILE}を確認してください"

## 共通関数読み込み
. ${LIBDIR}/Mail_Send.fnc
. ${LIBDIR}/log.fnc 

## DBエンジン判定関数
# 返り値
# 1 MyISAM+InnoDB混在
# 2 MyISAMのみ
# 3 InnoDBのみ
# 4 InnoDBでもMyISAMでもない
# 5 テーブルなし
# 99 MySQL接続エラー
function CHK_DB_ENGINE() {
	#mysql -e "select version();" || return 99
	ENGINELIST=$(mysql -u root -s -N -e "select table_name, engine from information_schema.tables where table_schema = \"$1\";") 
	if [ $? -ne 0 ]; then
		return 99
	fi
	if [ -z "$ENGINELIST" ]; then
		return 5
	fi
	echo "$ENGINELIST" | grep -i myisam 1>/dev/null \
	&& MyISAMFLG=1 \
	|| MyISAMFLG=0
	echo "$ENGINELIST" | grep -i innodb 1>/dev/null \
	&& InnoDBFLG=1 \
	|| InnoDBFLG=0
	if [ $MyISAMFLG -eq 1 ]; then
		if [ $InnoDBFLG -eq 1 ]; then
			return 1
		else
			return 2
		fi
	else
		if [ $InnoDBFLG -eq 1 ]; then
			return 3
		else
			return 4
		fi
	fi
}

## DBバックアップ取得関数
function BACKUPDB() {
	DBNAME=$1
	DBFLG=$2
	case $DBFLG in
		1)
		LOG INFO "backup $DBNAME(InnoDB+MyISAM)"
		mysqldump --quote-names --hex-blob ${DBNAME} > ${TGTDIR}/${DBNAME}.${WORKDATE}.dump ;;
		2)
		LOG INFO "backup $DBNAME(MyISAM)"
		mysqldump --quote-names --hex-blob ${DBNAME} > ${TGTDIR}/${DBNAME}.${WORKDATE}.dump ;;
		3)
		LOG INFO "backup $DBNAME(InnoDB)"
		mysqldump --quote-names --hex-blob --single-transaction --master-data=2 ${DBNAME} > ${TGTDIR}/${DBNAME}.${WORKDATE}.dump ;;
		4)
		LOG WARN "$DBNAME Engine type is unknown" ;;
	esac
}

## MySQLコマンド用設定ファイル作成関数
function CREATE_MYCNF() {
if [ ! -e ${HOME}/.my.cnf ]; then
cat << EOF > ${HOME}/.my.cnf
[mysqldump]
user=${DBUSER}
password="${DBPASS}"

[client]
user=${DBUSER}
password="${DBPASS}"
EOF
else
	LOG ERROR "${HOME}/.my.cnf already exists"
	return 99
fi
}

## MySQLコマンド用設定ファイル削除関数
function DELETE_MYCNF() {
rm -f ${HOME}/.my.cnf
}

#####################
## 処理開始
#####################

if [ -f "${CONFFILE}" ]; then
   . "${CONFFILE}"
else
   echo "config file does not exist"
   exit 99
fi

TGTDIR="${WORKDIR}/${HNAME}.db_backup.${WORKDATE}"

if [ -z ${DBUSER} ] || [ -z ${DBPASS} ]; then
   echo "DBUSER or DBPASSWORD not set"
   exit 99
fi

CREATE_MYCNF || exit 99

if [ ! -d ${TGTDIR} ]; then
	mkdir -p ${TGTDIR}
fi

## DBLIST作成
DBLIST=($(mysql -u root -s -N -e "show databases;" | grep -v -f ${EXC_DB}))
if [ $? -ne 0 ]; then
	ERRFLG=1
	LOG ERR "Can't get dblist"
fi

## DBエンジンチェックとバックアップ
for list in ${DBLIST[@]}
do
	CHK_DB_ENGINE $list
	DBFLG=$?
	if [ ${DBFLG} -eq 99 ]; then
		ERRFLG=1
		LOG ERR "MySQL connection ERROR"
		break
        fi
	BACKUPDB $list $DBFLG
	if [ $? -ne 0 ]; then
		ERRFLG=1
		LOG ERR "backup $DBNAME failed"
	else
		LOG INFO "backup $DBNAME finished"
	fi
done

## バックアップファイルのアーカイブ
cd ${WORKDIR} && \
tar czf ${TGTDIR}.tar.gz ./${HNAME}.db_backup.${WORKDATE} --remove-files
if [ -d ${WORKDIR}/${HNAME}.db_backup.${WORKDATE} ]; then
	rmdir ${HNAME}.db_backup.${WORKDATE}
fi

## バックアップファイルの世代管理
TIME=$(expr $ROTATE - 1)

#LIST=($(find ${WORKDIR} -daystart -mtime +${TIME} -name "${HNAME}.db_backup.*.tar.gz" -type f))
LIST=($(find ${WORKDIR} -daystart -follow -mtime +${TIME} -name "${HNAME}.db_backup.*.tar.gz" -type f))
if [ -z $LIST ]; then
	LOG INFO "no archive file to delete"
else
	for list in ${LIST[@]}
	do
		LOG INFO "delete old archive $list"
		rm -f $list
	done
fi

## エラー時のメール送信処理
if [ $ERRFLG -ne 0 ]; then
	subject="$(basename $0 .sh) $(hostname) failed"
	Mail_Send "$from" "$to" "$cc" "$subject_err" "$contents_err"
fi

DELETE_MYCNF

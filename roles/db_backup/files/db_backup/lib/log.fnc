function LOG() {
    # 引数展開
    PRIO=$1
    MSG=$2
#    PGNAME=`basename $0 .sh`
    # 変数定義
    LOG_DATE=`date '+%Y-%m-%d'`
    LOG_TIME=`date '+%H:%M:%S'`
    if [ ! -d $LOGDIR ]; then
        mkdir -p $LOGDIR || $LOGDIR="/var/tmp"
    fi
    if [ -z "${LOGFILE-}" ]; then
        LOGFILE="${LOGDIR}/${LOG_DATE}_`basename $0 .sh`.log"
    fi
    # ログ出力実行
    printf "%-10s %-8s [%-4s] %s: %s\n" \
    "${LOG_DATE}" "${LOG_TIME}" "${PRIO}" "${PGNAME}" "${MSG}" >> ${LOGFILE}
}


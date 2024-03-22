#==============================================
# sendmail関数
#==============================================
# 
function Mail_Send() {
    from="$1"
    to="$2"
    cc="$3"
    subject="$4"
    contents="$5"

    inputEncoding="utf-8"
    outputEncoding="iso-2022-jp"

    subjectHead="=?$outputEncoding?B?"
    subjectBody="`echo "$subject" | iconv -f $inputEncoding -t $outputEncoding | base64 | tr -d '\n'`"
    subjectTail="?="
    fullSubject="${subjectHead}${subjectBody}${subjectTail}"

    mail_ex_Headers='MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
'
    mailHeaders="Subject: $fullSubject
From: $from
To: $to

"

    mailContents="`echo -e $contents | iconv -f $inputEncoding -t $outputEncoding`"

    echo "${mail_ex_Headers}${mailHeaders}${mailContents}" | sendmail -t -f ${from}
    return $?
}

 mlexit=-1
if melos exec --scope="*template*" --fail-fast -- flutter test test/app_test.dart --machine --no-pub;
then
    mlexit=0
else
    mlexit=1
    melos exec --scope="*template*" --fail-fast -- flutter test test/app_test.dart --machine --no-pub &> ./coverage/__m.b
    mlgrep=$(grep -Ev '{"|melos|flutter test|1 packages|exit code 1' ./coverage/__m.b)
    mlawk=$(echo $mlgrep | awk '{ printf("%s\\\\\\\\n", $0) }')
    secondString="\""
    replaceString="\\\\\""
    # ssb=$(echo "${$mlawk//$secondString/$replaceString}")
    ssb=$(echo $mlawk | sed -e "s/${secondString}/${replaceString}/g")
    echo $ssb
    echo "{\"logs\":\"${ssb}\"}" > ./coverage/log_run_app.json
    rm ./coverage/__m.b
fi
echo $mlexit
exit $mlexit
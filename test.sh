mlexit=-1
if melos exec --scope="*template*" --fail-fast -- flutter test test/app_test.dart --machine;
then
    mlexit=0
else
    mlexit=1
    melos exec --scope="*template*" --fail-fast -- flutter test test/app_test.dart --machine &> ./__m.b
    mlgrep=$(grep -Ev '{"|melos|flutter test|1 packages|exit code 1' ./__m.b)
    mlawk=$(echo $mlgrep | awk '{ printf("%s\\\\\\\\n", $0) }')
    secondString="\""
    replaceString="\\\\\""
    ssb=$(echo "${mlawk//$secondString/$replaceString}")
    echo "{\"logs\":\"${ssb}\"}" > ./log_run_app.json
    rm ./__m.b
fi
echo $mlexit
exit $mlexit
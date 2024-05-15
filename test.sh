# cat ./coverage/_log.txt | awk '{ printf("%s\\\\\\\\n", $0) }' > ./log.txt
# firstString=$(cat ./log.txt)
# secondString="\""
# replaceString="\\\\\""
# ssb=$(echo "${firstString//$secondString/$replaceString}")
# echo "{\"logs\":\"${ssb}\"}" > log.json


melos exec --scope="*template*" --fail-fast -- flutter test test/app_test.dart --machine &> ./__m.b
mlgrep=$(grep -Ev '{"|melos|flutter test|1 packages|exit code 1' ./__m.b)
mlawk=$(echo $mlgrep | awk '{ printf("%s\\\\\\\\n", $0) }')
secondString="\""
replaceString="\\\\\""
ssb=$(echo "${mlawk//$secondString/$replaceString}")
echo "{\"logs\":\"${ssb}\"}" > ./log_run_app.json
rm ./__m.b
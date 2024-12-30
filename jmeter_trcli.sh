clear

bold=$(tput bold)
TRCLI_CONFIG_PATH="C:\Users\patri\Documents\GitRepo\Performance Samples\jmeter_TR_integration\trcli-config.yml"
JMETER_RESULTS="C:\Program Files\apache-jmeter-5.6.3\bin\samples\sample_results.xml"

echo "($bold)-------------------------------------"
echo "($bold)--- JMeter TestRail Sample Project --"
echo "($bold)-------------------------------------"

echo "($bold)... verify if TRCLI is installed:"

echo
trcli
echo

echo "($bold)... execute JMeter Load Test:"
echo

./jmeter.bat --nongui --testfile "jmeter_TR_integration\jmeter_perf_test.jmx"
echo

echo "($bold)... executing TestRail TRCLI to upload results in a new Test Run:"
echo

trcli --yes --config "$TRCLI_CONFIG_PATH" parse_junit --file "$JMETER_RESULTS" --title "JMeter Demo"
echo

echo "($bold)... execution completed. New Test Run created."
echo -n "What is your org ID? "
read org

sed -i "s/LOCAL_ORG = .*$/LOCAL_ORG = '$org'/" correlate.py

docker cp correlate.py comparison-server:/correlate.py

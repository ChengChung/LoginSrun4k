#!/bin/sh

retry=0
max_retry=5
http_status=0
username=XXXX
password=YYYY
bpwd={B}`echo $password|base64`

while true; do
        if [ "$retry" -lt "$max_retry" ] ; then
                http_status="$(curl -s -o /dev/null -m 2 -w %{http_code} http://portal.joshu.moe/generate_204 -k)"
                date
                echo "http status is $http_status"
                if [ "$http_status" != "204" ] ; then
                        date
                        curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.9 Safari/537.36" -d "action=login&username="$username"&password="$bpwd"&ac_id=1&ajax=1&nas_ip=&user_ip=&user_mac=&save_me=1" "https://gw.buaa.edu.cn:801/include/auth_action.php" -k
                        echo "\n"
                        sleep 2
                else
                        break
                fi
                retry=`expr $retry + 1`
        else
                break
        fi
done

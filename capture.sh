# shellcheck disable=SC2046
(cd /ip-cam/ && openRTSP -D 1 -B 10000000 -b 10000000 -4 -Q -F "capture-$MAP_ID-" -d 60 -P 60 -t -u admin a12345678 rtsp://192.168.68.242:554/onvif1)

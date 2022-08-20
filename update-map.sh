# shellcheck disable=SC2046
rm $(find /ip-cam/ -type f -name "capture-$MAP_ID-*")
cd /ip-cam/ && openRTSP -D 1 -B 10000000 -b 10000000 -q -Q -F "capture-$MAP_ID-" -d 60 -P 60 -t -u admin a12345678 rtsp://192.168.68.242:554/onvif1

./run_video_slam --auto-term -v ./orb_vocab.fbow \
 -m ${MOVIE_PATH} -c ../example/aist/equirectangular.yaml \
  --frame-skip 3 --no-sleep --map-db /maps/map-${MAP_ID}.msg


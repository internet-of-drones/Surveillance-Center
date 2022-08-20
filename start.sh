cd ~ || exit 0
git clone https://github.com/stella-cv/stella_vslam.git
cd stella_vslam || exit 0
git submodule update -i --recursive
docker build -t stella_vslam-desktop -f Dockerfile.desktop .
cd ~/Surveillance-Center && \
docker build -t surveillancecenter .
DISPLAY=$(docker inspect cy-open | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress")":0.0"
export MAP_ID="12"
# shellcheck disable=SC2046
rm $(find /ip-cam/ -type f -name "capture-$MAP_ID-*")
(mkdir /ip-cam/ || true) && cd /ip-cam/ && openRTSP -D 1 -B 10000000 -b 10000000 -q -Q -F capture-$MAP_ID- -d 60 -P 60 -t -u admin a12345678 rtsp://192.168.68.242:554/onvif1
record=$(find /ip-cam/ -type f -name "capture-$MAP_ID-*")
# --entrypoint=bash \
docker run -it --rm \
 -e DISPLAY="$DISPLAY" \
 -e MAP_ID="$MAP_ID" \
 -e MOVIE_PATH="$record" \
 -v "$(pwd)"/maps/:/maps/ \
 -v "/ip-cam/:/ip-cam/" \
  surveillancecenter update-map.sh
#
docker run -it --rm \
 -e DISPLAY="$DISPLAY" \
 -e MAP_ID="$MAP_ID" \
 -e MOVIE_PATH="$record" \
 -v "$(pwd)"/maps/:/maps/ \
 -v "/ip-cam/:/ip-cam/" \
  surveillancecenter localize.sh
#

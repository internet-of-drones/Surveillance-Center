cd ~ || exit 0
git clone https://github.com/stella-cv/stella_vslam.git
cd stella_vslam || exit 0
git submodule update -i --recursive
docker build -t stella_vslam-desktop -f Dockerfile.desktop .
cd ~/Surveillance-Center && \
docker build -t surveillancecenter .
DISPLAY=$(docker inspect cy-open | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress")":0.0"
export MAP_ID="12"
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

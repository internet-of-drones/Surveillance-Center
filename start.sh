cd ~ || exit 0
git clone https://github.com/stella-cv/stella_vslam.git
cd stella_vslam || exit 0
git submodule update -i --recursive
docker build -t stella_vslam-desktop -f Dockerfile.desktop .
cd ~/Surveillance-Center && \
docker build -t surveillancecenter .
DISPLAY=$(docker inspect cy-open | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress")":0.0"
export MAP_ID="12"
docker run -it --rm \
 -e DISPLAY="$DISPLAY" \
 -e MAP_ID="$MAP_ID" \
 -e MOVIE_PATH="/stella_vslam/build/aist_living_lab_1/video.mp4" \
 -v /tmp/.X11-unix/:/tmp/.X11-unix:ro \
 -v "$(pwd)"/maps/:/maps/ \
  surveillancecenter update-map.sh
#
docker run -it --rm \
 -e DISPLAY="$DISPLAY" \
 -e MAP_ID="$MAP_ID " \
 -e MOVIE_PATH="/stella_vslam/build/aist_living_lab_2/video.mp4" \
 -v /tmp/.X11-unix/:/tmp/.X11-unix:ro \
 -v "$(pwd)"/maps/:/maps/ \
  surveillancecenter localize.sh
#

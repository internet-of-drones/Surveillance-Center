cd ~
git clone https://github.com/stella-cv/stella_vslam.git
cd stella_vslam
git submodule update -i --recursive
docker build -t stella_vslam-desktop -f Dockerfile.desktop .
cd ~/Surveillance-Center && \
docker build -t surveillancecenter .
DISPLAY=$(docker inspect cy-open | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress")":0.0"
docker run -it --rm -e DISPLAY="$DISPLAY" -v /tmp/.X11-unix/:/tmp/.X11-unix:ro surveillancecenter

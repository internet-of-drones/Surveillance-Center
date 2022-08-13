cd ~
git clone https://github.com/stella-cv/stella_vslam.git
cd stella_vslam
git submodule update -i --recursive
docker build -t stella_vslam-desktop -f Dockerfile.desktop .
docker build .

./run_video_slam --auto-term -v ./orb_vocab.fbow \
 -m ./aist_living_lab_1/video.mp4 -c ../example/aist/equirectangular.yaml \
  --frame-skip 3 --no-sleep --map-db map.msg

./run_video_slam --load-map \
    -v ./orb_vocab.fbow \
    -c ../example/aist/equirectangular.yaml \
    -m ./aist_living_lab_2/video.mp4 \
    --frame-skip 3 \
    --map-db map.msg

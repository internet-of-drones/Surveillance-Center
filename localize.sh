./run_video_slam --load-map \
    -v ./orb_vocab.fbow \
    -c ../example/aist/equirectangular.yaml \
    -m ./aist_living_lab_2/video.mp4 \
    --frame-skip 3 \
    --map-db /maps/map-${MAP_ID}.msg

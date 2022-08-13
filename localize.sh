./run_video_slam --auto-term --load-map --disable-mapping \
    -v ./orb_vocab.fbow \
    -c ../example/aist/equirectangular.yaml \
    -m ${MOVIE_PATH} \
    --frame-skip 3 \
    --map-db /maps/map-${MAP_ID}.msg

./run_video_slam --auto-term -v ./orb_vocab.fbow \
 -m ${MOVIE_PATH} -c ../example/aist/equirectangular.yaml \
  --frame-skip 3 --no-sleep --map-db /maps/map-${MAP_ID}.msg


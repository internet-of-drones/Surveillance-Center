FROM stella_vslam-desktop:latest

RUN curl -sL "https://github.com/stella-cv/FBoW_orb_vocab/raw/main/orb_vocab.fbow" -o orb_vocab.fbow
RUN mkdir /tmp/cookie && export FILE_ID="1d8kADKWBptEqTF7jEVhKatBEdN7g0ikY" && \
   curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null && \
   CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)" && \
   curl -sLb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o aist_living_lab_1.zip && \
   unzip aist_living_lab_1.zip



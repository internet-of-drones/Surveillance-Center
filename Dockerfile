FROM stella_vslam-desktop:latest

RUN curl -sL "https://github.com/stella-cv/FBoW_orb_vocab/raw/main/orb_vocab.fbow" -o orb_vocab.fbow
RUN apt update && apt install -y python3-pip
RUN pip3 install gdown
RUN export FILE_ID="1d8kADKWBptEqTF7jEVhKatBEdN7g0ikY" && gdown "https://drive.google.com/uc?id=${FILE_ID}" -O aist_living_lab_1.zip && \
  unzip aist_living_lab_1.zip

RUN export FILE_ID="1TVf2D2QvMZPHsFoTb7HNxbXclPoFMGLX" && gdown "https://drive.google.com/uc?id=${FILE_ID}" -O aist_living_lab_2.zip && \
  unzip aist_living_lab_2.zip
RUN apt-get install livemedia-utils -y

RUN mkdir /maps/
COPY update-map.sh .
COPY localize.sh .
COPY capture.sh .
COPY start.sh .

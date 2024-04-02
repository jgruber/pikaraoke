FROM ubuntu:22.04
WORKDIR /
RUN export DEBIAN_FRONTEN=noninteractive &&\
apt update && apt install -y software-properties-common &&\
add-apt-repository ppa:ubuntuhandbook1/ffmpeg6 &&\
apt install -y ffmpeg git python3-pip python3-venv

RUN mkdir -p /media/karaoke &&\
mkdir /pikaraoke

WORKDIR /pikaraoke
COPY . /pikaraoke/
RUN python3 -m venv .venv
RUN . /pikaraoke/.venv/bin/activate && pip install -r requirements.txt

ENTRYPOINT  ["/pikaraoke/pikaraoke.sh", "--headless"]  

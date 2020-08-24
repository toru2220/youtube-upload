FROM	python:3.7.9-slim

RUN	apt-get update && \
	apt-get install -y --no-install-recommends bash unzip git wget curl  && \
	rm -rf /var/lib/apt/lists/*

RUN	pip install --upgrade google-api-python-client oauth2client progressbar2

RUN	wget https://github.com/tokland/youtube-upload/archive/master.zip && \
	unzip master.zip && \
	cd youtube-upload-master && \
	python setup.py install && \
	cp bin/* /usr/bin/. && \
	cp examples/* /usr/bin/. && \
	chmod +x /usr/bin/split_video_for_youtube.sh && \
	chmod +x /usr/bin/youtube-upload

WORKDIR /data

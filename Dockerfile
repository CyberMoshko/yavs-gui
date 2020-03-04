FROM ubuntu:18.04

ENV LANG C.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL C.UTF-8  

RUN apt update && apt full-upgrade
RUN apt install -y python3-flask


COPY . /root/yavs-gui
RUN cd /root/yavs-gui

RUN /root/yavs-gui/install.sh
WORKDIR /root/yavs-gui

ENV FLASK_APP app.py

EXPOSE 8000
CMD ["/bin/bash", "-c", "gunicorn --bind=0.0.0.0:8001 app:app"]
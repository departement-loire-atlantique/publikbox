FROM debian:buster

LABEL maintainer="lissy.barro@loire-atlantique.fr"
LABEL Description="image docker to install publik with ansible"

EXPOSE 80 443

RUN apt update && apt install -y git ansible sudo postgresql dos2unix

RUN useradd -m publik --groups sudo --shell /bin/bash
RUN echo 'publik:publik' | chpasswd

COPY ./install.sh /
RUN dos2unix /install.sh
RUN chmod +x /install.sh

ENTRYPOINT [ "/install.sh" ]
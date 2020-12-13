FROM debian:buster

LABEL maintainer="lissy.barro@loire-atlantique.fr"
LABEL Description="image docker to install publik with ansible"

EXPOSE 80 443

RUN apt update && apt install -y git ansible sudo postgresql dos2unix python

RUN useradd -m publik --groups sudo --shell /bin/bash
RUN echo 'publik:publik' | chpasswd

COPY ./install.sh ./inventory.yml ./base-packages-playbook.yml /

RUN sudo runuser -l publik -c 'ansible-playbook -i /inventory.yml /base-packages-playbook.yml -e ansible_sudo_pass=publik'

RUN dos2unix /install.sh
RUN chmod +x /install.sh

ENTRYPOINT [ "/install.sh" ]
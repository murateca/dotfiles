FROM ubuntu

ARG username=murat

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get clean

RUN \
	apt-get -y install vim && \
  apt-get -y install git && \
  apt-get -y install curl && \
  apt-get -y install zsh

RUN useradd -ms /bin/bash $username
RUN chown -R $username:$username /home/$username

ADD ./ /home/$username/dotfiles/

USER $username
WORKDIR /home/$username

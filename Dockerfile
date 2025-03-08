FROM ubuntu:24.04

LABEL org.opencontainers.image.authors="Gerundium <gerundium@mailbox.org"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.source="https://github.com/gerundium/docker-xelatex"
LABEL org.opencontainers.image.title="gerundium/docker-xelatex"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.description="Docker image for compiling XeLaTeX documents"

ENV DEBIAN_FRONTEND="noninteractive"

# Install all TeX and LaTeX dependencies
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  ca-certificates \
  git \
  html2text \
  inotify-tools \
  lmodern \
  make \
  texlive-extra-utils \
  texlive-fonts-recommended \
  texlive-fonts-extra \
  texlive-lang-english \
  texlive-lang-portuguese \
  texlive-plain-generic \
  texlive-xetex \
  fonts-roboto-slab && \
  apt-get autoclean && apt-get --purge --yes autoremove

# Export the output data
WORKDIR /data
VOLUME ["/data"]

FROM alpine:3.13.5

WORKDIR /root
COPY ./ /root/.diarysrc/

ENV DIARY_EDITOR=/usr/bin/nano
ENV DIARY_AUTHOR=alpine
ENV PATH="${PATH}:/root/.diarysrc/src/"
ENV UBUNTU=false

RUN apk add nano \
    && apk add bash \
    && touch /root/.bashrc \
    && /root/.diarysrc/install.sh

CMD ["/bin/bash"]

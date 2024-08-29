FROM ubuntu:22.04

LABEL maintainer="jip@tenasi.de"

ENV OS_RELEASE=22.04 \
    OS_CODENAME=bionic \
    TIMEZONE=Europe/Berlin \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -y --no-install-recommends update && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get -y --no-install-recommends dist-upgrade && \
    apt-get -y --no-install-recommends --fix-missing install tzdata wget \
    curl gnupg software-properties-common openssh-client rsync && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

COPY nanorc zshrc /tmp/

Run apt-get -y --no-install-recommends install zsh && \
    mv /tmp/zshrc /etc/zsh/zshrc && \
    chmod 644 /etc/zsh/zshrc && \
    chown root:root /etc/zsh/zshrc && \
    chsh -s /bin/zsh && \
        echo "SHELL=/bin/zsh" > /etc/default/useradd && \
        touch /etc/skel/.zshrc && \
        apt-get -y --no-install-recommends install nano && \
    mv /tmp/nanorc /etc/nanorc && \
    chmod 644 /etc/nanorc && \
    chown root:root /etc/nanorc

WORKDIR /root

CMD /bin/zsh
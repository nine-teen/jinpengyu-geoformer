FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

ARG UID
ARG GID
ARG USER

RUN groupadd -g ${GID} ${USER} \
  && useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USER} \
  && apt-get update \
  && apt-get install -y \
    bash-completion \
    git \
    git-flow \
    libgl1 \
    libglib2.0-0 \
    man-db \
    python3-pip \
    python3-venv \
    sudo \
    vim \
  && echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} \
  && chmod 0400 /etc/sudoers.d/${USER} \
  && mkdir -p /home/${USER}/app/.venv \
  && chown -R ${UID}:${GID} /home/${USER}/app

WORKDIR /home/${USER}/app

USER ${USER}

CMD [ "sleep", "infinity" ]

FROM ubuntu:18.04

# Install base
RUN apt-get update && apt-get install -y \
    binutils mesa-utils module-init-tools \
    curl \
    wget \
    build-essential \
    libssl-dev \
    python-pip \
    python \
    ssh \
    git \
    vim && \
    apt-get install sudo && \
    apt-get clean 

ENV HOME /home/developer

# Create user 'developer' with password='123456'
RUN useradd -m developer && echo "developer:123456" | chpasswd && adduser developer sudo
RUN sudo chown developer:developer -R $HOME && sudo chmod u+w .

RUN export PYTHON=/usr/bin/python2.7

USER developer

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/bash_completion" ] && \.   "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"

RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm install node                    && \
    npm install -g ganache-cli && \
    npm install -g truffle@4.1.15  && \
    npm install --prefix "$HOME/.nvm/"'

#      npm install --save-dev truffle-hdwallet-provider@1.0.6 && \

WORKDIR $HOME
CMD /bin/bash
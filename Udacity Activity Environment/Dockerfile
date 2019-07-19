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

ENV HOME /home/udacity-student

# Create user 'udacity-student' with password='123456'
RUN useradd -m udacity-student && echo "udacity-student:123456" | chpasswd && adduser udacity-student sudo
RUN sudo chown udacity-student:udacity-student -R $HOME && sudo chmod u+w .

RUN export PYTHON=/usr/bin/python2.7

USER udacity-student

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/bash_completion" ] && \.   "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"

RUN bash -c 'source $HOME/.nvm/nvm.sh   && \
    nvm install node                    && \
    npm install -g ganache-cli && \
    npm install -g truffle@4.1.15  && \
    npm install --prefix "$HOME/.nvm/" && \
    cd "$HOME" && \
    git clone https://github.com/udacity/BCND-C6-Exercises'

COPY ./config-exercise.sh $HOME

WORKDIR $HOME
CMD /bin/bash
FROM ubuntu:18.04

# ENV DEBIAN_FRONTEND noninteractive

RUN cd /etc/apt && \
    sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' sources.list
RUN apt-get update

# RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#     && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
# ENV LANG en_US.utf8

RUN apt-get install -y build-essential python-dev cmake

RUN git clone https://github.com/llvm/llvm-project.git && \
    cd llvm-project && \
    mkdir build && \
    cd build

RUN cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm

RUN make clang

RUN echo "export PATH=$PATH:$HOME/llvm-project/build/bin" >> ~/.profile && \
    source ~/.profile

RUN clang --version

RUN make check-clang

CMD [ "/bin/bash" ]
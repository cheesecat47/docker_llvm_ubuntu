# https://ndb796.tistory.com/96

FROM cheesecat47/clang_ubuntu1804:1.0

# ENV DEBIAN_FRONTEND noninteractive

WORKDIR /
RUN git clone https://github.com/llvm/llvm-project.git && \
	cd /llvm-project && \
    mkdir build
    
WORKDIR /llvm-project/build

RUN cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm

RUN make clang

RUN path=/llvm-project/build/bin && \
	bashrc=~/.bashrc && \
	echo $PATH | grep -q "\(^\|:\)$path\(:\|/\{0,1\}$\)" || echo "PATH=\$PATH:$path" >> "$bashrc"; . "$bashrc"
#	echo "export PATH=$PATH:/llvm-project/build/bin" >> ~/.bashrc && \
#   source ~/.bashrc

RUN cd /llvm-project/build/bin && \
	./clang --version

# RUN make check-clang

RUN apt-get clean

CMD [ "/bin/bash" ]

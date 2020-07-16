#! /bin/bash
docker build -t sslab_clang .
docker run -it --name sslab_clang sslab_clang
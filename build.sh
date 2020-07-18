#! /bin/bash
cd "$(dirname "$0")"

isExist=`docker ps -a | grep sslab_clang`
if [[ "$isExist" == *"Exited"* ]]; then
	docker stop sslab_clang
	docker rm sslab_clang
fi

docker build -t sslab_clang .
docker run -it --name sslab_clang sslab_clang

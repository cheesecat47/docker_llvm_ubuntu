# https://ndb796.tistory.com/96

FROM cheesecat47/clang_ubuntu1804:1.1

# ENV DEBIAN_FRONTEND noninteractive # 이거는 필요하면 검색해보세요

# 도커를 쓰는 이유로 여기에
RUN sudo apt update
# 명령어 순서를 기록해둔다면 다음에 개발 환경을 구성할 때나, 다른 컴퓨터에 구성할 때
# docker build ... 을 한다면 호스트 환경에 상관없이 똑같은 개발환경을 구축할 수 있어요.

# RUN ./test.sh

# Run은 터미널 명령어를 실행하는 명령어입니다. RUN 뒤는 그냥 터미널에서 하는거랑 똑같이 쓰면 돼요
# 여러 명령어를 쓸 땐 명령어 && 명령어 하면 되고, 여러 줄로 나눌 때는 \ 쓰면 됩니다.
# 주의할 점은, 각 RUN 명령어는 독립적인 레이어에서 동작한다는 것입니다.
# 레이어에 대해서는 자세한건 검색해보고, 각 RUN 명령어를 실행할 때마다 PATH가 바뀝니다.
# 예를 들어
# RUN cd ~/test $$ touch test.sh
# RUN ./test.sh # 하면 test.sh를 못 찾아요. test.sh는 ~/test에 있지만, 이 RUN에서는 다시 루트에서 시작하기 때문입니다.

# WORKDIR ~/test
# 그래서 다른 RUN에서 시작할 경로를 정해주려면 이 명령어를 사용합니다.

# RUN ./test.sh # 이제는 test.sh를 실행할 수 있습니다.

# CMD [ "/bin/bash" ] # CMD 명령어는 이미지 빌드가 다 끝나고 컨테이너를 시작할 때 실행할 명령어를 적습니다.

# baseimage
FROM ubuntu

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/Warsaw"

# preparing environment
RUN apt-get update

RUN apt install -qy cmake g++ ninja-build git

# clean up
WORKDIR /
RUN rm -rf /usr/src/scripts


# clone repo

WORKDIR ~
RUN git clone https://github.com/thisconnected/pracainzynierska
RUN git checkout qtcore

# compile

WORKDIR ~/pracainzynierska
RUN cmake -E make_directory $CWD/build
RUN cmake .. -G Ninja
RUN cmake --build .

# run

CMD ctest --output-on-failure





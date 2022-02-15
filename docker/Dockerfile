# baseimage
FROM ubuntu

# preparing environment
RUN apt-get update
RUN apt clean
RUN apt autoremove
RUN apt install -qy cmake g++ ninja-build git

# clean up
WORKDIR /
RUN rm -rf /usr/src/scripts


# clone repo

WORKDIR ~
RUN git clone git@github.com:thisconnected/pracainzynierska.git

# compile

WORKDIR ~/pracainzynierska
RUN cmake -E make_directory $CWD/build
RUN cmake .. -G Ninja
RUN cmake --build .

# run

CMD ctest --output-on-failure




